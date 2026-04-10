import SpriteKit
import PlaygroundSupport

// ============================================================================
// MARK: - UIColor + Hex
// ============================================================================
//
//  This extension lets you create colors from hex codes — the same format
//  used in web design, Figma, and professional iOS apps.
//
//  A hex color is a 6-character code that encodes Red, Green, and Blue:
//    "FF0000" = pure red    (FF = 255 red, 00 = 0 green, 00 = 0 blue)
//    "00FF00" = pure green
//    "0000FF" = pure blue
//    "FFFFFF" = white (all maxed out)
//    "000000" = black (all zero)
//
//  Each pair of characters is a number from 00 (0) to FF (255)
//  in hexadecimal — a base-16 number system used in computing.
//
//  Usage:
//    UIColor(hex: "FF1D55")       — vibrant red
//    UIColor(hex: "#38A9EB")      — works with or without the # sign
//    UIColor(hex: "34D399", alpha: 0.5)  — 50% transparent green

public extension UIColor {

    /// Creates a color from a hex string like "FF1D55" or "#A855F7".
    ///
    /// - Parameters:
    ///   - hex: A 6-character hex color code. The "#" prefix is optional.
    ///   - alpha: Opacity from 0.0 (invisible) to 1.0 (fully visible). Default is 1.0.
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        // Remove the "#" if someone includes it
        let clean = hex.hasPrefix("#") ? String(hex.dropFirst()) : hex

        // Parse the hex string into a single number
        var rgb: UInt64 = 0
        Scanner(string: clean).scanHexInt64(&rgb)

        // Extract red, green, blue by shifting bits:
        //   0xFF1D55 >> 16 = 0xFF = 255 → red
        //   0xFF1D55 >> 8  & 0xFF = 0x1D = 29 → green
        //   0xFF1D55       & 0xFF = 0x55 = 85 → blue
        // Then divide by 255 to get a 0.0–1.0 range.
        let r = CGFloat((rgb >> 16) & 0xFF) / 255.0
        let g = CGFloat((rgb >> 8) & 0xFF) / 255.0
        let b = CGFloat(rgb & 0xFF) / 255.0

        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
}

// Some nice hex colors to try:
//
//   Color        │ Hex code
//   ─────────────┼─────────
//   Red          │ FF1D55
//   Purple       │ A855F7
//   Blue         │ 38A9EB
//   Green        │ 34D399
//   Turquoise    │ 2DD4BF
//   Yellow       │ FBBF24
//   Silver       │ 9CA3AF
//   Coral        │ FF6B6B
//   Mint         │ 4ECDC4
//
// Try them!  UIColor(hex: "FF1D55")  gives you a vibrant red.

// ============================================================================
//  BallScene.swift — The engine behind the bouncy balls
// ============================================================================
//
//  This file lives in the Sources/ folder, which means it's compiled
//  separately from the Playground pages. That's why everything here
//  is marked `public` — without that keyword, the Playground pages
//  wouldn't be able to see or use any of this code.
//
//  You don't need to change anything here (but feel free to explore!).
//  The Playground pages use this code through the addBall() function
//  and the showScene() helper.
//
//  The physics settings in this file are inspired by a real iOS app
//  that uses SpriteKit to simulate bouncy balls with realistic physics.
// ============================================================================

// MARK: - BallPlayground

/// A SpriteKit scene with a dark background, walls, and bouncy balls.
/// Tap on the screen to add random balls!
public class BallPlayground: SKScene {

    // This flag makes sure we only set up walls and background once,
    // even if didMove(to:) gets called multiple times.
    private var isSetUp = false

    /// Called by SpriteKit when the scene first appears on screen.
    /// We use this to set up the background and invisible walls.
    public override func didMove(to view: SKView) {
        guard !isSetUp else { return }
        isSetUp = true

        // Dark background with a slight blue tint.
        // RGB (0.08, 0.08, 0.14) = very little red, very little green,
        // a touch more blue. Creates a calm, dark atmosphere.
        backgroundColor = SKColor(red: 0.08, green: 0.08, blue: 0.14, alpha: 1)

        // Create walls around all 4 edges of the scene.
        //
        // SKPhysicsBody(edgeLoopFrom:) creates a hollow rectangle —
        // objects bounce off the INSIDE of it. This means:
        //   - Bottom edge = floor (balls land here)
        //   - Left & right edges = walls (balls bounce off them)
        //   - Top edge = ceiling (balls can't fly off the top)
        //
        // The rectangle goes from corner (0, 0) to corner (width, height),
        // covering the entire scene.
        physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(origin: .zero, size: size))

