#!/usr/bin/env python3
"""Compatibility entry point: build all language-grouped modules from the repository root."""
from pathlib import Path
import runpy

if __name__ == '__main__':
    runpy.run_path(str(Path(__file__).resolve().parents[1] / 'scripts/build_repository.py'), run_name='__main__')
