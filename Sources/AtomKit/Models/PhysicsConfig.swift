import Foundation

/// Configuration for physics simulation properties of an atom.
///
/// These values are applied to an `SKPhysicsBody` when creating
/// a SpriteKit node from an atom style.
public struct PhysicsConfig: Hashable, Codable, Sendable {

    /// How much energy is kept when bouncing (0.0 = no bounce, 1.0 = perfect bounce).
    public var restitution: CGFloat

    /// Surface friction when sliding against other objects (0.0 = ice, 1.0 = sandpaper).
    public var friction: CGFloat

    /// Air resistance for linear movement (0.0 = vacuum, higher = more drag).
    public var linearDamping: CGFloat

    /// Air resistance for rotation (0.0 = spins forever, higher = stops faster).
    public var angularDamping: CGFloat

    /// Multiplier for mass calculation: mass = diameter × massMultiplier.
    public var massMultiplier: CGFloat

    public init(
        restitution: CGFloat = 0.4,
        friction: CGFloat = 0.05,
        linearDamping: CGFloat = 0.1,
        angularDamping: CGFloat = 0.1,
        massMultiplier: CGFloat = 0.1
    ) {
        self.restitution = restitution
        self.friction = friction
        self.linearDamping = linearDamping
        self.angularDamping = angularDamping
        self.massMultiplier = massMultiplier
    }

    /// Standard physics config — matches the default production values.
    public static let standard = PhysicsConfig()

    /// High bounciness, low friction — like a rubber super ball.
    public static let bouncy = PhysicsConfig(
        restitution: 0.9, friction: 0.02,
        linearDamping: 0.05, angularDamping: 0.05,
        massMultiplier: 0.08
    )

    /// Heavy and sluggish — minimal bounce, high friction.
    public static let heavy = PhysicsConfig(
        restitution: 0.15, friction: 0.3,
        linearDamping: 0.2, angularDamping: 0.2,
        massMultiplier: 0.3
    )

    /// High damping for settling — used during transitions.
    public static let settling = PhysicsConfig(
        restitution: 0.1, friction: 0.1,
        linearDamping: 2.0, angularDamping: 2.0,
        massMultiplier: 0.1
    )
}
