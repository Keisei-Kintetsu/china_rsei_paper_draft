#!/bin/sh

set -eu

copy_file() {
  src=$1
  dst=$2

  if cp "$src" "$dst" 2>/dev/null; then
    return 0
  fi

  dst_dir=$(dirname "$dst")
  base_name=$(basename "$src")

  mkdir -p "$dst_dir"
  osascript -e "tell application \"Finder\" to duplicate POSIX file \"$src\" to POSIX file \"$dst_dir/\" with replacing"

  if [ "$dst" != "$dst_dir/$base_name" ] && [ -f "$dst_dir/$base_name" ]; then
    mv "$dst_dir/$base_name" "$dst"
  fi
}

usage() {
  echo "Usage: sh scripts/publish_draft.sh /path/to/draft_dir [version_tag]"
  echo "Expected files inside draft_dir: main.pdf and supplementary.pdf"
}

if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
  usage
  exit 1
fi

SOURCE_DIR=$1
VERSION_TAG=${2:-$(basename "$SOURCE_DIR")}
REPO_ROOT=$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)

MAIN_SRC="$SOURCE_DIR/main.pdf"
SUPP_SRC="$SOURCE_DIR/supplementary.pdf"

if [ ! -f "$MAIN_SRC" ]; then
  echo "Missing file: $MAIN_SRC"
  exit 1
fi

if [ ! -f "$SUPP_SRC" ]; then
  echo "Missing file: $SUPP_SRC"
  exit 1
fi

LATEST_DIR="$REPO_ROOT/latest"
VERSION_DIR="$REPO_ROOT/versions/$VERSION_TAG"

mkdir -p "$LATEST_DIR" "$VERSION_DIR"

copy_file "$MAIN_SRC" "$LATEST_DIR/main.pdf"
copy_file "$SUPP_SRC" "$LATEST_DIR/supplementary.pdf"
copy_file "$MAIN_SRC" "$VERSION_DIR/main.pdf"
copy_file "$SUPP_SRC" "$VERSION_DIR/supplementary.pdf"

git -C "$REPO_ROOT" add latest versions

if git -C "$REPO_ROOT" diff --cached --quiet; then
  echo "No file changes detected. Nothing to commit."
  exit 0
fi

git -C "$REPO_ROOT" commit -m "Publish draft $VERSION_TAG"
git -C "$REPO_ROOT" push

REMOTE_URL=$(git -C "$REPO_ROOT" remote get-url origin)

case "$REMOTE_URL" in
  git@github.com:*)
    WEB_BASE="https://github.com/${REMOTE_URL#git@github.com:}"
    WEB_BASE=${WEB_BASE%.git}
    ;;
  https://github.com/*)
    WEB_BASE=${REMOTE_URL%.git}
    ;;
  *)
    WEB_BASE="$REMOTE_URL"
    ;;
esac

echo
echo "Published version: $VERSION_TAG"
echo "Repository: $WEB_BASE"
echo "Latest main draft: $WEB_BASE/blob/main/latest/main.pdf"
echo "Latest supplementary: $WEB_BASE/blob/main/latest/supplementary.pdf"
