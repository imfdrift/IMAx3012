#!/usr/bin/env bash
# Generic build script for any .tex file in this repo, used as a
# workaround for latexmk refusing to build inside iCloud Drive (whose real
# path always contains "com~apple~CloudDocs" — a tilde it won't accept,
# even through a symlink). This script copies the *folder containing the
# target file* to a clean temp location outside iCloud, builds the PDF
# there with latexmk, then copies the finished PDF back next to the
# source so it shows up in the normal (iCloud-synced) place.
#
# Note: .aux/.bbl/etc. from the source folder ARE copied along (not
# excluded) because fremdriftsplan.tex in Compendium/ cross-references
# IMAX3012.aux via xr-hyper. Build IMAX3012.tex first so that file exists
# and is up to date before building fremdriftsplan.tex.
#
# Usage (manual):      bash build.sh /full/path/to/file      (no .tex extension needed)
# Usage (VSCode/LaTeX Workshop): configured via .vscode/settings.json to pass %DOC%

set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Usage: bash build.sh /full/path/to/file (without .tex extension)"
  exit 1
fi

DOC="$1"                                   # e.g. /path/to/Compendium/IMAX3012
SRC_DIR="$(cd "$(dirname "$DOC")" && pwd)"
MAIN="$(basename "$DOC")"
SAFE_NAME="$(basename "$SRC_DIR")-$MAIN"
BUILD_DIR="$HOME/.latex-builds/$SAFE_NAME"

echo "Source:  $SRC_DIR/$MAIN.tex"
echo "Build:   $BUILD_DIR (outside iCloud, safe for latexmk)"

mkdir -p "$BUILD_DIR"
rsync -a --delete \
  --exclude '*.pdf' --exclude 'build.sh' \
  "$SRC_DIR"/ "$BUILD_DIR"/

cd "$BUILD_DIR"
latexmk -pdf -interaction=nonstopmode -halt-on-error "$MAIN.tex"

cp "$BUILD_DIR/$MAIN.pdf" "$SRC_DIR/$MAIN.pdf"
echo ""
echo "Done. PDF copied back to: $SRC_DIR/$MAIN.pdf"
