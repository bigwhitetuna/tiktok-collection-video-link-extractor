#!/bin/bash
set -e

VERSION=$1
if [ -z "$VERSION" ]; then
  echo "Usage: ./bump-version.sh 1.2.0"
  exit 1
fi

echo "🔧 Bumping version to $VERSION in manifest.json"
jq ".version = \"$VERSION\"" manifest.json > tmp.$$.json && mv tmp.$$.json manifest.json