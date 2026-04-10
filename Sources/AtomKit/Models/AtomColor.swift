import Foundation
import SwiftUI

/// Predefined atom colors with associated hex values.
///
/// These map directly to the original legacy color set,
/// maintaining backward compatibility with the encoded format.
public enum AtomColor: Identifiable, Hashable, Codable, CaseIterable, Sendable {

    case red
    case purple
    case blue
    case green
    case turquoise
    case yellow
    case silver

    public var id: UInt16 { rawValue }

    /// Colors in display order (blue is first/default).
    public static var displayOrder: [AtomColor] {
        [.blue, .turquoise, .green, .yellow, .red, .purple, .silver]
    }

    public static func random() -> AtomColor {
        displayOrder.randomElement() ?? .silver
    }

    // MARK: - Hex

    /// The 6-character hex code for this color.
    public var hexColor: String {
        switch self {
        case .red:       return "FF1D55"
        case .purple:    return "A855F7"
        case .blue:      return "38A9EB"
        case .green:     return "34D399"
        case .turquoise: return "2DD4BF"
        case .yellow:    return "FBBF24"
        case .silver:    return "9CA3AF"
        }
    }

    /// SwiftUI Color for this atom color.
    public var color: Color {
        Color(hex: hexColor)
    }

    // MARK: - Raw Value

    public var rawValue: UInt16 {
        switch self {
        case .red:       return 0
        case .purple:    return 1
        case .blue:      return 2
        case .green:     return 3
        case .turquoise: return 4
        case .yellow:    return 5
        case .silver:    return 6
        }
    }

    /// Encoded string for backward-compatible serialization (e.g. "ball_2").
    public var encodedName: String {
        "ball_\(rawValue)"
    }

    public init(rawValue: UInt16) {
        if rawValue <= 6,
           let match = AtomColor.allCases.first(where: { $0.rawValue == rawValue }) {
            self = match
        } else {
            self = .silver
        }
    }

    public init(encodedName: String) {
        if encodedName.hasPrefix("ball_"),
           let indexStr = encodedName.split(separator: "_").last,
           let index = UInt16(indexStr),
           index <= 6 {
            self = AtomColor(rawValue: index)
        } else {
            self = .silver
        }
    }

    // MARK: - Codable

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(UInt16.self)
        self.init(rawValue: rawValue)
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
