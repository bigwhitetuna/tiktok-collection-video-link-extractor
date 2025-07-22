#!/bin/bash
set -e

VERSION=$1
if [ -z "$VERSION" ]; then
  echo "Usage: ./bump-version.sh 1.2.0"
  exit 1
fi

echo "🔧 Bumping version to $VERSION in manifest.firefox.json"
jq ".version = \"$VERSION\"" manifest.firefox.json > tmp.firefox.json && mv tmp.firefox.json manifest.firefox.json

echo "🔧 Bumping version to $VERSION in manifest.chrome.json"
jq ".version = \"$VERSION\"" manifest.chrome.json > tmp.chrome.json && mv tmp.chrome.json manifest.chrome.json

echo "✅ Updated both manifest versions to $VERSION"