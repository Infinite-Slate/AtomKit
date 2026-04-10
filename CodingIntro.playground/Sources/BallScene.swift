import SpriteKit
import PlaygroundSupport

// MARK: - BallPlayground

/// A SpriteKit scene with bouncy balls — inspired by the WiggleRoom app!
/// Tap anywhere on screen to add a new ball.
public class BallPlayground: SKScene {

    private var isSetUp = false

    public override func didMove(to view: SKView) {
        guard !isSetUp else { return }
        isSetUp = true

        backgroundColor = SKColor(red: 0.08, green: 0.08, blue: 0.14, alpha: 1)

        // Walls around the scene — balls won't escape
        physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(origin: .zero, size: size))
        physicsBody?.friction = 0.3
    }

    // MARK: - Adding Balls

    /// Adds a ball to the scene
    ///
    /// - Parameters:
    ///   - emoji: The emoji shown on the ball (e.g. "⭐️")
    ///   - color: The ball color (e.g. `.systemBlue`)
    ///   - radius: The ball size, from 10 to 50
    ///   - position: Position on screen — `CGPoint(x: ..., y: ...)`
    ///   - bounciness: How bouncy the ball is, from 0.0 (no bounce) to 1.0 (super bouncy)
    public func addBall(
        emoji: String,
        color: UIColor,
        radius: CGFloat = 30,
        at position: CGPoint,
        bounciness: CGFloat = 0.6
    ) {
        // Draw a circle
        let ball = SKShapeNode(circleOfRadius: radius)
        ball.fillColor = color
        ball.strokeColor = color.withAlphaComponent(0.5)
        ball.lineWidth = 2
        ball.glowWidth = 1
        ball.position = position

        // Add the emoji inside
        let label = SKLabelNode(text: emoji)
        label.fontSize = radius * 1.0
        label.verticalAlignmentMode = .center
        label.horizontalAlignmentMode = .center
        ball.addChild(label)

        // Physics — same settings as WiggleRoom!
        let body = SKPhysicsBody(circleOfRadius: radius)
        body.restitution = bounciness       // Bounciness
        body.friction = 0.05               // Surface friction
        body.linearDamping = 0.1           // Movement resistance
        body.angularDamping = 0.1          // Rotation resistance
        body.mass = radius * 0.01          // Mass scales with size
        body.allowsRotation = true
        ball.physicsBody = body

        addChild(ball)
    }

    // MARK: - Touch

    /// Tapping the screen adds a random ball
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

// MARK: - Helper

/// Shows the scene in the Playground live view
///
/// - Parameters:
///   - scene: The scene to display
///   - width: Screen width (default 400)
///   - height: Screen height (default 600)
public func showScene(_ scene: SKScene, width: CGFloat = 400, height: CGFloat = 600) {
    let view = SKView(frame: CGRect(x: 0, y: 0, width: width, height: height))
    view.showsFPS = true
    view.showsNodeCount = true
    scene.size = CGSize(width: width, height: height)
    scene.scaleMode = .aspectFit
    view.presentScene(scene)
    PlaygroundPage.current.liveView = view
    PlaygroundPage.current.needsIndefiniteExecution = true
}
