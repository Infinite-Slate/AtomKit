import SwiftUI

/// A SwiftUI view that renders an atom from any `AtomStyle`.
///
/// Supports both solid (predefined color with gloss) and fully custom
/// styles with stacked effect layers.
public struct StyledAtomView: View {
    public let style: AtomStyle
    public var diameter: CGFloat

    public init(style: AtomStyle, diameter: CGFloat = 80) {
        self.style = style
        self.diameter = diameter
    }

    public var body: some View {
        Group {
            switch style.kind {
            case .solid(let atomColor):
                // Solid colors render as a circle with their hex color and a default gloss
                let baseColor = Color(hex: atomColor.hexColor)
                ZStack {
                    Circle().fill(baseColor)
                    effectView(
                        for: EffectLayer(effect: .gloss),
                        baseColor: baseColor
                    )
                }
                .clipShape(Circle())

            case .styled(let hex, let layers):
                let baseColor = Color(hex: hex)
                ZStack {
                    Circle().fill(baseColor)

                    ForEach(layers.filter(\.isVisible)) { layer in
                        effectView(for: layer, baseColor: baseColor)
                            .rotationEffect(.degrees(layer.rotation))
                            .opacity(layer.opacity)
                    }
                }
                .clipShape(Circle())
            }
        }
        .frame(width: diameter, height: diameter)
    }

    @ViewBuilder
    private func effectView(for layer: EffectLayer, baseColor: Color) -> some View {
        switch layer.effect {
        case .glass:
            let v = GlassVariant.get(layer.variant)
            ZStack {
                Circle().fill(baseColor.opacity(v.baseAlpha))

                Circle()
                    .fill(
                        RadialGradient(
                            gradient: Gradient(stops: [
                                .init(color: .white.opacity(v.highlightIntensity), location: 0),
                                .init(color: .white.opacity(v.highlightIntensity * 0.2), location: 0.35),
                                .init(color: .clear, location: 0.6),
                            ]),
                            center: .init(x: v.highlightCenter.x, y: v.highlightCenter.y),
                            startRadius: 0,
                            endRadius: diameter * v.highlightRadius
                        )
                    )

                Circle()
                    .fill(
                        RadialGradient(
                            gradient: Gradient(stops: [
                                .init(color: .clear, location: 0.7),
                                .init(color: .black.opacity(v.rimDarkness), location: 1.0),
                            ]),
                            center: .center,
                            startRadius: 0,
                            endRadius: diameter * 0.5
                        )
                    )

                Circle()
                    .fill(
                        RadialGradient(
                            gradient: Gradient(stops: [
                                .init(color: .white.opacity(v.causticIntensity), location: 0),
                                .init(color: .clear, location: 0.4),
                            ]),
                            center: .init(x: v.causticCenter.x, y: v.causticCenter.y),
                            startRadius: 0,
                            endRadius: diameter * v.causticRadius
                        )
                    )
            }

        case .gloss:
            ZStack {
                Circle().fill(baseColor)

                Circle()
                    .fill(
                        RadialGradient(
                            gradient: Gradient(stops: [
                                .init(color: .white.opacity(0.6), location: 0),
                                .init(color: .white.opacity(0.0), location: 0.55),
                            ]),
                            center: .init(x: 0.35, y: 0.3),
                            startRadius: 0,
                            endRadius: diameter * 0.5
                        )
                    )
            }

        case .matte:
            Circle().fill(baseColor)

        case .gradient:
            let secondary = layer.gradientHex.map { Color(hex: $0) } ?? baseColor.opacity(0.4)
            Circle()
                .fill(
                    LinearGradient(
                        colors: [baseColor, secondary],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )

        case .glow:
            Circle()
                .fill(baseColor)
                .shadow(color: baseColor.opacity(0.8), radius: diameter * 0.15)
                .shadow(color: baseColor.opacity(0.4), radius: diameter * 0.3)
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        StyledAtomView(style: .init(hexColor: "FF1D55", layers: [
            EffectLayer(effect: .glass)
        ]))

        StyledAtomView(style: .init(hexColor: "38A9EB", layers: [
            EffectLayer(effect: .gradient, rotation: 45, gradientHex: "A855F7"),
            EffectLayer(effect: .gloss, opacity: 0.6),
            EffectLayer(effect: .glow, opacity: 0.5),
        ]))

        StyledAtomView(style: .init(atomColor: .yellow), diameter: 60)
    }
    .padding()
    .background(.black)
}
