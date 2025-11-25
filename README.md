# Grid

A macOS window management application for organizing windows into a grid layout.

## Features

- **Grid-based Window Snapping**: Organize windows into customizable grid layouts
- **Keyboard Shortcuts**: Quick window positioning with keyboard commands
- **Accessibility Integration**: Uses macOS Accessibility APIs for window management
- **Customizable Settings**: Configure grid size and shortcuts to your preference

## Requirements

- macOS 15.7 or later
- Xcode 16.0 or later
- Swift 5.0+

## Building

```bash
# Build the project
./Scripts/build.sh

# Run tests
./Scripts/test.sh

# Lint code
./Scripts/lint.sh
```

## Installation

1. Build the project using Xcode or the build script
2. The app will be available in `build/Build/Products/Release/Grid.app`
3. Copy to Applications folder or run directly

## Usage

1. Launch Grid from Applications
2. Grant accessibility permissions when prompted
3. Use keyboard shortcuts to snap windows:
   - `⌘←` - Snap window left
   - `⌘→` - Snap window right
   - `⌘↑` - Snap window up
   - `⌘↓` - Snap window down

## Development

### Project Structure

```
Grid/
├── Sources/          # Source code
│   ├── App/         # App entry point and lifecycle
│   ├── Core/        # Core functionality
│   ├── Views/       # SwiftUI views
│   └── ViewModels/  # View models
├── Tests/           # Test files
├── Scripts/         # Build and utility scripts
└── Resources/       # Assets and configuration
```

### Code Style

- Follow SwiftLint rules (see `.swiftlint.yml`)
- Use SwiftFormat for formatting (see `.swiftformat`)
- Run `trunk check` before committing

## License

See LICENSE file for details.

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests and linting
5. Submit a pull request
