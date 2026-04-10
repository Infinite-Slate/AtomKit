# AtomKit

A Swift package for styling, rendering, and configuring visual atoms with physics — built for real apps and open to contributions.

Includes two interactive learning playgrounds for teaching Swift programming to kids and beginners.

## Learning Playgrounds

New to Swift? Start here. Two ways to learn, same concepts:

| | [iPad App](CodingIntroApp.swiftpm/) | [Xcode Playground](Playground/) |
|---|---|---|
| **What you need** | iPad + Swift Playgrounds (free) | Mac + Xcode (free) |
| **How you learn** | Sliders, buttons, tap to create | Write and edit real Swift code |
| **Best for** | Younger kids, visual learners, first exposure | Teens, aspiring developers |
| **Topics** | Variables, shapes, colors, physics, customization | Same + Git, Pull Requests, open-source |
| **Setup time** | 2 minutes (open file on iPad) | 5 minutes (clone repo, open in Xcode) |

### Quick Start: iPad

1. Download [Swift Playgrounds](https://apps.apple.com/app/swift-playgrounds/id908519492) on your iPad
2. Get the `CodingIntroApp.swiftpm` folder (from your teacher, AirDrop, or GitHub ZIP)
3. Open it — tap Play — start learning

### Quick Start: Xcode

```bash
git clone https://github.com/Infinite-Slate/AtomKit.git
open AtomKit/Playground/CodingIntro.playground
```

Press **Cmd + Shift + Enter** to run.

See the detailed setup guides: [iPad README](CodingIntroApp.swiftpm/README.md) | [Xcode README](Playground/README.md)

## Installation

Add AtomKit as a dependency in your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/Infinite-Slate/AtomKit.git", from: "1.0.0")
]
```

Then add it to your target:

```swift
.target(
    name: "YourApp",
    dependencies: [
        .product(name: "AtomKit", package: "AtomKit")
    ]
)
```

Or in Xcode: **File > Add Package Dependencies** > paste the repository URL.

## Usage

```swift
import AtomKit

// Predefined color
let style = AtomStyle(atomColor: .blue)

// Custom style with effect layers
let custom = AtomStyle(hexColor: "FF1D55", layers: [
    EffectLayer(effect: .glass, variant: 2),
    EffectLayer(effect: .glow, opacity: 0.5),
])

// Hex colors
let color = UIColor(hex: "A855F7")

// Physics configuration
let physics = PhysicsConfig.bouncy

// Browse presets
let styles = StylePresets.all
let palettes = ColorPalettes.all
let physicsPresets = PhysicsPresets.all
```

### SwiftUI Preview

```swift
StyledAtomView(style: custom, diameter: 80)
```

### SpriteKit Texture

```swift
if let texture = AtomTextureGenerator.shared.texture(for: custom) {
    let sprite = SKSpriteNode(texture: texture, size: CGSize(width: 60, height: 60))
}
```

## Repository Structure

```
AtomKit/
├── Package.swift                      — library package definition
├── Sources/AtomKit/
│   ├── Models/                        — AtomStyle, AtomColor, EffectLayer, etc.
│   ├── Extensions/                    — Color+Hex, UIColor+Hex
│   ├── Rendering/                     — StyledAtomView, AtomTextureGenerator
│   └── Presets/                       — contribution zone (styles, palettes, physics)
├── Tests/AtomKitTests/                — unit tests
├── Playground/
│   └── CodingIntro.playground/        — Xcode Playground (Mac)
│       ├── Sources/BallScene.swift
│       └── Pages/ (4 interactive pages)
└── CodingIntroApp.swiftpm/            — Swift Playgrounds App (iPad + Mac)
    ├── Package.swift
    └── Sources/ (SwiftUI app with 4 tabs)
```

## Contributing

We welcome contributions! You can add:

- **A style preset** > edit `Sources/AtomKit/Presets/StylePresets.swift`
- **A color palette** > edit `Sources/AtomKit/Presets/ColorPalettes.swift`
- **A physics preset** > edit `Sources/AtomKit/Presets/PhysicsPresets.swift`

Each file has a template at the bottom showing exactly what to add.

See the [step-by-step Contributing Guide](Playground/CONTRIBUTING.md) for detailed instructions.

## Requirements

- Swift 6.0+
- iOS 18+ / macOS 15+

## License

MIT — see [LICENSE](LICENSE) for details.
