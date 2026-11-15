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
            git('rm', '-r', '-f', '--ignore-unmatch', '.', cwd=worktree)
            for source in release.rglob('*'):
                if source.is_file():
                    target = worktree / source.relative_to(release)
                    target.parent.mkdir(parents=True, exist_ok=True)
                    shutil.copyfile(source, target)
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
