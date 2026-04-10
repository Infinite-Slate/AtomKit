#if canImport(UIKit)
import UIKit

public extension UIColor {
    /// Creates a UIColor from a 6-character hex string (e.g. "FF1D55" or "#38A9EB").
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        let clean = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var rgb: UInt64 = 0
        Scanner(string: clean).scanHexInt64(&rgb)

        let r = CGFloat((rgb >> 16) & 0xFF) / 255.0
        let g = CGFloat((rgb >> 8) & 0xFF) / 255.0
        let b = CGFloat(rgb & 0xFF) / 255.0

        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
}
#endif
