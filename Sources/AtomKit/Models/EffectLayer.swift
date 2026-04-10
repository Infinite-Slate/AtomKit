import Foundation

/// A single effect layer with configurable parameters.
///
/// Layers are stacked on top of each other to create complex visual styles.
/// Each layer has an effect type, rotation, opacity, and optional variant/gradient.
public struct EffectLayer: Hashable, Sendable, Identifiable {
    public let id: UUID
    public var effect: AtomEffect
    public var rotation: Double      // degrees (0...360)
    public var opacity: Double       // 0...1
    public var isVisible: Bool       // toggle layer on/off
    public var variant: Int          // sub-type (e.g. glass variations), 0 = default
    public var gradientHex: String?  // secondary color for .gradient effect

    public init(
        id: UUID = UUID(),
        effect: AtomEffect,
        rotation: Double = 0,
        opacity: Double = 1.0,
        isVisible: Bool = true,
        variant: Int = 0,
        gradientHex: String? = nil
    ) {
        self.id = id
        self.effect = effect
        self.rotation = rotation
        self.opacity = opacity
        self.isVisible = isVisible
        self.variant = variant
        self.gradientHex = gradientHex
    }

    // MARK: - Encoding

    /// Encodes the layer as a compact string: "effect(rotation,opacity[,variant][,gradientHex])"
    public var encoded: String {
        let prefix = isVisible ? "" : "!"
        let v = variant != 0 ? ",\(variant)" : ""
        if effect == .gradient, let gHex = gradientHex {
            return "\(prefix)\(effect.rawValue)(\(encodeNum(rotation)),\(encodeNum(opacity))\(v),\(gHex))"
        }
        return "\(prefix)\(effect.rawValue)(\(encodeNum(rotation)),\(encodeNum(opacity))\(v))"
    }

    /// Parses a token like "glass(45,0.8)", "!glass(0,1)" or "gradient(90,1,FF1D55)".
    public init?(token: String) {
        var raw = token
        let visible = !raw.hasPrefix("!")
        if !visible { raw = String(raw.dropFirst()) }

        guard let parenStart = raw.firstIndex(of: "("),
              raw.hasSuffix(")") else {
            guard let effect = AtomEffect(rawValue: raw) else { return nil }
            self.init(effect: effect, isVisible: visible)
            return
        }

        let name = String(raw[raw.startIndex..<parenStart])
        guard let effect = AtomEffect(rawValue: name) else { return nil }

        let paramsStart = raw.index(after: parenStart)
        let paramsEnd = raw.index(before: raw.endIndex)
        let params = String(raw[paramsStart..<paramsEnd]).split(separator: ",").map(String.init)

        let rotation = params.count > 0 ? (Double(params[0]) ?? 0) : 0
        let opacity = params.count > 1 ? (Double(params[1]) ?? 1) : 1

        var variant = 0
        var gradientHex: String?
        if params.count > 2 {
            if let v = Int(params[2]) {
                variant = v
                gradientHex = (params.count > 3 && effect == .gradient) ? params[3] : nil
            } else if effect == .gradient {
                gradientHex = params[2]
            }
        }

        self.init(
            effect: effect, rotation: rotation, opacity: opacity,
            isVisible: visible, variant: variant, gradientHex: gradientHex
        )
    }

    private func encodeNum(_ value: Double) -> String {
        value.truncatingRemainder(dividingBy: 1) == 0
            ? String(Int(value))
            : String(format: "%.2g", value)
    }
}
