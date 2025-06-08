#!/bin/bash
set -e

echo "🛠️  Building site with Jekyll..."
bundle exec jekyll build

echo "🧹 Stripping image metadata with exiftool..."
find _site/assets/projects -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' \) \
    -exec exiftool -all= -overwrite_original {} \;

echo "✅ Build complete and metadata stripped."
