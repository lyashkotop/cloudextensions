"""Download the pinned, hash-checked Java build tools (Python standard library only)."""
import argparse
import hashlib
import json
from pathlib import Path
import urllib.request


def main():
    root = Path(__file__).resolve().parents[1]
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--directory", type=Path, default=root / ".tools")
    directory = parser.parse_args().directory
    directory.mkdir(parents=True, exist_ok=True)
    for tool in json.loads((root / "tools/toolchain.json").read_text()):
        target = directory / tool["file"]
        if target.is_file() and hashlib.sha256(target.read_bytes()).hexdigest() == tool["sha256"]:
            continue
        with urllib.request.urlopen(tool["url"], timeout=60) as response:
            data = response.read()
        if hashlib.sha256(data).hexdigest() != tool["sha256"]:
            raise SystemExit("Checksum mismatch: " + tool["file"])
        staged = target.with_suffix(".download")
        staged.write_bytes(data)
        staged.replace(target)
        print(target.name)


if __name__ == "__main__":
    main()
