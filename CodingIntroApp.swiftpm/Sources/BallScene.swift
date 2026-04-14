import SpriteKit

// ============================================================================
// MARK: - SKColor + Hex
// ============================================================================

extension SKColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        let clean = hex.hasPrefix("#") ? String(hex.dropFirst()) : hex
        var rgb: UInt64 = 0
        Scanner(string: clean).scanHexInt64(&rgb)
        let r = CGFloat((rgb >> 16) & 0xFF) / 255.0
        let g = CGFloat((rgb >> 8) & 0xFF) / 255.0
        let b = CGFloat(rgb & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
}

// ============================================================================
// MARK: - BallPlayground
// ============================================================================

class BallPlayground: SKScene {

    private var isSetUp = false

    override func didMove(to view: SKView) {
        guard !isSetUp else { return }
        isSetUp = true

        backgroundColor = SKColor(red: 0.08, green: 0.08, blue: 0.14, alpha: 1)
        physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(origin: .zero, size: size))
        physicsBody?.friction = 0.3
    }

    func addBall(
        emoji: String,
        color: SKColor,
        radius: CGFloat = 30,
        at position: CGPoint,
        bounciness: CGFloat = 0.6
    ) {
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

        let body = SKPhysicsBody(circleOfRadius: radius)
        body.restitution = bounciness
        body.friction = 0.05
        body.linearDamping = 0.1
        body.angularDamping = 0.1
        body.mass = radius * 0.01
        body.allowsRotation = true
        ball.physicsBody = body

        addChild(ball)
    }

    private func spawnRandomBall(at location: CGPoint) {
        let colors: [SKColor] = [
            .systemRed, .systemBlue, .systemGreen,
            .systemYellow, .systemPurple, .systemOrange,
            .systemPink, .systemTeal
        ]
        let emojis = [
            "⭐️", "🎈", "🎾", "🌍", "🎵", "💎",
            "🚀", "🎯", "🦋", "🌸", "🔮", "🍎"
        ]
        addBall(
            emoji: emojis.randomElement()!,
            color: colors.randomElement()!,
            radius: CGFloat.random(in: 20...40),
            at: location
        )
    }

    #if canImport(UIKit)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        spawnRandomBall(at: touch.location(in: self))
    }
    #else
    override func mouseDown(with event: NSEvent) {
        spawnRandomBall(at: event.location(in: self))
    }
    #endif
}
