from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path

from . import __version__
from .core import SpecError, doctor, generate, replay


def _parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        prog="autotrocq",
        description="Generate axiom-aware Coq relation packages and record kernel replay evidence.",
    )
    parser.add_argument("--version", action="version", version=f"%(prog)s {__version__}")
    commands = parser.add_subparsers(dest="command", required=True)

    generate_parser = commands.add_parser("generate", help="generate a Coq package from a JSON specification")
    generate_parser.add_argument("spec", type=Path)
    generate_parser.add_argument("--out", type=Path, default=Path("build"))

    replay_parser = commands.add_parser("replay", help="compile a generated package and run coqchk")
    replay_parser.add_argument("coq_file", type=Path)
    replay_parser.add_argument("--report", type=Path)

    commands.add_parser("doctor", help="report required executable versions")
    return parser


def main(argv: list[str] | None = None) -> int:
    args = _parser().parse_args(argv)
    try:
        if args.command == "generate":
            result = generate(args.spec, args.out)
            print(json.dumps(result, indent=2, sort_keys=True))
            return 0 if result["policy_outcome"] == "accept" else 2
        if args.command == "replay":
            result = replay(args.coq_file, args.report)
            summary = {
                "module": result["module"],
                "coq_file": result["coq_file"],
                "coq_sha256": result["coq_sha256"],
                "outcome": result["outcome"],
                "coqc_returncode": result["coqc"]["returncode"],
                "coqchk_returncode": (
                    result["coqchk"]["returncode"] if result["coqchk"] else None
                ),
                "report": str(args.report) if args.report else None,
            }
            print(json.dumps(summary, indent=2, sort_keys=True))
            return 0 if result["outcome"] == "kernel_success" else 1
        print(json.dumps(doctor(), indent=2, sort_keys=True))
        return 0
    except SpecError as exc:
        print(f"autotrocq: error: {exc}", file=sys.stderr)
        return 2


if __name__ == "__main__":
    raise SystemExit(main())
