from __future__ import annotations

import csv
import hashlib
import os
from pathlib import Path


def canonical_bytes(path: Path) -> bytes:
    content = path.read_bytes()
    if b"\0" in content:
        return content
    try:
        text = content.decode("utf-8")
    except UnicodeDecodeError:
        return content
    return text.replace("\r\n", "\n").replace("\r", "\n").encode("utf-8")


def main() -> None:
    root = Path(__file__).resolve().parents[1]
    output = root / "MANIFEST_SHA256.csv"
    files: list[Path] = []
    skipped_dirs = {
        ".git",
        "build",
        "dist",
        "__pycache__",
        ".pytest_cache",
        ".lia.cache",
    }
    skipped_suffixes = (".pyc", ".aux", ".vo", ".vok", ".vos", ".glob")
    for directory, dirnames, filenames in os.walk(root):
        dirnames[:] = [
            name
            for name in dirnames
            if name not in skipped_dirs and not name.endswith(".egg-info")
        ]
        parent = Path(directory)
        for filename in filenames:
            path = parent / filename
            if (
                path != output
                and filename != ".lia.cache"
                and not filename.endswith(skipped_suffixes)
            ):
                files.append(path)
    files.sort()
    with output.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.writer(handle, lineterminator="\n")
        writer.writerow(("path", "bytes", "sha256"))
        for path in files:
            content = canonical_bytes(path)
            writer.writerow((
                path.relative_to(root).as_posix(),
                len(content),
                hashlib.sha256(content).hexdigest(),
            ))
    print(f"wrote {len(files)} entries to {output}")


if __name__ == "__main__":
    main()
