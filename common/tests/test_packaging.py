"""Real assembler failure must preserve an existing package."""
import argparse
from pathlib import Path
import sys
import tempfile

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from tools import build


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--tools", type=Path, required=True)
    tools = parser.parse_args().tools.resolve()
    original_root = build.ROOT
    try:
        with tempfile.TemporaryDirectory() as name:
            root = Path(name)
            (root / "smali").mkdir()
            (root / "smali/Broken.smali").write_text(
                ".class public LBroken;\n.super Ljava/lang/Object;\n"
                ".method public static broken()V\n.registers 0\ninvalid-opcode\n.end method\n")
            target = root / "StreamBundle-v64.cs3"
            target.write_bytes(b"previous-valid-artifact")
            build.ROOT = root
            try:
                build.package(str(tools / "*"), root)
            except SystemExit as error:
                assert "DEX assembly failed" in str(error), error
            else:
                raise AssertionError("Invalid smali was accepted")
            assert target.read_bytes() == b"previous-valid-artifact"
            print("PASS real assembler failure preserves the existing artifact")
    finally:
        build.ROOT = original_root


if __name__ == "__main__":
    main()
