import Foundation

/// Defines the visual characteristics of a glass effect variant.
///
/// Each variant controls highlight placement, rim darkness, and caustic
/// effects to create different glass-like appearances.
public struct GlassVariant: Sendable {
    public let name: String
    public let baseAlpha: Double
    public let highlightCenter: (x: Double, y: Double)
    public let highlightRadius: Double
    public let highlightIntensity: Double
    public let rimDarkness: Double
    public let causticCenter: (x: Double, y: Double)
    public let causticRadius: Double
    public let causticIntensity: Double

    public init(
        name: String,
        baseAlpha: Double,
        highlightCenter: (x: Double, y: Double),
        highlightRadius: Double,
        highlightIntensity: Double,
        rimDarkness: Double,
        causticCenter: (x: Double, y: Double),
        causticRadius: Double,
        causticIntensity: Double
    ) {
        self.name = name
        self.baseAlpha = baseAlpha
        self.highlightCenter = highlightCenter
        self.highlightRadius = highlightRadius
        self.highlightIntensity = highlightIntensity
        self.rimDarkness = rimDarkness
        self.causticCenter = causticCenter
        self.causticRadius = causticRadius
        self.causticIntensity = causticIntensity
    }

    /// All available glass variants.
    public static let variants: [GlassVariant] = [
        // 0: Clear — classic transparent sphere
        GlassVariant(name: "Clear", baseAlpha: 0.35, highlightCenter: (0.4, 0.25), highlightRadius: 0.45, highlightIntensity: 0.75, rimDarkness: 0.2, causticCenter: (0.55, 0.78), causticRadius: 0.25, causticIntensity: 0.3),
        // 1: Frosted — muted, diffuse
        GlassVariant(name: "Frosted", baseAlpha: 0.6, highlightCenter: (0.5, 0.3), highlightRadius: 0.55, highlightIntensity: 0.35, rimDarkness: 0.1, causticCenter: (0.5, 0.75), causticRadius: 0.3, causticIntensity: 0.15),
        // 2: Crystal — sharp bright highlight
        GlassVariant(name: "Crystal", baseAlpha: 0.25, highlightCenter: (0.35, 0.2), highlightRadius: 0.3, highlightIntensity: 0.9, rimDarkness: 0.3, causticCenter: (0.6, 0.82), causticRadius: 0.2, causticIntensity: 0.4),
        // 3: Bubble — very translucent, thin rim
        GlassVariant(name: "Bubble", baseAlpha: 0.15, highlightCenter: (0.38, 0.22), highlightRadius: 0.35, highlightIntensity: 0.8, rimDarkness: 0.35, causticCenter: (0.58, 0.8), causticRadius: 0.18, causticIntensity: 0.35),
        // 4: Tinted — strong color, subtle depth
        GlassVariant(name: "Tinted", baseAlpha: 0.7, highlightCenter: (0.42, 0.28), highlightRadius: 0.5, highlightIntensity: 0.4, rimDarkness: 0.15, causticCenter: (0.52, 0.72), causticRadius: 0.22, causticIntensity: 0.1),
        // 5: Gem — offset highlight, deep rim
        GlassVariant(name: "Gem", baseAlpha: 0.45, highlightCenter: (0.3, 0.18), highlightRadius: 0.28, highlightIntensity: 0.85, rimDarkness: 0.4, causticCenter: (0.65, 0.85), causticRadius: 0.15, causticIntensity: 0.45),
        // 6: Pearl — soft centered glow
        GlassVariant(name: "Pearl", baseAlpha: 0.5, highlightCenter: (0.5, 0.35), highlightRadius: 0.6, highlightIntensity: 0.5, rimDarkness: 0.25, causticCenter: (0.5, 0.7), causticRadius: 0.35, causticIntensity: 0.2),
    ]

    /// Safely access a variant by index, clamped to valid range.
    public static func get(_ index: Int) -> GlassVariant {
        variants[min(max(index, 0), variants.count - 1)]
    }
}
