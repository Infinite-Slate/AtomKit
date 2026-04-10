# AtomKit

A Swift package for styling, rendering, and configuring visual atoms with physics — built for real apps and open to contributions.

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

Or in Xcode: **File → Add Package Dependencies** → paste the repository URL.

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

## Package Structure

```
Sources/AtomKit/
├── Models/
│   ├── AtomColor.swift            — 7 predefined colors with hex values
│   ├── AtomEffect.swift           — glass, gloss, matte, gradient, glow
│   ├── AtomStyle.swift            — solid or custom styled atoms
│   ├── EffectLayer.swift          — configurable effect layer with encoding
│   ├── GlassVariant.swift         — 7 glass visual variants
│   └── PhysicsConfig.swift        — physics simulation parameters
├── Extensions/
│   ├── Color+Hex.swift            — SwiftUI Color from hex
│   └── UIColor+Hex.swift          — UIColor from hex
├── Rendering/
│   ├── AtomTextureGenerator.swift — CGContext rendering → SKTexture
│   └── StyledAtomView.swift       — SwiftUI preview for any AtomStyle
└── Presets/                       — contribution zone
    ├── StylePresets.swift         — named atom styles
    ├── ColorPalettes.swift        — named color palettes
    └── PhysicsPresets.swift       — named physics configurations
```

## Contributing

We welcome contributions! You can add:

- **A style preset** → edit `Sources/AtomKit/Presets/StylePresets.swift`
- **A color palette** → edit `Sources/AtomKit/Presets/ColorPalettes.swift`
- **A physics preset** → edit `Sources/AtomKit/Presets/PhysicsPresets.swift`

Each file has a template at the bottom showing exactly what to add.

See the [step-by-step guide](Playground/CONTRIBUTING.md) for detailed instructions.

### Learning Playground

New to Swift? Check out the [Playground](Playground/) — an Xcode Playground that teaches Swift basics through interactive physics.

## Requirements

- Swift 6.0+
- iOS 18+ / macOS 15+

## License

MIT — see [LICENSE](LICENSE) for details.
