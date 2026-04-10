/*:
 # Your Challenge! 🏆

 Everything you've done so far was practice. This is the real thing.

 You're going to add your own ball to this project and submit it
 through **GitHub** — the same way professional developers contribute
 to real software every day.

 ---

 ## What is GitHub?

 GitHub is where developers store and share code.
 Millions of projects live there — from tiny scripts to entire operating systems.
 When you want to improve someone else's project, you don't just edit their code
 directly (that would be chaos). Instead, you:

 1. Make a **copy** of the project (called a "fork")
 2. Make your changes on YOUR copy
 3. Send a **Pull Request** — a message saying:
    *"Hey, I made something. Here's what I changed. Want to add it?"*
 4. The project owner **reviews** your changes
 5. If everything looks good, they **merge** it — your code becomes part of the project

 That's how all open-source software works. Linux, Python, Swift itself —
 they're all built by thousands of people sending Pull Requests.

 ---

 ## Your steps:

 ### 1. Add your ball (right here in this file, scroll down)
 Find the section that says "ADD YOUR BALL BELOW" and add a line like:
 ```swift
 // Ball from Alex
 scene.addBall(emoji: "🎮", color: .systemPurple, radius: 25, at: CGPoint(x: 150, y: 500))
 ```

 ### 2. Test it
 Press **Cmd + Shift + Enter**. You should see your ball appear and fall.

 ### 3. Open Terminal
 Find the app called **Terminal** (search for it with Spotlight: Cmd + Space).
 Then navigate to your project:
 ```
 cd ~/Desktop/CodingIntro
 ```
 (Your path might be different — ask the teacher if you're not sure.)

 ### 4. Save your changes with Git
 ```
 git add .
 git commit -m "Add ball from [Your Name]"
 ```
 `git add .` tells Git: "I want to save all the changes I made."
 `git commit` creates a snapshot — like a save point in a game.
 The `-m` part is your message describing what you did.

 ### 5. Push to GitHub
 ```
 git push origin main
 ```
 This sends your save point from your computer to GitHub.

 ### 6. Create the Pull Request
 - Open **github.com** in your browser and go to your fork
 - You'll see a banner: *"This branch is 1 commit ahead"*
 - Click **"Contribute"** → **"Open pull request"**
 - Write a title: `Add ball from [Your Name]`
 - Click **"Create pull request"**

 That's it. You just contributed to an open-source project. 🎉

*/

import SpriteKit
import PlaygroundSupport

// ============================================================================
// Scene setup — don't change this part
// ============================================================================

let scene = BallPlayground(size: CGSize(width: 400, height: 600))
scene.physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)

// ╔══════════════════════════════════════════════════════════════════════════╗
// ║                     PARTICIPANT BALL GALLERY                            ║
// ║                                                                         ║
// ║  Every ball here was added by someone — and then merged via a PR.       ║
// ║  Yours will be next.                                                    ║
// ╚══════════════════════════════════════════════════════════════════════════╝

// Ball from Teacher (example — this is what yours should look like)
scene.addBall(emoji: "🍎", color: .systemRed, radius: 30, at: CGPoint(x: 200, y: 550))

// -------------------------------------------------------------------------
// ✏️ ADD YOUR BALL BELOW THIS LINE
//
// Write two lines: a comment with your name, and the addBall call.
// Here's the template — copy it, paste it below, and change the values:
//
//   // Ball from [Your Name]
//   scene.addBall(emoji: "🎮", color: .systemPurple, radius: 25, at: CGPoint(x: 150, y: 500))
//
// ┌─────────────────────────────────────────────────────────────────────┐
// │ HOW TO PICK YOUR VALUES                                            │
// ├─────────────┬───────────────────────────────────────────────────────┤
// │ emoji       │ Pick something that represents you!                  │
// │             │ Sports: "⚽️" "🏀" "🎾" "🏊" "⛷️"                   │
// │             │ Music:  "🎵" "🎸" "🎹" "🎤" "🎧"                   │
// │             │ Space:  "🚀" "🌍" "⭐️" "🌙" "🛸"                   │
// │             │ Nature: "🌸" "🦋" "🐱" "🦊" "🌊"                   │
// │             │ Food:   "🍕" "🍎" "🍩" "🧁" "🍉"                   │
// │             │ Fun:    "🎮" "🎯" "🎨" "💎" "🔥"                   │
// ├─────────────┼───────────────────────────────────────────────────────┤
// │ color       │ System colors:                                       │
// │             │ .systemRed     .systemOrange   .systemYellow         │
// │             │ .systemGreen   .systemBlue     .systemPurple         │
// │             │ .systemPink    .systemTeal     .systemIndigo          │
// │             │                                                       │
// │             │ Or use a hex code for ANY color you want:             │
// │             │ UIColor(hex: "FF1D55")  — vibrant red                 │
// │             │ UIColor(hex: "A855F7")  — bright purple              │
// │             │ UIColor(hex: "38A9EB")  — sky blue                   │
// │             │ UIColor(hex: "34D399")  — emerald green              │
// │             │ UIColor(hex: "FBBF24")  — golden yellow              │
// │             │ UIColor(hex: "2DD4BF")  — turquoise                  │
// │             │                                                       │
// │             │ Find any hex color at htmlcolorcodes.com              │
// ├─────────────┼───────────────────────────────────────────────────────┤
// │ radius      │ 15 = tiny    25 = small    35 = medium    45 = big   │
// │             │ (diameter = radius × 2, so radius 25 → 50pt ball)    │
// ├─────────────┼───────────────────────────────────────────────────────┤
// │ x position  │ 30 = far left, 200 = center, 370 = far right        │
// ├─────────────┼───────────────────────────────────────────────────────┤
// │ y position  │ 400 = low (short fall), 500 = medium, 570 = high    │
// └─────────────┴───────────────────────────────────────────────────────┘
// -------------------------------------------------------------------------



// -------------------------------------------------------------------------

// ╔══════════════════════════════════════════════════════════════════════════╗
// ║                      DO NOT CHANGE CODE BELOW                           ║
// ╚══════════════════════════════════════════════════════════════════════════╝

showScene(scene)
