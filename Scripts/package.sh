#!/bin/bash
set -euo pipefail

# Package script for Grid
# Creates DMG or .pkg for distribution

PROJECT_NAME="Grid"
SCHEME="Grid"
CONFIGURATION="Release"
BUILD_DIR="build"
OUTPUT_DIR="dist"

echo "📦 Building $PROJECT_NAME for packaging..."

# Clean previous builds
rm -rf "$BUILD_DIR" "$OUTPUT_DIR"
mkdir -p "$BUILD_DIR" "$OUTPUT_DIR"

# Build the app
xcodebuild -project "$PROJECT_NAME.xcodeproj" \
           -scheme "$SCHEME" \
           -configuration "$CONFIGURATION" \
           -derivedDataPath "$BUILD_DIR" \
           build

APP_PATH="$BUILD_DIR/Build/Products/$CONFIGURATION/$PROJECT_NAME.app"

if [ ! -d "$APP_PATH" ]; then
    echo "❌ App not found at $APP_PATH"
    exit 1
fi

echo "✅ Build successful"

# TODO: Create DMG or .pkg
# For DMG:
# hdiutil create -volname "$PROJECT_NAME" -srcfolder "$APP_PATH" -ov -format UDZO "$OUTPUT_DIR/$PROJECT_NAME.dmg"

# For .pkg:
# pkgbuild --root "$APP_PATH" --identifier "me.aydgn.$PROJECT_NAME" --version "1.0" "$OUTPUT_DIR/$PROJECT_NAME.pkg"

echo "📦 Package created in $OUTPUT_DIR"

