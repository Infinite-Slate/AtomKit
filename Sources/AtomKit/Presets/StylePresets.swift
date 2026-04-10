import Foundation

/// A collection of named atom styles.
///
/// **This is where you contribute!**
/// Add your own `NamedStyle` to the `all` array and submit a Pull Request.
public enum StylePresets {

    /// A named, authored atom style.
    public struct NamedStyle: Identifiable, Sendable {
        public let id: String
        public let name: String
        public let style: AtomStyle
        public let author: String

        public init(id: String, name: String, style: AtomStyle, author: String) {
            self.id = id
            self.name = name
            self.style = style
            self.author = author
        }
    }

    /// All available style presets.
    public static let all: [NamedStyle] = [

        // =====================================================================
        // Seed presets
        // =====================================================================

        NamedStyle(
            id: "clear_glass",
            name: "Clear Glass",
            style: AtomStyle(hexColor: "38A9EB", layers: [
                EffectLayer(effect: .glass, variant: 0),
            ]),
            author: "AtomKit"
        ),

        NamedStyle(
            id: "crystal_gem",
            name: "Crystal Gem",
            style: AtomStyle(hexColor: "A855F7", layers: [
                EffectLayer(effect: .glass, variant: 5),
                EffectLayer(effect: .glow, opacity: 0.4),
            ]),
            author: "AtomKit"
        ),

        NamedStyle(
            id: "sunset_gradient",
            name: "Sunset Gradient",
            style: AtomStyle(hexColor: "FF1D55", layers: [
                EffectLayer(effect: .gradient, rotation: 135, gradientHex: "FBBF24"),
                EffectLayer(effect: .gloss, opacity: 0.5),
            ]),
            author: "AtomKit"
        ),

        NamedStyle(
            id: "frosted_mint",
            name: "Frosted Mint",
            style: AtomStyle(hexColor: "2DD4BF", layers: [
                EffectLayer(effect: .glass, variant: 1),
                EffectLayer(effect: .glow, opacity: 0.3),
            ]),
            author: "AtomKit"
        ),

        NamedStyle(
            id: "matte_black",
            name: "Matte Black",
            style: AtomStyle(hexColor: "1A1A2E", layers: [
                EffectLayer(effect: .matte),
            ]),
            author: "AtomKit"
        ),

        // =====================================================================
        // Add your style preset below! Example:
        //
        // NamedStyle(
        //     id: "your_unique_id",
        //     name: "Your Style Name",
        //     style: AtomStyle(hexColor: "FF6B6B", layers: [
        //         EffectLayer(effect: .glass, variant: 2),
        //         EffectLayer(effect: .glow, opacity: 0.6),
        //     ]),
        //     author: "Your Name"
        // ),
        // =====================================================================

    ]
}
