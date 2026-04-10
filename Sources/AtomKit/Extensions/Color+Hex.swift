import SwiftUI
#if canImport(UIKit)
import UIKit
#endif

public extension Color {
    /// Creates a Color from a 6-character hex string (e.g. "FF1D55").
    /// The "#" prefix is optional.
    init(hex: String) {
        let cleaned = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var rgb: UInt64 = 0
        Scanner(string: cleaned).scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0

        self.init(red: r, green: g, blue: b)
    }

    #if canImport(UIKit)
    /// Returns the 6-character uppercase hex string for this color (e.g. "FF1D55").
    func toHex() -> String {
        let uiColor = UIColor(self)
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        uiColor.getRed(&r, green: &g, blue: &b, alpha: &a)

        let ri = max(0, min(255, Int(r * 255)))
        let gi = max(0, min(255, Int(g * 255)))
        let bi = max(0, min(255, Int(b * 255)))

        return String(format: "%02X%02X%02X", ri, gi, bi)
    }
    #endif
}
