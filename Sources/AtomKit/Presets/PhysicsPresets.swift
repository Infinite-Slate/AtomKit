import Foundation

/// A collection of named physics configurations.
///
/// **This is where you contribute!**
/// Add your own `NamedPhysics` to the `all` array and submit a Pull Request.
public enum PhysicsPresets {

    /// A named, authored physics configuration.
    public struct NamedPhysics: Identifiable, Sendable {
        public let id: String
        public let name: String
        public let config: PhysicsConfig
        public let author: String

        public init(id: String, name: String, config: PhysicsConfig, author: String) {
            self.id = id
            self.name = name
            self.config = config
            self.author = author
        }
    }

    /// All available physics presets.
    public static let all: [NamedPhysics] = [

        // =====================================================================
        // Seed presets
        // =====================================================================

        NamedPhysics(
            id: "standard",
            name: "Standard",
            config: .standard,
            author: "AtomKit"
        ),

        NamedPhysics(
            id: "super_bouncy",
            name: "Super Bouncy",
            config: PhysicsConfig(
                restitution: 0.95, friction: 0.02,
                linearDamping: 0.05, angularDamping: 0.05,
                massMultiplier: 0.08
            ),
            author: "AtomKit"
        ),

        NamedPhysics(
            id: "bowling",
            name: "Bowling Ball",
            config: PhysicsConfig(
                restitution: 0.2, friction: 0.3,
                linearDamping: 0.15, angularDamping: 0.2,
                massMultiplier: 0.3
            ),
            author: "AtomKit"
        ),

        NamedPhysics(
            id: "moon",
            name: "Moon Walk",
            config: PhysicsConfig(
                restitution: 0.6, friction: 0.05,
                linearDamping: 0.02, angularDamping: 0.02,
                massMultiplier: 0.03
            ),
            author: "AtomKit"
        ),

        NamedPhysics(
            id: "soap_bubble",
            name: "Soap Bubble",
            config: PhysicsConfig(
                restitution: 0.7, friction: 0.0,
                linearDamping: 0.4, angularDamping: 0.01,
                massMultiplier: 0.01
            ),
            author: "AtomKit"
        ),

        // =====================================================================
        // Add your physics preset below! Example:
        //
        // NamedPhysics(
        //     id: "your_preset_id",
        //     name: "Your Preset Name",
        //     config: PhysicsConfig(
        //         restitution: 0.5,      // bounciness: 0.0 – 1.0
        //         friction: 0.1,         // surface grip: 0.0 – 1.0
        //         linearDamping: 0.1,    // air resistance: 0.0+
        //         angularDamping: 0.1,   // spin resistance: 0.0+
        //         massMultiplier: 0.1    // weight factor: 0.01 – 0.5
        //     ),
        //     author: "Your Name"
        // ),
        // =====================================================================

    ]
}
