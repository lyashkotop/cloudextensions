#!/usr/bin/env python3
"""Exercise registered CloudStream providers with the JVM SDK and report counts and statuses."""
import argparse
from concurrent.futures import ThreadPoolExecutor, as_completed
from datetime import datetime, timezone
import json
import os
from pathlib import Path
import subprocess
import tempfile
from urllib.parse import urlsplit

from build_repository import ROOT, modules
from kotlin_build import LIBRARIES, compile_sources

RUNTIME = ROOT / 'common/tools/probe-toolchain.json'
FOCUSED = {
    'DarknessPorn', 'EPorner', 'HurtSex', 'NoodleMagazine', 'Ro85', 'Strip2',
    'ThisVid', 'TubeBDSM', 'TubeSafari', 'UKDevilz',
}
QUERIES = {'en': 'woman', 'ru': 'женщина', 'ja': 'カップル'}
STAGES = {
    'home': 'Home', 'search': 'Search', 'next_page': 'Page 2', 'listing_cover': 'Listing image',
    'detail': 'Details', 'tags': 'Tags', 'recommendations': 'Related', 'detail_cover': 'Detail image', 'video': 'Stream',
}


def proxy_options():
    options = []
    for scheme in ('http', 'https'):
        proxy = urlsplit(os.environ.get(f'{scheme.upper()}_PROXY', os.environ.get(f'{scheme}_proxy', '')))
        if proxy.hostname:
            options += [f'-D{scheme}.proxyHost={proxy.hostname}', f'-D{scheme}.proxyPort={proxy.port or 80}']
    return options


def probe(module, libraries, classes, sample_count):
    command = [
        'java', *proxy_options(), '-cp', os.pathsep.join(map(str, [*libraries, classes])),
        'com.cloudextensions.probes.SiteHealthProbeKt', module['entryClass'], QUERIES[module['language']], str(sample_count),
    ]
    status = 'probe_error'
    try:
        process = subprocess.run(command, capture_output=True, timeout=155 + 85 * ((sample_count - 1) // 2))
        log = process.stdout
        if process.returncode == 0:
            status = 'complete'
    except subprocess.TimeoutExpired as error:
        log = error.stdout or b''
        status = 'timeout'
    prefix = 'SITE_HEALTH '
    rows = [json.loads(line.removeprefix(prefix)) for line in log.decode(errors='replace').splitlines() if line.startswith(prefix)]
    checks = {row['stage']: row for row in rows if 'sample' not in row}
    samples = {}
    for row in rows:
        if 'sample' in row:
            samples.setdefault(row['sample'], {})[row['stage']] = row
    report = {'provider': module['id'], 'status': status, 'checks': checks,
              'samples': [{'number': number, 'checks': samples[number]} for number in sorted(samples)]}
    completed = [sample['video']['status'] for sample in samples.values() if 'video' in sample]
    print(module['id'], ' '.join(f'{name}={row["status"]}' for name, row in checks.items()) or status,
          'video samples:', ','.join(completed) or 'none', flush=True)
    return report


def summary(report):
    lines = [
        '## CloudStream source check', '',
        'JVM SDK probes check HTTP responses and file signatures. A sample requiring Android WebView is marked accordingly.',
        f"Up to {report.get('sampleLimit', 2)} distinct cards per source. Filtered cards are skipped for playback.", '',
        '| Source | ' + ' | '.join(STAGES.values()) + ' |',
        '| ' + ' | '.join(['---'] * (len(STAGES) + 1)) + ' |',
    ]
    for site in report['providers']:
        checks = []
        for stage in STAGES:
            rows = [site['checks'][stage]] if stage in site['checks'] else [
                sample['checks'].get(stage) for sample in site['samples']
            ]
            checks.append(' / '.join(format_status(row) for row in rows) or '—')
        lines.append('| ' + ' | '.join([site['provider'], *checks]) + ' |')
    return '\n'.join(lines) + '\n'


def format_status(check):
    if not check:
        return '—'
    status = check['status'].replace('_', ' ')
    return status if check.get('http') is None else f"{status} ({check['http']})"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--tools', type=Path, default=ROOT / '.tools')
    parser.add_argument('--output', type=Path, default=ROOT / '.release/site-health.json')
    parser.add_argument('--selection', choices=('focused', 'all'), default='focused')
    parser.add_argument('--provider', action='append', help='Check a specific internal ID; may be repeated')
    parser.add_argument('--samples', type=int, choices=range(1, 11), default=2, metavar='1–10',
                        help='Number of distinct cards to check per source (default: 2)')
    args = parser.parse_args()
    available = modules()
    selection = set(args.provider) if args.provider else FOCUSED if args.selection == 'focused' else set()
    if selection - {module['id'] for module in available}:
        parser.error('Unknown provider ID')
    selected = [module for module in available if not selection or module['id'] in selection]
    tools = args.tools.resolve()
    runtime = [tools / item['file'] for item in json.loads(RUNTIME.read_text())]
    libraries = [*runtime, *(tools / filename for filename in LIBRARIES)]
    if any(not path.is_file() for path in libraries):
        parser.error('Fetch the build tools and probe-toolchain.json before running the check')

    with tempfile.TemporaryDirectory(prefix='cloudextensions-check-') as directory:
        work = Path(directory)
        common = work / 'common'
        compile_sources(tools, sorted((ROOT / 'common/kotlin').rglob('*.kt')), common)
        harness = work / 'probe'
        compile_sources(tools, [ROOT / 'common/probes' / name for name in ('HostContext.kt', 'SiteHealthProbe.kt')], harness, [common])

        def compile_provider(module):
            classes = work / module['id']
            compile_sources(tools, sorted((module['folder'] / 'src/main/kotlin').rglob('*.kt')), classes, [common])
            return classes

        results = {}
        with ThreadPoolExecutor(3) as compiler, ThreadPoolExecutor(4) as network:
            compiles = {compiler.submit(compile_provider, module): module for module in selected}
            checks = []
            for compiled in as_completed(compiles):
                module = compiles[compiled]
                checks.append(network.submit(probe, module, [harness, *libraries, common], compiled.result(), args.samples))
            for checked in as_completed(checks):
                site = checked.result()
                results[site['provider']] = site

    report = {
        'checkedAt': datetime.now(timezone.utc).isoformat(),
        'sampleLimit': args.samples,
        'providers': [results[module['id']] for module in selected],
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, ensure_ascii=False, indent=2) + '\n')
    step_summary = os.environ.get('GITHUB_STEP_SUMMARY')
    if step_summary:
        with Path(step_summary).open('a') as output:
            output.write(summary(report))


if __name__ == '__main__':
    main()
