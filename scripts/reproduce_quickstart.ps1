$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$build = Join-Path $root "build\quickstart"
$report = Join-Path $build "BoolNatSection.replay.json"

python -m pip install -e $root
autotrocq doctor
autotrocq generate (Join-Path $root "examples\bool_nat_section.json") --out $build
autotrocq replay (Join-Path $build "BoolNatSection.v") --report $report
python -m unittest discover -s (Join-Path $root "tests") -v

Write-Host "Quickstart completed successfully."
Write-Host "Replay report: $report"

