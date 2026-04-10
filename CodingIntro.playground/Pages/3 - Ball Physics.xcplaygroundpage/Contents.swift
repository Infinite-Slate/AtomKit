/*:
 # Ball Physics! 🎱

 This is where it gets fun.

 Up to now, everything was static — shapes just sitting there, doing nothing.
 Now we're going to give them **physics**. That means gravity pulls them down,
 they bounce off walls and each other, and heavier things push lighter things.

 This is the same technology used in games — and in the **WiggleRoom** app,
 where colorful balls float and bounce inside glass cups.

 SpriteKit runs the physics simulation **60 times per second**.
 Every 1/60th of a second, it calculates where each ball should be,
 how fast it's moving, and what happens if it hits something.
 You set the rules. The engine does the math.

 **What you'll learn:**
 - **Gravity** — a constant force that pulls everything in one direction
 - **Bounciness** — how much energy a ball keeps when it hits a wall or another ball
 - **Mass** — heavier objects are harder to move and push lighter objects around
 - **Damping** — like air resistance, gradually slowing things down
 - **For loops** — telling the computer "do this 10 times"

 > Try tapping on the screen — a random ball appears where you tap!
*/

import SpriteKit
import PlaygroundSupport

// ============================================================================
// MARK: - Creating the Scene
// ============================================================================

// BallPlayground is a class we built (it lives in Sources/BallScene.swift).
// It's a regular SpriteKit scene, but with some things already set up:
//   - Dark background
//   - Invisible walls on all 4 edges (so balls don't fly off screen)
//   - A function called addBall() that makes it easy to create balls
//   - Tap detection — tap anywhere to spawn a random ball
//
// The size (400 × 600) is the coordinate space.
// x goes from 0 (left) to 400 (right).
// y goes from 0 (bottom) to 600 (top).

let scene = BallPlayground(size: CGSize(width: 400, height: 600))

// ============================================================================
// MARK: - Gravity
// ============================================================================

// Gravity is a force that constantly pulls objects in a direction.
// On Earth, it pulls everything DOWN at about 9.8 meters per second².
//
// In SpriteKit, we describe gravity as a "vector" — two numbers:
//   dx = horizontal force (left ← is negative, right → is positive)
//   dy = vertical force (down ↓ is negative, up ↑ is positive)
//
// Earth-like gravity: dx = 0 (no sideways pull), dy = -9.8 (pull down)

scene.physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)

// ✏️ TASK 1: Try different gravity settings!
//            Uncomment ONE line at a time (remove the //) and run:
//
// scene.physicsWorld.gravity = CGVector(dx: 0, dy: -1.6)
//   ↑ Moon gravity. 6 times weaker than Earth. Things float slowly.
//     (The real Moon's gravity is 1.62 m/s²)
//
// scene.physicsWorld.gravity = CGVector(dx: 0, dy: -3.7)
//   ↑ Mars gravity. About 1/3 of Earth. Noticeable but light.
//
// scene.physicsWorld.gravity = CGVector(dx: 0, dy: -24.8)
//   ↑ Jupiter gravity. 2.5x Earth. Everything slams down FAST.
//
// scene.physicsWorld.gravity = CGVector(dx: 0, dy: 9.8)
//   ↑ Upside down! Positive dy means "pull UP." Balls fall to the ceiling.
//
// scene.physicsWorld.gravity = CGVector(dx: 8, dy: -9.8)
//   ↑ Normal gravity PLUS wind blowing to the right.
//     dx = 8 pushes everything rightward while they also fall down.
//
// scene.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
//   ↑ Zero gravity. Space! Balls just float wherever you place them.
//     (They'll still move if they collide with each other.)

// ============================================================================
// MARK: - Adding Balls
// ============================================================================

