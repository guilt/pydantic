#!/usr/bin/env bash
# Build pydantic-core for Termux/Android (no PyPI wheel exists for
# android_30_arm64_v8a). Requires maturin (cargo install maturin --locked).
#
# Usage:
#   ./scripts/build-android.sh [out-dir]
#
# Output: <out-dir>/pydantic_core-<ver>-cp<py>-cp<py>-android_30_arm64_v8a.whl
#         (default out-dir: ../../Wheels)

set -euo pipefail

cd "$(dirname "$0")/.."

OUT_DIR="${1:-$(pwd)/../../Wheels}"
mkdir -p "$OUT_DIR"

MATURIN="${MATURIN:-$HOME/.cargo/bin/maturin}"
PYTHON="${PYTHON:-python3}"

"$MATURIN" build --release --out "$OUT_DIR"

echo
echo "Built:"
ls -1 "$OUT_DIR"/pydantic_core-*.whl 2>/dev/null || true
echo
echo "Install with:"
echo "  $PYTHON -m pip install $OUT_DIR/pydantic_core-*.whl pydantic"