        // How much grip the walls have.
        // 0.0 = ice (things slide forever)
        // 0.3 = moderate (balls sliding along the floor will slow down)
        // 1.0 = sandpaper (things stop almost immediately on contact)
        physicsBody?.friction = 0.3
    }

    // MARK: - addBall()

    /// Creates a colorful ball with an emoji and drops it into the physics simulation.
    ///
    /// - Parameters:
    ///   - emoji: The emoji shown on the ball. Any emoji works: "⭐️", "🚀", "🎮", etc.
    ///   - color: The fill color of the ball. Use .systemRed, .systemBlue, etc.
    ///   - radius: Half the ball's width, in points. Default is 30 (= 60pt wide ball).
    ///             Also determines weight — bigger balls are heavier.
    ///   - position: Where to place the ball. CGPoint(x, y), where x: 0-400, y: 0-600.
    ///   - bounciness: Energy kept after bouncing. 0.0 = dead stop, 1.0 = forever bounce.
    public func addBall(
        emoji: String,
        color: UIColor,
        radius: CGFloat = 30,
        at position: CGPoint,
        bounciness: CGFloat = 0.6
    ) {
        // ----- The visual part -----

        let ball = SKShapeNode(circleOfRadius: radius)
        ball.fillColor = color
        ball.strokeColor = color.withAlphaComponent(0.5)
        ball.lineWidth = 2
        ball.glowWidth = 1
        ball.position = position

        let label = SKLabelNode(text: emoji)
        label.fontSize = radius * 1.0
        label.verticalAlignmentMode = .center
        label.horizontalAlignmentMode = .center
        ball.addChild(label)

        // ----- The physics part -----
        //
        // SKPhysicsBody turns a visual shape into a physical object.
        // Without this, the ball would just float in place and ignore gravity.

        let body = SKPhysicsBody(circleOfRadius: radius)

        // RESTITUTION (bounciness)
        // The technical name for "how bouncy is it."
        // Measures the ratio of speed after/before a bounce.
        // 0.0 → all energy absorbed on impact (like clay)
        // 1.0 → no energy lost (like a perfect rubber ball)
        body.restitution = bounciness

        // FRICTION
        // Resistance when two surfaces slide against each other.
        // 0.05 is very smooth, like a polished marble.
        // This means balls slide past each other and along walls easily.
        body.friction = 0.05

        // LINEAR DAMPING
        // Think of this as air resistance for movement.
        // Every frame, the ball's speed is reduced by this amount.
        // 0.0 = no air (vacuum), balls never slow down on their own
        // 0.1 = light air, gentle slowdown over time
        // 1.0+ = thick air / water, balls slow down fast
        body.linearDamping = 0.1

        // ANGULAR DAMPING
        // Same as linear damping, but for spinning.
        // 0.1 = balls spin for a while before stopping.
        body.angularDamping = 0.1

        // MASS
        // How heavy the ball is. Heavier objects:
        //   - Need more force to get moving
        //   - Push lighter objects out of the way in collisions
        //   - Are less affected by collisions with lighter objects
        // We calculate it from the radius so bigger balls = heavier, naturally.
        body.mass = radius * 0.01

        // Can the ball spin when hit at an angle? Yes!
        body.allowsRotation = true

        ball.physicsBody = body
        addChild(ball)
    }

    // MARK: - Touch to add balls

    /// When you tap the screen, a random ball appears at that spot.
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)

        let colors: [UIColor] = [
            .systemRed, .systemBlue, .systemGreen,
            .systemYellow, .systemPurple, .systemOrange,
            .systemPink, .systemTeal
        ]
        let emojis = [
            "⭐️", "🎈", "🎾", "🌍", "🎵", "💎",
            "🚀", "🎯", "🦋", "🌸", "🔮", "🍎"
        ]

        let color = colors.randomElement()!
        let emoji = emojis.randomElement()!
        let radius = CGFloat.random(in: 20...40)

        addBall(emoji: emoji, color: color, radius: radius, at: location)
    }
}

// MARK: - showScene()

/// Sets up a window, puts the scene in it, and shows it in the Playground.
///
/// This handles the boring setup stuff so you can just write:
///   `showScene(scene)`
/// instead of 6 lines of boilerplate code.
///
/// - Parameters:
///   - scene: The scene to display
///   - width: How wide the window is (default 400 points)
///   - height: How tall the window is (default 600 points)
public func showScene(_ scene: SKScene, width: CGFloat = 400, height: CGFloat = 600) {
    let view = SKView(frame: CGRect(x: 0, y: 0, width: width, height: height))

    // Debug info shown in the corner of the screen:
    // FPS = frames per second. Should be around 60 for smooth animation.
    // Node count = total number of objects in the scene.
    view.showsFPS = true
    view.showsNodeCount = true

    scene.size = CGSize(width: width, height: height)
    scene.scaleMode = .aspectFit
    view.presentScene(scene)

    // Show the view in the Playground's live preview panel (right side).
    PlaygroundPage.current.liveView = view

    // Keep the Playground running so the physics doesn't freeze
    // and tap events keep working. Without this, the code would
    // execute the last line and stop — no more animation.
    PlaygroundPage.current.needsIndefiniteExecution = true
}