// The addBall() function creates a ball and drops it into the scene.
// Here's what each parameter does:
//
// ┌─────────────┬──────────────────────────────────────────────────────────┐
// │  emoji      │ Any emoji you want displayed on the ball.               │
// │             │ "⭐️" "🎈" "🚀" "🎮" — anything works.                  │
// ├─────────────┼──────────────────────────────────────────────────────────┤
// │  color      │ The background color of the ball circle.                │
// │             │ Use system colors: .systemRed, .systemBlue, etc.        │
// ├─────────────┼──────────────────────────────────────────────────────────┤
// │  radius     │ How big the ball is — the distance from center to edge. │
// │             │ The full width (diameter) is radius × 2.                │
// │             │                                                         │
// │             │   radius 10 → 20pt wide  (tiny, like a pea)             │
// │             │   radius 20 → 40pt wide  (small marble)                 │
// │             │   radius 30 → 60pt wide  (tennis ball)                  │
// │             │   radius 40 → 80pt wide  (softball)                     │
// │             │   radius 50 → 100pt wide (basketball)                   │
// │             │                                                         │
// │             │ Also affects weight! Bigger balls are automatically      │
// │             │ heavier (mass = radius × 0.01).                         │
// ├─────────────┼──────────────────────────────────────────────────────────┤
// │  at         │ Where to place the ball: CGPoint(x, y).                 │
// │             │ x: 0 = left edge, 200 = center, 400 = right edge.      │
// │             │ y: 0 = floor, 300 = middle, 600 = ceiling.             │
// │             │ Higher y = the ball has further to fall!                 │
// ├─────────────┼──────────────────────────────────────────────────────────┤
// │  bounciness │ How much energy the ball keeps when it bounces.         │
// │             │ This is a number from 0.0 to 1.0.                       │
// │             │                                                         │
// │             │   0.0 = no bounce at all (hits the ground and stops,    │
// │             │         like dropping a ball of clay)                    │
// │             │   0.3 = low bounce (heavy, sluggish — like a bowling    │
// │             │         ball on grass)                                   │
// │             │   0.5 = medium (loses half its energy each bounce)      │
// │             │   0.7 = good bounce (like a basketball)                 │
// │             │   0.9 = very bouncy (like a rubber super ball)          │
// │             │   1.0 = perfect bounce (never stops bouncing — this     │
// │             │         doesn't exist in real life, but it's fun!)      │
// └─────────────┴──────────────────────────────────────────────────────────┘

// Let's create some balls! Each one is different.

// Ball 1: A bouncy golden star
scene.addBall(
    emoji: "⭐️",
    color: .systemYellow,
    radius: 30,                         // Medium size (60pt wide)
    at: CGPoint(x: 100, y: 500),        // Left side, near the top
    bounciness: 0.8                     // Very bouncy — keeps 80% of its energy
)

// Ball 2: A smaller red balloon
scene.addBall(
    emoji: "🎈",
    color: .systemRed,
    radius: 25,                         // A bit smaller (50pt wide)
    at: CGPoint(x: 200, y: 450),        // Center of the screen
    bounciness: 0.5                     // Medium bounce
)

// Ball 3: A big blue diamond — watch how it pushes smaller ones!
scene.addBall(
    emoji: "💎",
    color: .systemBlue,
    radius: 35,                         // Bigger and heavier (70pt wide)
    at: CGPoint(x: 300, y: 550),        // Right side, high up
    bounciness: 0.9                     // Super bouncy, almost a perfect bounce
)

// Ball 4: A large green Earth — heavy and slow
scene.addBall(
    emoji: "🌍",
    color: .systemGreen,
    radius: 40,                         // Big ball (80pt wide)
    at: CGPoint(x: 150, y: 400),        // Left-center, not too high
    bounciness: 0.3                     // Low bounce — drops and barely comes back
)

// Watch what happens when they land:
// - The star (0.8) bounces high and keeps going for a while
// - The balloon (0.5) bounces a few times then settles
// - The diamond (0.9) bounces almost forever
// - The Earth (0.3) hits the floor with a thud and barely moves
//
// Also notice: the big Earth ball (radius 40) is heavier than
// the small balloon (radius 25). When they collide, the Earth
// barely moves while the balloon goes flying. That's physics!

