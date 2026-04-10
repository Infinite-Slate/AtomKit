import SwiftUI

/// Defines the visual style of an atom — either a solid predefined color
/// or a fully custom style with hex color and stacked effect layers.
public struct AtomStyle: Hashable, Sendable {

    /// The kind of style.
    public enum Kind: Hashable, Sendable {
        /// A predefined color with a default gloss effect.
        case solid(AtomColor)
        /// A custom hex color with one or more effect layers.
        case styled(hexColor: String, layers: [EffectLayer])
    }

    public let kind: Kind

    // MARK: - Computed Properties

    /// The SwiftUI color for this style.
    public var color: Color {
        switch kind {
        case .solid(let atomColor):
            return atomColor.color
        case .styled(let hex, _):
            return Color(hex: hex)
        }
    }

    /// The hex color string.
    public var hexColor: String {
        switch kind {
        case .solid(let atomColor):
            return atomColor.hexColor
        case .styled(let hex, _):
            return hex
        }
    }

    /// The effect layers. Solid styles return a single gloss layer.
    public var layers: [EffectLayer] {
        switch kind {
        case .solid:
            return [EffectLayer(effect: .gloss)]
        case .styled(_, let layers):
            return layers
        }
    }

    /// Whether this is a solid (predefined color) style.
    public var isSolid: Bool {
        if case .solid = kind { return true }
        return false
    }

    /// The predefined color, if this is a solid style.
    public var atomColor: AtomColor? {
        if case .solid(let c) = kind { return c }
        return nil
    }

    // MARK: - Encoding

    /// Encodes the style to a compact string for serialization.
    ///
    /// Format:
    /// - Solid: `"ball_2"` (backward compatible)
    /// - Styled: `"custom:FF1D55:glass(0,0.8),glow(0,0.5)"`
    public var encoded: String {
        switch kind {
        case .solid(let atomColor):
            return atomColor.encodedName
        case .styled(let hex, let layers):
            let joined = layers.map(\.encoded).joined(separator: ",")
            return "custom:\(hex):\(joined)"
        }
    }

    // MARK: - Init

    /// Creates a style from an encoded string.
    public init(encoded: String) {
        if encoded.hasPrefix("custom:") {
            let parts = encoded.split(separator: ":", maxSplits: 2).map(String.init)
            guard parts.count >= 3 else {
                self.kind = .solid(.silver)
                return
            }
            let hex = parts[1]
            let layers = Self.splitLayerTokens(parts[2]).compactMap(EffectLayer.init(token:))

            if layers.isEmpty {
                self.kind = .solid(.silver)
            } else {
                self.kind = .styled(hexColor: hex, layers: layers)
            }
        } else {
            self.kind = .solid(AtomColor(encodedName: encoded))
        }
    }

    /// Creates a solid style from a predefined color.
    public init(atomColor: AtomColor) {
        self.kind = .solid(atomColor)
    }

    /// Creates a custom styled atom with a hex color and effect layers.
    public init(hexColor: String, layers: [EffectLayer]) {
        self.kind = .styled(hexColor: hexColor, layers: layers)
    }

    // MARK: - Private

    /// Splits layer tokens correctly without breaking on commas inside parentheses.
    private static func splitLayerTokens(_ string: String) -> [String] {
        var tokens: [String] = []
        var current = ""
        var depth = 0
        for ch in string {
            if ch == "(" { depth += 1 }
            if ch == ")" { depth -= 1 }
            if ch == "," && depth == 0 {
                tokens.append(current)
                current = ""
            } else {
                current.append(ch)
            }
        }
        if !current.isEmpty { tokens.append(current) }
        return tokens
    }
}
