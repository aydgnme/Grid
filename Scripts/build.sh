#!/bin/bash
set -euo pipefail
echo "🚀 Building Grid..."
if command -v xcpretty &> /dev/null; then
    xcodebuild -project Grid.xcodeproj -scheme Grid -configuration Debug -sdk macosx build | xcpretty
else
    xcodebuild -project Grid.xcodeproj -scheme Grid -configuration Debug -sdk macosx build
fi
echo "✅ Build completed"