// ✏️ TASK 2: Add your own ball below!
//            Copy one of the blocks above, paste it here, and change everything.
//            What happens if you make a TINY ball (radius: 10) with bounciness 1.0?
//            What about a HUGE ball (radius: 50) with bounciness 0.0?



// ============================================================================
// MARK: - For Loops
// ============================================================================

// What if you want 10 balls? Or 50? You're not going to type addBall 50 times.
// That's what a "for loop" is for — it repeats code automatically.
//
// `for i in 0..<10` means:
//   "Do this 10 times. Each time, `i` will be a different number."
//   First time: i = 0
//   Second time: i = 1
//   Third time: i = 2
//   ...all the way to i = 9.
//
// Why start at 0? Because that's how computers count.
// 0..<10 means "from 0 up to (but NOT including) 10" → so 0,1,2,...,9.

// ✏️ TASK 3: Uncomment the code below (select all the lines and press Cmd + /)
//            and watch 10 purple balls rain down!

// for i in 0..<10 {
//     // Each ball gets a different horizontal position.
//     // When i = 0: x = 40. When i = 1: x = 75. When i = 2: x = 110. And so on.
//     // This spreads them evenly across the screen.
//     let x = CGFloat(40 + i * 35)
//
//     scene.addBall(
//         emoji: "🔮",
//         color: .systemPurple,
//         radius: 15,                    // Small balls
//         at: CGPoint(x: x, y: 550),     // All at the same height, different x
//         bounciness: 0.7
//     )
// }

// ✏️ TASK 4 (BONUS): A rainbow!
//    Here we use TWO arrays — one for colors, one for emoji.
//    The loop goes through both at the same time using the index `i`.

// let rainbowColors: [UIColor] = [
//     .systemRed, .systemOrange, .systemYellow,
//     .systemGreen, .systemBlue, .systemPurple
// ]
// let rainbowEmojis = ["🔴", "🟠", "🟡", "🟢", "🔵", "🟣"]
//
// for i in 0..<rainbowColors.count {    // .count = 6, so i goes 0,1,2,3,4,5
//     scene.addBall(
//         emoji: rainbowEmojis[i],       // i=0 → "🔴", i=1 → "🟠", etc.
//         color: rainbowColors[i],       // i=0 → .systemRed, etc.
//         radius: 25,
//         at: CGPoint(x: CGFloat(50 + i * 60), y: 500),
//         bounciness: 0.6
//     )
// }

// ============================================================================
// MARK: - Show the Scene
// ============================================================================

// showScene() is a helper function that creates a window (SKView),
// puts our scene in it, and shows it in the Playground preview.
// It also shows two debug numbers in the corner:
//   FPS = frames per second (should be ~60 for smooth animation)
//   node count = how many objects are in the scene

showScene(scene)

/*:
 ---
 ## Physics cheat sheet

 | What | Value | Effect |
 |------|-------|--------|
 | **bounciness** 0.0 | No bounce | Drops dead, like clay |
 | **bounciness** 0.5 | Half bounce | Realistic, like a tennis ball |
 | **bounciness** 1.0 | Perfect bounce | Bounces forever (not real, but fun) |
 | **radius** 10 | Tiny ball | Light, gets pushed around easily |
 | **radius** 30 | Medium ball | Balanced, good default |
 | **radius** 50 | Huge ball | Heavy, pushes everything out of the way |
 | **gravity** -1.6 | Moon | Slow, floaty, peaceful |
 | **gravity** -9.8 | Earth | Normal. What you're used to. |
 | **gravity** -24.8 | Jupiter | Fast and brutal |
 | **gravity** 0 | Space | No falling. Balls drift freely. |

 ---
 ## Last step — Your Challenge! ➡️

 You're about to add your own ball to this project
 and make your first **Pull Request** on GitHub.
 That means your code becomes part of this repo — for real.
*/
