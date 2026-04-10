# Learning Playground (Xcode)

An interactive Xcode Playground that teaches Swift from scratch — variables, shapes, colors, physics, and your first open-source contribution. Designed for kids, teens, and complete beginners.

> **No coding experience needed.** Every concept is explained from zero.

## What You Need

| Requirement | Where to Get It |
|---|---|
| A Mac (any recent model) | You probably already have one |
| Xcode (free) | [Download from the App Store](https://apps.apple.com/app/xcode/id497799835) |
| A GitHub account (for the final challenge) | [Sign up at github.com](https://github.com/join) |

> **Don't have a Mac?** Use the [iPad version](../CodingIntroApp.swiftpm/) instead — it works on any iPad with Swift Playgrounds.

## Getting Started

### Step 1: Download the Project

**Option A — If your teacher gave you a link:**

Click the green **Code** button on GitHub, then **Download ZIP**. Unzip the file and find the `Playground` folder inside.

**Option B — Using Terminal (the developer way):**

Open Terminal (press **Cmd + Space**, type "Terminal", press Enter) and type:

```bash
git clone https://github.com/Infinite-Slate/AtomKit.git
cd AtomKit
```

### Step 2: Open the Playground

Double-click the file:

```
Playground/CodingIntro.playground
```

Or from Terminal:

```bash
open Playground/CodingIntro.playground
```

Xcode will open with the Playground loaded.

### Step 3: Set Up the View

You need to see the **live preview panel** on the right side of Xcode. To enable it:

1. In the top menu: **Editor** > **Live View** (or press **Option + Cmd + Return**)
2. You should see a split view: code on the left, preview on the right

If the preview panel is too small, drag the divider to the left to give it more room.

### Step 4: Run the Code

Press **Cmd + Shift + Enter** (or click the blue play button at the bottom of the editor). This runs the entire page and shows results in the sidebar and live view.

> **Important:** Run the code every time you make a change to see the updated result.

## The Four Pages

Go through them **in order** — each page builds on what you learned in the previous one.

### Page 1: Hello World

**What you'll learn:** Variables, data types (Int, Double, String, Bool), arrays, if/else, functions, print()

**What you'll do:**
- Change your name, age, and favorite emoji in the code
- See the output appear in the gray sidebar on the right
- Write your first function
- Learn the difference between `var` (can change) and `let` (locked forever)

**Key concept:** A variable is a named container for data, like a labeled box.

```swift
var myName = "Alex"       // Text (String) — needs quotes
var age = 12              // Number (Int) — no quotes
var loveCoding = true     // True/false (Bool)
```

### Page 2: Colors and Shapes

**What you'll learn:** SpriteKit (Apple's 2D graphics framework), coordinate system, shapes, colors, hex codes

**What you'll do:**
- Draw circles and rectangles on screen
- Change colors using system colors (`.systemBlue`) or hex codes (`"FF1D55"`)
- Position shapes using x/y coordinates
- Put emoji inside shapes
- Add text labels with custom fonts

**Key concept:** Every object on screen has a position (x, y). x goes left to right (0-400), y goes bottom to top (0-600).

```
   y
 600 |  top
     |
 300 |  middle
     |
   0 |  bottom
     +----------
     0   200  400
         x
```

### Page 3: Ball Physics

**What you'll learn:** Gravity, bounciness (restitution), mass, damping, for loops

**What you'll do:**
- Watch balls fall, bounce, and collide with realistic physics
- Change gravity (Earth, Moon, Jupiter, zero gravity, upside down)
- Create balls with different sizes, colors, and bounciness
- Use a `for` loop to create 10 balls with one block of code
- **Tap the screen** to spawn random balls!

**Key concept:** Physics values control how objects behave:

| Value | What it does | Range |
|---|---|---|
| `bounciness` | Energy kept after bouncing | 0.0 (clay) to 1.0 (forever) |
| `radius` | Size and weight | 10 (tiny) to 50 (huge) |
| `gravity` | Pull direction and strength | -24.8 (Jupiter) to +9.8 (flipped) |

### Page 4: Your Challenge

**What you'll learn:** Open-source contribution, Git, Pull Requests

**What you'll do:**
1. Add your own ball to the scene (emoji + color + size + position)
2. Test it with **Cmd + Shift + Enter**
3. Commit your change with Git
4. Push to GitHub
5. Create your first Pull Request

This is how **real software developers** contribute to projects every day.

## Troubleshooting

| Problem | Solution |
|---|---|
| "No such module 'SpriteKit'" | Make sure you're running on an iOS Simulator target. In the top bar of Xcode, select any iPhone simulator. |
| Live view is empty | Press **Cmd + Shift + Enter** to run the page. Make sure the live view panel is visible (**Editor > Live View**). |
| Code changes don't show up | Run the page again with **Cmd + Shift + Enter**. Playgrounds don't auto-run. |
| Xcode is slow / frozen | Close other apps. Playgrounds can be memory-intensive. Restart Xcode if needed. |
| "Execution was interrupted" | The playground timed out. Press the play button again. |

## Tips for Teachers

- **Page 1** takes about 15-20 minutes. Students should type and modify every `// TASK` line.
- **Page 2** is visual — encourage students to experiment freely with positions, sizes, and colors.
- **Page 3** is the most fun. Give students 5 minutes of free play to tap and spawn balls before the structured tasks.
- **Page 4** requires Git setup. Walk through it together as a class the first time.
- The `Sources/BallScene.swift` file powers the physics. Curious students can explore it, but it's not required.

## What's Next?

After finishing the Playground, students can contribute to the **real AtomKit package** by adding style presets, color palettes, or physics configurations. See the [Contributing Guide](CONTRIBUTING.md) for step-by-step instructions.
