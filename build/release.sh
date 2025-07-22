#!/bin/bash
set -e

VERSION=$1
if [[ -z "$VERSION" ]]; then
  echo "❌ Usage: ./release.sh 1.2.3"
  exit 1
fi

TAG="v$VERSION"

# Step 1: Bump version
echo "🔧 Bumping version to $VERSION..."
./bump-version.sh "$VERSION"

# Step 2: Git commit
echo "📦 Committing version bump..."
git add manifest.v2.json manifest.v3.json
git commit -m "🔖 Bump version to $VERSION"

# Step 3: Create Git tag
echo "🏷️  Creating git tag $TAG..."
git tag "$TAG"

# Step 4: Push commit and tag
echo "🚀 Pushing commit and tag to origin..."
git push origin main
git push origin "$TAG"

echo "✅ Release $TAG created and pushed!"