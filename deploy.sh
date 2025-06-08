#!/bin/bash

set -euo pipefail  # Stop on error, undefined vars, and pipe failures

# === Configuration ===
PUBLIC_REPO_DIR="../dougzu.github.io"   # Path to your public GitHub Pages repo
BUILD_DIR="_site"

# === Sanity Checks ===
if [[ ! -d "$BUILD_DIR" ]]; then
  echo "❌ Build directory '$BUILD_DIR' does not exist. Did you run 'jekyll build'?"
  exit 1
fi

if [[ -z "$PUBLIC_REPO_DIR" || ! -d "$PUBLIC_REPO_DIR/.git" ]]; then
  echo "❌ PUBLIC_REPO_DIR is not set correctly or is not a git repo: '$PUBLIC_REPO_DIR'"
  exit 1
fi

# === Confirm before clearing contents ===
echo "About to clear contents of: $PUBLIC_REPO_DIR"
read -p "Are you sure? This will delete all files in that directory. (y/n) " -r
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  echo "Aborted."
  exit 1
fi

# === Step 1: Build the site ===
echo "📦 Building site..."
./build.sh

# === Step 2: Clear and copy ===
echo "🚮 Clearing old contents in '$PUBLIC_REPO_DIR'..."
shopt -s extglob
cd "$PUBLIC_REPO_DIR"
rm -rf -- !( .git )
shopt -u extglob
cd -

echo "📁 Copying new site to '$PUBLIC_REPO_DIR'..."
cp -r "$BUILD_DIR"/. "$PUBLIC_REPO_DIR"
cp -r "CNAME" "$PUBLIC_REPO_DIR"

# === Step 3: Commit and push ===
cd "$PUBLIC_REPO_DIR"
git checkout -B gh-pages
git add .
git commit -m "Deploy $(date +'%Y-%m-%d %H:%M:%S')" || echo "No changes to commit."
git push -f origin gh-pages

echo "✅ Deployed successfully."