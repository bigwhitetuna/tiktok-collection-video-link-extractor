#!/bin/bash
set -e

VERSION=$1
if [ -z "$VERSION" ]; then
  echo "Usage: ./bump-version.sh 1.2.0"
  exit 1
fi

for FILE in manifest.firefox.json manifest.chrome.json; do
  echo "🔧 Bumping version to $VERSION in $FILE"
  jq ".version = \"$VERSION\"" "$FILE" > "tmp.$$.json" && mv "tmp.$$.json" "$FILE"
done

echo "✅ Updated version to $VERSION in both manifests"