#!/bin/bash
# Optional local build script.
# GitHub Actions builds official zips — use this only for local testing.
set -e

EXT_NAME="tiktok-video-link-extractor"

# Clean up old zips
echo "🧹 Cleaning up old zips..."
rm -f ${EXT_NAME}*.zip

# Build for Firefox (manifest v2)
FIREFOX_VERSION=$(jq -r .version manifest.v2.json)
FIREFOX_ZIP="${EXT_NAME}-firefox-v${FIREFOX_VERSION}.zip"

echo "🦊 Building Firefox zip: $FIREFOX_ZIP"
cp manifest.v2.json manifest.json
zip -r "$FIREFOX_ZIP" \
  manifest.json \
  background.js \
  content.js \
  popup.html \
  popup.js \
  icon.png
rm manifest.json

# Build for Chrome (manifest v3)
CHROME_VERSION=$(jq -r .version manifest.v3.json)
CHROME_ZIP="${EXT_NAME}-chrome-v${CHROME_VERSION}.zip"

echo "🧩 Building Chrome zip: $CHROME_ZIP"
cp manifest.v3.json manifest.json
zip -r "$CHROME_ZIP" \
  manifest.json \
  background.js \
  content.js \
  popup.html \
  popup.js \
  icon.png
rm manifest.json

echo "✅ Created:"
echo "  - $FIREFOX_ZIP"
echo "  - $CHROME_ZIP"