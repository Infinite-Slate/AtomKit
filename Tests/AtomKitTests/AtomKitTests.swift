import Testing
@testable import AtomKit

// MARK: - AtomColor

@Suite struct AtomColorTests {
    @Test func allColorsHaveValidHex() {
        for color in AtomColor.allCases {
            #expect(color.hexColor.count == 6)
            #expect(color.hexColor.range(of: "^[0-9A-Fa-f]{6}$", options: .regularExpression) != nil)
        }
    }

    @Test func rawValueRoundtrip() {
        for color in AtomColor.allCases {
            #expect(AtomColor(rawValue: color.rawValue) == color)
        }
    }

    @Test func encodedNameRoundtrip() {
        for color in AtomColor.allCases {
            #expect(AtomColor(encodedName: color.encodedName) == color)
        }
    }

    @Test func invalidRawValueDefaultsToSilver() {
        #expect(AtomColor(rawValue: 99) == .silver)
    }

    @Test func displayOrderContainsAllColors() {
        #expect(Set(AtomColor.displayOrder) == Set(AtomColor.allCases))
    }
}

// MARK: - EffectLayer

@Suite struct EffectLayerTests {
    @Test func encodingRoundtrip() {
        let layer = EffectLayer(effect: .glass, rotation: 45, opacity: 0.8, variant: 2)
        let encoded = layer.encoded
        let decoded = EffectLayer(token: encoded)
        #expect(decoded != nil)
        #expect(decoded?.effect == .glass)
        #expect(decoded?.rotation == 45)
        #expect(decoded?.opacity == 0.8)
        #expect(decoded?.variant == 2)
    }

    @Test func gradientLayerEncoding() {
        let layer = EffectLayer(effect: .gradient, rotation: 90, gradientHex: "FF1D55")
        let encoded = layer.encoded
        #expect(encoded.contains("FF1D55"))
        let decoded = EffectLayer(token: encoded)
        #expect(decoded?.gradientHex == "FF1D55")
    }

    @Test func hiddenLayerPrefix() {
        let layer = EffectLayer(effect: .glow, isVisible: false)
        #expect(layer.encoded.hasPrefix("!"))
    }
}

// MARK: - AtomStyle

@Suite struct AtomStyleTests {
    @Test func solidStyleEncoding() {
        let style = AtomStyle(atomColor: .blue)
        #expect(style.encoded == "ball_2")
        #expect(style.isSolid)
        #expect(style.atomColor == .blue)
    }

    @Test func styledEncoding() {
        let style = AtomStyle(hexColor: "FF1D55", layers: [
            EffectLayer(effect: .glass),
            EffectLayer(effect: .glow, opacity: 0.5),
        ])
        let encoded = style.encoded
        #expect(encoded.hasPrefix("custom:FF1D55:"))
        #expect(!style.isSolid)
    }

    @Test func encodingRoundtrip() {
        let original = AtomStyle(hexColor: "34D399", layers: [
            EffectLayer(effect: .gradient, rotation: 45, gradientHex: "A855F7"),
            EffectLayer(effect: .gloss, opacity: 0.6),
        ])
        let decoded = AtomStyle(encoded: original.encoded)
        #expect(decoded.hexColor == "34D399")
        #expect(decoded.layers.count == 2)
        #expect(decoded.layers[0].effect == .gradient)
        #expect(decoded.layers[1].effect == .gloss)
    }

    @Test func solidEncodingRoundtrip() {
        for color in AtomColor.allCases {
            let style = AtomStyle(atomColor: color)
            let decoded = AtomStyle(encoded: style.encoded)
            #expect(decoded.atomColor == color)
        }
    }
}

// MARK: - PhysicsConfig

@Suite struct PhysicsConfigTests {
    @Test func standardDefaults() {
        let config = PhysicsConfig.standard
        #expect(config.restitution == 0.4)
        #expect(config.friction == 0.05)
        #expect(config.linearDamping == 0.1)
        #expect(config.angularDamping == 0.1)
        #expect(config.massMultiplier == 0.1)
    }

    @Test func bouncyHasHighRestitution() {
        #expect(PhysicsConfig.bouncy.restitution > 0.8)
    }

    @Test func heavyHasHighMass() {
        #expect(PhysicsConfig.heavy.massMultiplier > PhysicsConfig.standard.massMultiplier)
    }
}

// MARK: - Preset Validation

@Suite struct PresetValidationTests {
    @Test func stylePresetsHaveUniqueIDs() {
        let ids = StylePresets.all.map(\.id)
        #expect(Set(ids).count == ids.count, "Duplicate style preset IDs found")
    }

    @Test func stylePresetsHaveValidHex() {
        for preset in StylePresets.all {
            let hex = preset.style.hexColor
            #expect(hex.count == 6, "Invalid hex in style preset '\(preset.id)': \(hex)")
            #expect(hex.range(of: "^[0-9A-Fa-f]{6}$", options: .regularExpression) != nil)
        }
    }

    @Test func stylePresetsHaveLayers() {
        for preset in StylePresets.all {
            #expect(!preset.style.layers.isEmpty, "Style preset '\(preset.id)' has no layers")
        }
    }

    @Test func colorPalettesHaveUniqueIDs() {
        let ids = ColorPalettes.all.map(\.id)
        #expect(Set(ids).count == ids.count, "Duplicate palette IDs found")
    }

    @Test func colorPalettesHaveValidHex() {
        for palette in ColorPalettes.all {
            for (name, hex) in palette.colors {
                #expect(hex.count == 6, "Invalid hex in palette '\(palette.id)' color '\(name)': \(hex)")
                #expect(hex.range(of: "^[0-9A-Fa-f]{6}$", options: .regularExpression) != nil)
            }
        }
    }

    @Test func colorPalettesHaveMinimumColors() {
        for palette in ColorPalettes.all {
            #expect(palette.colors.count >= 2, "Palette '\(palette.id)' needs at least 2 colors")
        }
    }

    @Test func physicsPresetsHaveUniqueIDs() {
        let ids = PhysicsPresets.all.map(\.id)
        #expect(Set(ids).count == ids.count, "Duplicate physics preset IDs found")
    }

    @Test func physicsPresetsHaveValidValues() {
        for preset in PhysicsPresets.all {
            let c = preset.config
            #expect(c.restitution >= 0 && c.restitution <= 1, "Invalid restitution in '\(preset.id)'")
            #expect(c.friction >= 0, "Invalid friction in '\(preset.id)'")
            #expect(c.linearDamping >= 0, "Invalid linearDamping in '\(preset.id)'")
            #expect(c.angularDamping >= 0, "Invalid angularDamping in '\(preset.id)'")
            #expect(c.massMultiplier > 0, "Invalid massMultiplier in '\(preset.id)'")
        }
    }
}
