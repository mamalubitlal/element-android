#!/bin/bash
# чатор Android - Push to GitHub
# Run this to push чатор branding to YOUR fork

set -e

echo "🥞 чатор Android - GitHub Push Setup"
echo ""

# Check if we're in the right directory
if [ ! -f "gradlew" ]; then
    echo "❌ Error: Not in element-android directory!"
    echo "   Run this script from: chator-android-temp/"
    exit 1
fi

# Get GitHub username
echo "Enter your GitHub username:"
read -r GITHUB_USER

if [ -z "$GITHUB_USER" ]; then
    echo "❌ Username cannot be empty!"
    exit 1
fi

echo ""
echo "📦 Setting up remote for: https://github.com/$GITHUB_USER/element-android.git"
echo ""

# Remove existing origin if any
git remote remove origin 2>/dev/null || true

# Add new origin
echo "Choose connection method:"
echo "1) HTTPS (easier, requires password/token)"
echo "2) SSH (requires SSH key setup)"
read -r CHOICE

if [ "$CHOICE" = "2" ]; then
    git remote add origin git@github.com:$GITHUB_USER/element-android.git
    echo "✅ SSH remote added"
else
    git remote add origin https://github.com/$GITHUB_USER/element-android.git
    echo "✅ HTTPS remote added"
fi

echo ""
echo "📝 Committing changes..."
git add -A
git commit -m "чатор: Custom branding for Russian teens messenger

- App name: чатор
- Default server: https://chator.k.vu
- Package: im.chator.android
- Logo: чатор branding
- Room directory: chator.k.vu
- GitHub Actions: Auto-build enabled"

echo ""
echo "🚀 Pushing to GitHub..."

# Detect branch name
BRANCH=$(git rev-parse --abbrev-ref HEAD)
echo "Pushing to branch: $BRANCH"

git push -u origin "$BRANCH"

echo ""
echo "✅ Success!"
echo ""
echo "📱 Next steps:"
echo "1. Go to: https://github.com/$GITHUB_USER/element-android/actions"
echo "2. Enable GitHub Actions if prompted"
echo "3. Wait for build (~30-50 min)"
echo "4. Download APK from Artifacts"
echo ""
echo "📖 Full instructions: GITHUB_ACTIONS_SETUP.md"
echo ""
