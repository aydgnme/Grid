#!/bin/bash
set -euo pipefail
echo "🚀 Building Grid..."
xcodebuild -project Grid.xcodeproj -scheme Grid -configuration Debug -sdk macosx build | xcpretty
echo "✅ Build completed"