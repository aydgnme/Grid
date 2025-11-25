#!/bin/bash
set -euo pipefail
echo "🧪 Running tests..."
if command -v xcpretty &> /dev/null; then
    xcodebuild test -project Grid.xcodeproj -scheme Grid -destination 'platform=macOS' | xcpretty
else
    xcodebuild test -project Grid.xcodeproj -scheme Grid -destination 'platform=macOS'
fi
echo "✅ Tests completed"