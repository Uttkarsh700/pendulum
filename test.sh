#!/bin/sh
# POSIX shell script for Olympus test runner.
# Usage:
#   ./test.sh base
#   ./test.sh new
# This script runs only the regression test and does not install packages.
set -eu

if [ "$#" -ne 1 ]; then
  printf 'Usage: %s [base|new]\n' "$0" >&2
  exit 2
fi

case "$1" in
  base|new)
    ;;
  *)
    printf 'Invalid argument: %s\n' "$1" >&2
    printf 'Usage: %s [base|new]\n' "$0" >&2
    exit 2
    ;;
esac

poetry run pytest -q tests/datetime/test_comparison.py::test_less_than_with_fold
exit $?
