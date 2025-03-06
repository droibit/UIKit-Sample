#!/bin/sh

# Skip for indexing
if [ "${ACTION}" == "indexbuild" ]; then
  echo "Not running SwiftLint during indexing."
  exit 0 
fi

# Skip for preview builds
if [ "${ENABLE_PREVIEWS}" = "YES" ]; then
  echo "Not running SwiftLint during preview builds."
  exit 0
fi

if ! type "mint" > /dev/null; then
  # Adds support for Apple Silicon brew directory
  # ref. https://stackoverflow.com/a/66003612
  export PATH="$PATH:/opt/homebrew/bin"
fi

PROJECT_GIT_DIR=$1
START_DATE=$(date +"%s")

run_lint() {
  local filepath=$(readlink -f "${PROJECT_GIT_DIR}/${1}")
  xcrun --sdk macosx mint run swiftlint swiftlint "${filepath}"
}

git diff --diff-filter=d --name-only -- "*.swift" | while read filename; do run_lint "${filename}"; done
git diff --cached --diff-filter=d --name-only -- "*.swift" | while read filename; do run_lint "${filename}"; done

END_DATE=$(date +"%s")

DIFF=$(($END_DATE - $START_DATE))
echo "SwiftLint took $(($DIFF / 60)) minutes and $(($DIFF % 60)) seconds to complete."
