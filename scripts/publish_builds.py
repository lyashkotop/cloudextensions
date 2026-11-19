#!/usr/bin/env python3
"""Publish a validated release to builds with a regular fast-forward git push."""
import argparse
import json
from pathlib import Path
import shutil
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]


def git(*args, cwd=ROOT, capture=False):
    return subprocess.run(['git', *args], cwd=cwd, check=True, text=True, capture_output=capture).stdout


def previous_versions(worktree, release):
    """Keep URLs for the two recent package versions that cached indices might still reference."""
    saved = {}
    for current in (release / 'packages').glob('*/*/*.cs3'):
        relative = current.relative_to(release)
        version = current.parent.name
        if not version.isdecimal():
            raise ValueError(f'Invalid package version: {current.name}')
        existing = worktree / relative
        if existing.is_file() and existing.read_bytes() != current.read_bytes():
            raise ValueError(f'Package version already exists with different contents: {relative}')
        old = sorted(
            (path for path in (worktree / 'packages').glob(f'*/*/{current.name}')
             if path.parent.name.isdecimal() and 0 < int(path.parent.name) < int(version)),
            key=lambda path: int(path.parent.name), reverse=True,
        )
        for path in old[:2]:
            saved[path.relative_to(worktree)] = path.read_bytes()
    return saved


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--release', type=Path, default=ROOT / '.release')
    args = parser.parse_args()
    release = args.release.resolve()
    if not (release / 'plugins.json').is_file() or not (release / 'build-info.json').is_file():
        raise SystemExit('Build the release before publishing')
    info = json.loads((release / 'build-info.json').read_text())
    if info['plugins'] < 1:
        raise SystemExit('Refusing to publish an empty index')
    config = json.loads((ROOT / 'repository.json').read_text())
    branch = config['buildsBranch']
    remote = git('ls-remote', '--heads', 'origin', 'refs/heads/' + branch, capture=True).strip()
    with tempfile.TemporaryDirectory(prefix='cloudextensions-publish-') as name:
        worktree = Path(name) / 'builds'
        attached = False
        try:
            if remote:
                git('fetch', 'origin', branch)
                git('worktree', 'add', '--detach', str(worktree), 'FETCH_HEAD')
            else:
                git('worktree', 'add', '--detach', str(worktree), 'HEAD')
            attached = True
            if not remote:
                git('switch', '--orphan', 'publish-builds', cwd=worktree)
            old_info = worktree / 'build-info.json'
            if remote and old_info.is_file() and json.loads(old_info.read_text())['version'] > info['version']:
                raise ValueError('A newer release is already published')
            retained = previous_versions(worktree, release)
            git('rm', '-r', '-f', '--ignore-unmatch', '.', cwd=worktree)
            for source in release.rglob('*'):
                if source.is_file():
                    target = worktree / source.relative_to(release)
                    target.parent.mkdir(parents=True, exist_ok=True)
                    shutil.copyfile(source, target)
            for path, contents in retained.items():
                target = worktree / path
                target.parent.mkdir(parents=True, exist_ok=True)
                target.write_bytes(contents)
            git('add', '--all', cwd=worktree)
            changes = subprocess.run(['git', 'diff', '--cached', '--quiet'], cwd=worktree)
            if changes.returncode == 0:
                print('Builds already match this source revision')
                return
            if changes.returncode != 1:
                raise SystemExit('Cannot inspect release changes')
            git('-c', 'user.name=github-actions[bot]', '-c', 'user.email=41898282+github-actions[bot]@users.noreply.github.com',
                'commit', '-m', f'Publish plugins v{info["version"]} from {info["sourceCommit"]}', cwd=worktree)
            git('push', 'origin', 'HEAD:refs/heads/' + branch, cwd=worktree)
        finally:
            if attached:
                git('worktree', 'remove', '--force', str(worktree))
    print('Published branch: ' + branch)


if __name__ == '__main__':
    main()
