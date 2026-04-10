#if canImport(UIKit) && canImport(SpriteKit)
import SpriteKit
import SwiftUI
import UIKit

/// Generates and caches `SKTexture` instances for atom styles.
///
/// Uses Core Graphics to render effect layers (glass, gloss, gradient, glow, matte)
/// into high-quality circular textures suitable for SpriteKit nodes.
public final class AtomTextureGenerator: @unchecked Sendable {

    /// Shared singleton with default texture size (256px).
    public static let shared = AtomTextureGenerator()

    private var cache: [String: SKTexture] = [:]
    private let lock = NSLock()
    private let texturePixelSize: CGFloat

    /// Creates a texture generator.
    /// - Parameter texturePixelSize: The width/height of generated textures in pixels. Default is 256.
    public init(texturePixelSize: CGFloat = 256) {
        self.texturePixelSize = texturePixelSize
    }

    /// Returns a cached texture for the given style, rendering it if needed.
    ///
    /// For solid styles, returns `nil` — the consumer should use its own asset image.
    /// For styled atoms, renders the effect layers into a circular texture.
    public func texture(for style: AtomStyle) -> SKTexture? {
        guard !style.isSolid else { return nil }

        let key = style.encoded
        lock.lock()
        if let cached = cache[key] {
            lock.unlock()
            return cached
        }
        lock.unlock()

        let tex = renderTexture(style: style)

        lock.lock()
        cache[key] = tex
        lock.unlock()

        return tex
    }

    /// Clears the texture cache.
    public func clearCache() {
        lock.lock()
        cache.removeAll()
        lock.unlock()
    }

    // MARK: - Render

    private func renderTexture(style: AtomStyle) -> SKTexture {
        let size = CGSize(width: texturePixelSize, height: texturePixelSize)
        let renderer = UIGraphicsImageRenderer(size: size)
        let baseColor = UIColor(Color(hex: style.hexColor))

        let image = renderer.image { ctx in
            let rect = CGRect(origin: .zero, size: size)
            let cgCtx = ctx.cgContext

            cgCtx.setFillColor(baseColor.cgColor)
            cgCtx.fillEllipse(in: rect)

            for layer in style.layers where layer.isVisible {
                cgCtx.saveGState()

                if layer.rotation != 0 {
                    let center = CGPoint(x: rect.midX, y: rect.midY)
                    cgCtx.translateBy(x: center.x, y: center.y)
                    cgCtx.rotate(by: layer.rotation * .pi / 180)
                    cgCtx.translateBy(x: -center.x, y: -center.y)
                }

                cgCtx.setAlpha(layer.opacity)
                drawEffect(layer.effect, in: rect, context: cgCtx, baseColor: baseColor, layer: layer)
                cgCtx.restoreGState()
            }
        }

        return SKTexture(image: image)
    }

    // MARK: - Effect Renderers

    private func drawEffect(
        _ effect: AtomEffect,
        in rect: CGRect,
        context: CGContext,
        baseColor: UIColor,
        layer: EffectLayer
    ) {
        switch effect {
        case .matte:
            context.setFillColor(baseColor.cgColor)
            context.fillEllipse(in: rect)

        case .gloss:
            context.setFillColor(baseColor.cgColor)
            context.fillEllipse(in: rect)

            let highlightCenter = CGPoint(x: rect.width * 0.35, y: rect.height * 0.3)
            let radius = rect.width * 0.5
            let colorSpace = CGColorSpaceCreateDeviceRGB()
            let colors = [
                UIColor.white.withAlphaComponent(0.6).cgColor,
                UIColor.white.withAlphaComponent(0.0).cgColor,
            ] as CFArray
            let locations: [CGFloat] = [0.0, 0.55]

            if let gradient = CGGradient(colorsSpace: colorSpace, colors: colors, locations: locations) {
                context.saveGState()
                context.addEllipse(in: rect)
                context.clip()
                context.drawRadialGradient(gradient, startCenter: highlightCenter, startRadius: 0, endCenter: highlightCenter, endRadius: radius, options: [])
                context.restoreGState()
            }

        case .glass:
            let v = GlassVariant.get(layer.variant)
            let colorSpace = CGColorSpaceCreateDeviceRGB()

            context.setFillColor(baseColor.withAlphaComponent(v.baseAlpha).cgColor)
            context.fillEllipse(in: rect)

            // Highlight
            let hCenter = CGPoint(x: rect.width * v.highlightCenter.x, y: rect.height * v.highlightCenter.y)
            let hRadius = rect.width * v.highlightRadius
            let hColors = [
                UIColor.white.withAlphaComponent(v.highlightIntensity).cgColor,
                UIColor.white.withAlphaComponent(v.highlightIntensity * 0.2).cgColor,
                UIColor.clear.cgColor,
            ] as CFArray

            if let grad = CGGradient(colorsSpace: colorSpace, colors: hColors, locations: [0.0, 0.35, 0.6]) {
                context.saveGState()
                context.addEllipse(in: rect)
                context.clip()
                context.drawRadialGradient(grad, startCenter: hCenter, startRadius: 0, endCenter: hCenter, endRadius: hRadius, options: [])
                context.restoreGState()
            }

            // Rim
            let rimColors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(v.rimDarkness).cgColor] as CFArray
            let center = CGPoint(x: rect.midX, y: rect.midY)

            if let grad = CGGradient(colorsSpace: colorSpace, colors: rimColors, locations: [0.7, 1.0]) {
                context.saveGState()
                context.addEllipse(in: rect)
                context.clip()
                context.drawRadialGradient(grad, startCenter: center, startRadius: 0, endCenter: center, endRadius: rect.width * 0.5, options: [])
                context.restoreGState()
            }

            // Caustic
            let cCenter = CGPoint(x: rect.width * v.causticCenter.x, y: rect.height * v.causticCenter.y)
            let cRadius = rect.width * v.causticRadius
            let cColors = [UIColor.white.withAlphaComponent(v.causticIntensity).cgColor, UIColor.clear.cgColor] as CFArray

            if let grad = CGGradient(colorsSpace: colorSpace, colors: cColors, locations: [0.0, 0.4]) {
                context.saveGState()
                context.addEllipse(in: rect)
                context.clip()
                context.drawRadialGradient(grad, startCenter: cCenter, startRadius: 0, endCenter: cCenter, endRadius: cRadius, options: [])
                context.restoreGState()
            }

        case .gradient:
            let secondaryColor: UIColor
            if let hex = layer.gradientHex {
                secondaryColor = UIColor(Color(hex: hex))
            } else {
                secondaryColor = baseColor.withAlphaComponent(0.4)
            }

            let colorSpace = CGColorSpaceCreateDeviceRGB()
            let colors = [baseColor.cgColor, secondaryColor.cgColor] as CFArray
            let locations: [CGFloat] = [0.0, 1.0]

            context.saveGState()
            context.addEllipse(in: rect)
            context.clip()

            if let gradient = CGGradient(colorsSpace: colorSpace, colors: colors, locations: locations) {
                context.drawLinearGradient(gradient, start: .zero, end: CGPoint(x: rect.width, y: rect.height), options: [])
            }
            context.restoreGState()

        case .glow:
            let glowInset = rect.width * 0.1
            let glowRect = rect.insetBy(dx: glowInset, dy: glowInset)
            context.setShadow(offset: .zero, blur: rect.width * 0.15, color: baseColor.withAlphaComponent(0.8).cgColor)
            context.setFillColor(baseColor.cgColor)
            context.fillEllipse(in: glowRect)
            context.setShadow(offset: .zero, blur: 0)
        }
    }
}
#endif
