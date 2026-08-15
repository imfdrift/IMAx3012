#!/usr/bin/env bash
# Plan B build script — use this if the ~/IMAx3012 symlink workaround still
# fails with "contains character not allowed for TeX file".
#
# Why: this project lives in iCloud Drive, whose real path always contains
# "com~apple~CloudDocs". latexmk refuses to build when the FULL resolved
# path contains a tilde. This script sidesteps the problem entirely by
# copying the Compendium sources to a clean temp folder outside iCloud,
# building there, and copying the resulting PDF back next to the sources
# so it shows up in this same (iCloud-synced) folder as usual.
#
# Usage: open a terminal in this folder and run:  bash build.sh
# (On first use you may need: chmod +x build.sh)

set -euo pipefail

SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUILD_DIR="$HOME/.latex-builds/IMAx3012-Compendium"
MAIN=IMAX3012

echo "Source:  $SRC_DIR"
echo "Build:   $BUILD_DIR (outside iCloud, safe for latexmk)"

mkdir -p "$BUILD_DIR"
# Mirror sources into the clean build dir (excludes previous build output/aux junk)
rsync -a --delete \
  --exclude '*.aux' --exclude '*.log' --exclude '*.out' --exclude '*.toc' \
  --exclude '*.bbl' --exclude '*.blg' --exclude '*.fls' --exclude '*.fdb_latexmk' \
  --exclude '*.pdf' --exclude 'build.sh' \
  "$SRC_DIR"/ "$BUILD_DIR"/

cd "$BUILD_DIR"
latexmk -pdf -interaction=nonstopmode -halt-on-error "$MAIN.tex"

cp "$BUILD_DIR/$MAIN.pdf" "$SRC_DIR/$MAIN.pdf"
echo ""
echo "Done. PDF copied back to: $SRC_DIR/$MAIN.pdf"
