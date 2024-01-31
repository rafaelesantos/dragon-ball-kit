# Dragon Ball Kit

DragonBallKit is a Swift Package Manager (SPM) package that provides a convenient interface for consuming data from the Dragon Ball API. This package simplifies the process of integrating Dragon Ball Z-related information into your Swift projects.

## Features

- Retrieve information about characters, and plantes from the Dragon Ball API.
- Easy-to-use Swift interface for seamless integration into your iOS or macOS applications.
- Comprehensive documentation for quick reference and usage.

## Requirements

- iOS 13.0+
- macOS 10.15+

## Installation

### Swift Package Manager

Add the following dependency to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/rafaelesantos/dragon-ball-kit.git", branch: "main")
]
```

Then, add `DragonBallKit` as a dependency for your target:

```swift
targets: [
    .target(
        name: "YourApp",
        dependencies: ["DragonBallKit"]),
    // ...
]
```

Run `swift build` to fetch the dependency.
