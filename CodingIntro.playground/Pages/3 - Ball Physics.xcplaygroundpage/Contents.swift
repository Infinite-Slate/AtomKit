/*:
 # Ball Physics! 🎱

 Now we'll create balls that **fall, bounce, and collide** —
 just like in the real **WiggleRoom** app!

 You'll learn about:
 - **Gravity** — the force pulling balls down
 - **Bounciness** — how much balls bounce back
 - **Mass** — how heavy the balls are

 > Tap on the screen to add a new ball!
*/

import SpriteKit
import PlaygroundSupport

// MARK: - Create a Physics Scene

let scene = BallPlayground(size: CGSize(width: 400, height: 600))

// MARK: - Gravity

// Gravity is a vector (direction and force).
// dx — horizontal (left/right)
// dy — vertical (down is negative, up is positive)

scene.physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)

// ✏️ TASK 1: Change the gravity!
// Try: (dx: 0, dy: -2)    — Moon (weak gravity)
// Try: (dx: 0, dy: -20)   — Jupiter (strong gravity)
// Try: (dx: 5, dy: -9.8)  — Wind blowing right!
// Try: (dx: 0, dy: 0)     — Zero gravity (space!)

// MARK: - Add Balls

// Each ball has: emoji, color, size (radius), position, and bounciness

scene.addBall(
    emoji: "⭐️",
    color: .systemYellow,
    radius: 30,
    at: CGPoint(x: 100, y: 500),
    bounciness: 0.8     // Very bouncy!
)

scene.addBall(
    emoji: "🎈",
    color: .systemRed,
    radius: 25,
    at: CGPoint(x: 200, y: 450),
    bounciness: 0.5     // Medium bounciness
)

scene.addBall(
    emoji: "💎",
    color: .systemBlue,
    radius: 35,
    at: CGPoint(x: 300, y: 550),
    bounciness: 0.9     // Super bouncy!
)

scene.addBall(
    emoji: "🌍",
    color: .systemGreen,
    radius: 40,
    at: CGPoint(x: 150, y: 400),
    bounciness: 0.3     // Heavy, barely bounces
)

// ✏️ TASK 2: Add your own ball!
// Copy a block above and change the parameters.
// Experiment with radius and bounciness.

// ✏️ TASK 3: Add LOTS of small balls using a loop!
// Uncomment the code below:

// for i in 0..<10 {
//     let x = CGFloat(40 + i * 35)
//     scene.addBall(
//         emoji: "🔮",
//         color: .systemPurple,
//         radius: 15,
//         at: CGPoint(x: x, y: 550),
//         bounciness: 0.7
//     )
// }

// MARK: - Show the Scene

showScene(scene)

/*:
 ---
 ## Last step — Your Challenge! ➡️

 On the next page you'll add **your unique ball**
 and make your first **Pull Request** on GitHub!
*/
