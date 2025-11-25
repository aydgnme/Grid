#!/bin/bash
set -euo pipefail
echo "📦 Building Release DMG..."
xcodebuild -project Grid.xcodeproj -scheme Grid -configuration Release build | xcpretty
echo "✅ Release DMG built"