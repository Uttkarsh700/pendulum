#!/bin/sh
set -eu

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 {base|new}"
    exit 1
fi

case "$1" in
base)
    # Run the comparison file but exclude the new regression test that
    # doesn't exist in the base commit.
    poetry run pytest -q tests/datetime/test_comparison.py -k "not less_than_with_fold"
    ;;
new)
    # Run the full file including the new regression test.
    poetry run pytest -q tests/datetime/test_comparison.py
    ;;
*)
    echo "Usage: $0 {base|new}"
    exit 1
    ;;
esac

