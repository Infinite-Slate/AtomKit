/*:
 # Your Challenge! 🏆

 This is your moment! Add your own ball to the shared scene.

 ## What to do:
 1. Add a `scene.addBall(...)` line in the section below
 2. Use your name in the comment
 3. Save the file
 4. **Commit** and **push** to GitHub
 5. Create a **Pull Request**!

 When your PR is accepted — your ball becomes part of the project forever! 🎉
*/

import SpriteKit
import PlaygroundSupport

let scene = BallPlayground(size: CGSize(width: 400, height: 600))
scene.physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)

// ╔══════════════════════════════════════════════╗
// ║          PARTICIPANT BALL GALLERY             ║
// ╚══════════════════════════════════════════════╝

// Ball from Teacher (example)
scene.addBall(emoji: "🍎", color: .systemRed, radius: 30, at: CGPoint(x: 200, y: 550))

// ---------------------------------------------------------------------------
// ✏️ ADD YOUR BALL BELOW!
//
// Copy this template, uncomment it, and fill in your own values:
//
// // Ball from [Your Name]
// scene.addBall(emoji: "🎮", color: .systemPurple, radius: 25, at: CGPoint(x: 150, y: 500))
//
// Tips:
//   emoji  — any emoji: "🚀", "🎵", "🦊", "🌈", "⚽️", "🎨"
//   color  — .systemRed .systemBlue .systemGreen .systemYellow
//            .systemPurple .systemOrange .systemPink .systemTeal
//   radius — size from 15 to 45
//   x      — from 30 to 370 (horizontal position)
//   y      — from 400 to 570 (drop height)
// ---------------------------------------------------------------------------



// ---------------------------------------------------------------------------

// ╔══════════════════════════════════════════════╗
// ║          DO NOT CHANGE CODE BELOW            ║
// ╚══════════════════════════════════════════════╝

showScene(scene)
