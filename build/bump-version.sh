#!/bin/bash
set -e

VERSION=$1
if [ -z "$VERSION" ]; then
  echo "Usage: ./bump-version.sh 1.2.0"
  exit 1
fi

echo "🔧 Bumping version to $VERSION in manifest.v2.json"
jq ".version = \"$VERSION\"" manifest.v2.json > tmp.v2.json && mv tmp.v2.json manifest.v2.json

echo "🔧 Bumping version to $VERSION in manifest.v3.json"
jq ".version = \"$VERSION\"" manifest.v3.json > tmp.v3.json && mv tmp.v3.json manifest.v3.json

echo "✅ Updated both manifest versions to $VERSION"