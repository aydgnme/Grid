#!/bin/bash
set -euo pipefail
echo "🧪 Running tests..."
xcodebuild test -project Grid.xcodeproj -scheme Grid -destination 'platform=macOS' | xcpretty
echo "✅ Tests completed"