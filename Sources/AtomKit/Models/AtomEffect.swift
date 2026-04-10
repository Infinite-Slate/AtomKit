import Foundation

/// Visual effects that can be applied as layers to an atom.
public enum AtomEffect: String, CaseIterable, Codable, Hashable, Sendable {
    case glass
    case gloss
    case matte
    case gradient
    case glow

    public var displayName: String {
        switch self {
        case .glass:    return "Glass"
        case .gloss:    return "Gloss"
        case .matte:    return "Matte"
        case .gradient: return "Gradient"
        case .glow:     return "Glow"
        }
    }

    public var systemImage: String {
        switch self {
        case .glass:    return "cube.transparent"
        case .gloss:    return "sparkle"
        case .matte:    return "circle.fill"
        case .gradient: return "circle.lefthalf.filled"
        case .glow:     return "sun.max.fill"
        }
    }
}
