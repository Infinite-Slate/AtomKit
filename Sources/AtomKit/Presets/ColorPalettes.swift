import Foundation

/// A collection of named color palettes.
///
/// **This is where you contribute!**
/// Add your own `Palette` to the `all` array and submit a Pull Request.
public enum ColorPalettes {

    /// A named, authored color palette.
    public struct Palette: Identifiable, Sendable {
        public let id: String
        public let name: String
        public let colors: [(name: String, hex: String)]
        public let author: String

        public init(id: String, name: String, colors: [(name: String, hex: String)], author: String) {
            self.id = id
            self.name = name
            self.colors = colors
            self.author = author
        }
    }

    /// All available color palettes.
    public static let all: [Palette] = [

        // =====================================================================
        // Seed palettes
        // =====================================================================

        Palette(
            id: "classic",
            name: "Classic",
            colors: [
                ("Red", "FF1D55"),
                ("Purple", "A855F7"),
                ("Blue", "38A9EB"),
                ("Green", "34D399"),
                ("Turquoise", "2DD4BF"),
                ("Yellow", "FBBF24"),
                ("Silver", "9CA3AF"),
            ],
            author: "AtomKit"
        ),

        Palette(
            id: "ocean",
            name: "Ocean",
            colors: [
                ("Deep Sea", "1A5276"),
                ("Reef", "2E86C1"),
                ("Shallow", "85C1E9"),
                ("Foam", "D6EAF8"),
            ],
            author: "AtomKit"
        ),

        Palette(
            id: "sunset",
            name: "Sunset",
            colors: [
                ("Horizon", "FF6B35"),
                ("Sky", "F7931E"),
                ("Golden", "FFD700"),
                ("Dusk", "C0392B"),
            ],
            author: "AtomKit"
        ),

        Palette(
            id: "forest",
            name: "Forest",
            colors: [
                ("Pine", "1E8449"),
                ("Moss", "27AE60"),
                ("Leaf", "82E0AA"),
                ("Bark", "6E4B3A"),
            ],
            author: "AtomKit"
        ),

        // =====================================================================
        // Add your color palette below! Example:
        //
        // Palette(
        //     id: "your_palette_id",
        //     name: "Your Palette Name",
        //     colors: [
        //         ("Color 1", "hex1"),
        //         ("Color 2", "hex2"),
        //         ("Color 3", "hex3"),
        //     ],
        //     author: "Your Name"
        // ),
        // =====================================================================

    ]
}
