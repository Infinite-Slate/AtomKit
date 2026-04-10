/*:
 # Colors and Shapes 🎨

 On page 1 we just printed text. Now we're going to draw things
 that you can actually SEE — circles, rectangles, colors, emoji.

 We'll use a framework called **SpriteKit**.
 A framework is a big collection of tools built by Apple.
 SpriteKit is specifically for 2D graphics — shapes, images, animations, games.
 Real mobile games use SpriteKit for their graphics and animations.

 **New concept: the coordinate system**

 Every object on screen needs a position — where should it go?
 We use two numbers to describe that: **x** and **y**.

 ```
    y ▲
  600 │ ┌────────────────────────┐
      │ │                        │
      │ │       (200, 300)       │  ← this is the center
      │ │           •            │
      │ │                        │
    0 │ └────────────────────────┘
      └───────────────────────────▶ x
      0                         400
 ```

 - **x** goes left to right. 0 = left edge, 400 = right edge.
 - **y** goes bottom to top. 0 = bottom, 600 = top.
 - The bottom-left corner is (0, 0). Not the top-left!

 > Look for the ✏️ marks — change things and see what happens!
*/

import SpriteKit
import PlaygroundSupport

// ============================================================================
// MARK: - Setting Up the Scene
// ============================================================================

// First we need a "scene" — think of it as a blank canvas.
// Everything we create will go onto this canvas.
//
// CGSize sets how big the canvas is.
// "CG" stands for Core Graphics — Apple's drawing system.
// width: 400 means 400 points wide. height: 600 means 600 points tall.
// Points aren't pixels — on a Retina screen, 1 point = 2 or 3 pixels.
// But for us, just think of them as units of distance.

let scene = SKScene(size: CGSize(width: 400, height: 600))

// Let's set the background color.
// Colors on a screen are made from mixing Red, Green, and Blue light.
// Each value goes from 0.0 (none of that color) to 1.0 (maximum).
//
// Examples:
//   (red: 1.0, green: 0.0, blue: 0.0) = pure red
//   (red: 0.0, green: 0.0, blue: 1.0) = pure blue
//   (red: 1.0, green: 1.0, blue: 1.0) = white (all colors at full)
//   (red: 0.0, green: 0.0, blue: 0.0) = black (no light at all)
//
// alpha is transparency: 1.0 = fully visible, 0.0 = invisible.

scene.backgroundColor = SKColor(red: 0.08, green: 0.08, blue: 0.14, alpha: 1.0)
// This gives us a dark background with a hint of blue. Looks nice.

// ============================================================================
// MARK: - Drawing a Circle
// ============================================================================

// SKShapeNode is a class that draws shapes.
// "SK" = SpriteKit. "ShapeNode" = a thing on screen that's a shape.
//
// circleOfRadius: 50 means the circle has a radius of 50 points.
// The radius is the distance from the center to the edge.
// So the full width (diameter) of this circle is 50 × 2 = 100 points.
//
// Size guide:
//   radius 15 → tiny, like a marble
//   radius 30 → medium, comfortable size
//   radius 50 → big, takes up a lot of space
//   radius 80 → huge, almost half the screen width

let circle = SKShapeNode(circleOfRadius: 50)

// Every shape has two colors:
// fillColor   — the color INSIDE the shape (the paint)
// strokeColor — the color of the BORDER around it (the outline)
//
// Apple gives us ready-made colors called "system colors."
// They look great and automatically adjust for light/dark mode:
//
//   .systemRed       .systemOrange     .systemYellow
//   .systemGreen     .systemBlue       .systemPurple
//   .systemPink      .systemTeal       .systemIndigo
//   .white           .black            .gray

circle.fillColor = .systemBlue
circle.strokeColor = .white

// lineWidth controls how thick the border is.
// 1 = thin hairline. 3 = clearly visible. 10 = chunky thick border.
circle.lineWidth = 3

// position is WHERE the shape goes on the canvas.
// CGPoint(x: 120, y: 480) means:
//   120 points from the left edge
//   480 points from the bottom (so near the top, since our canvas is 600 tall)
circle.position = CGPoint(x: 120, y: 480)

// addChild() puts the shape onto the scene. Without this line,
// the circle exists in the computer's memory but nobody can see it.
// It's like drawing something and putting it in a drawer vs. hanging it on a wall.
scene.addChild(circle)

// ✏️ TASK 1: Change the fillColor to a different color from the list above.
//            Then change the position — move it around the screen!
//            Remember: x goes 0 → 400, y goes 0 → 600.
//
// Want a CUSTOM color? You can use hex codes — the same format
// used in web design and apps like Figma:
//
//   circle.fillColor = UIColor(hex: "FF1D55")   // vibrant red
//   circle.fillColor = UIColor(hex: "38A9EB")   // sky blue
//
// A hex code is 6 characters (letters and numbers) that encode
// Red, Green, Blue. "FF" = maximum (255), "00" = zero.
// So "FF0000" = full red, no green, no blue = pure red.
// You can find hex codes for any color at htmlcolorcodes.com

// ============================================================================
// MARK: - Drawing a Rectangle
// ============================================================================

// rectOf: takes a CGSize — the width and height of the rectangle.
// width: 80 and height: 80 makes a perfect square.
// If width ≠ height, you get a rectangle.
//
// cornerRadius rounds the corners:
//   0  = sharp, perfect 90° corners
//   12 = slightly rounded, modern look
//   40 = very round, like a pill shape
//   If cornerRadius = half of the smallest side, you basically get an oval.

let square = SKShapeNode(rectOf: CGSize(width: 80, height: 80), cornerRadius: 12)
square.fillColor = .systemGreen
square.strokeColor = .white
square.lineWidth = 3
square.position = CGPoint(x: 280, y: 480)
scene.addChild(square)

// ✏️ TASK 2: Make this shape into a wide rectangle instead of a square.
//            Try: CGSize(width: 160, height: 40) — wide and flat.
//            Try: CGSize(width: 30, height: 120) — tall and narrow.
//            Also try different cornerRadius values: 0, 20, 40.

// ============================================================================
// MARK: - Putting Emoji Inside a Shape
// ============================================================================

// Here's a cool trick — you can put things INSIDE other things.
// In SpriteKit, this is called a parent-child relationship.
// The circle is the PARENT, and the emoji will be its CHILD.
// When the parent moves, the child moves with it — they're linked.

let emojiCircle = SKShapeNode(circleOfRadius: 40)
emojiCircle.fillColor = .systemYellow
emojiCircle.strokeColor = .systemOrange
emojiCircle.lineWidth = 3

// glowWidth adds a soft light around the shape, like it's shining.
// 0 = no glow. 1-2 = subtle glow. 5+ = strong glow.
emojiCircle.glowWidth = 2

emojiCircle.position = CGPoint(x: 120, y: 340)
scene.addChild(emojiCircle)

// SKLabelNode is for displaying text — including emoji.
let emojiLabel = SKLabelNode(text: "🌟")

// fontSize controls how big the text is. For emoji inside a circle,
// you usually want it close to the radius so it fills the space nicely.
// Our circle has radius 40, and fontSize 40 fits well inside.
emojiLabel.fontSize = 40

// This centers the emoji vertically inside the circle.
// Without this, text sits on a "baseline" (like text in a book)
// and would appear slightly too low.
emojiLabel.verticalAlignmentMode = .center

// Add the emoji as a CHILD of the circle.
// We don't set its position, so it defaults to (0, 0) — which means
// "the center of my parent." Exactly where we want it.
emojiCircle.addChild(emojiLabel)

// ✏️ TASK 3: Change the emoji to something you like.
//            Try: "🎈" "🚀" "🎮" "🦄" "🐱" "🌈" "⚽️" "🎸" "🍕"

// ============================================================================
// MARK: - Text Label
// ============================================================================

// SKLabelNode also works for regular text, not just emoji.

let title = SKLabelNode(text: "My First Drawing!")

title.fontSize = 22          // Size of the text in points

title.fontColor = .white     // Color of the text

// fontName sets the font — the style of the letters.
// Here are some fonts that work on iOS:
//   "AvenirNext-Bold"      — clean and modern, bold weight
//   "AvenirNext-Regular"   — same style, lighter weight
//   "Helvetica-Bold"       — classic, used everywhere
//   "Courier"              — looks like a typewriter (monospaced)
//   "Georgia-Bold"         — fancy, like a book
//   "Menlo-Regular"        — looks like code in a text editor
title.fontName = "AvenirNext-Bold"

// Position it in the lower part of the canvas
title.position = CGPoint(x: 200, y: 200)
scene.addChild(title)

// ✏️ TASK 4: Change the text and try different fontName values from the list.

// ============================================================================
// MARK: - Your Turn
// ============================================================================

// ✏️ TASK 5: Create your own shape!
// Uncomment the lines below (remove the //) and customize them.
// Add a circle, a rectangle, or both — it's your canvas.

// let myShape = SKShapeNode(circleOfRadius: 35)
// myShape.fillColor = .systemPink
// myShape.strokeColor = .white
// myShape.lineWidth = 2
// myShape.position = CGPoint(x: 280, y: 340)
// scene.addChild(myShape)
//
// // Want to put an emoji in it? Add these lines too:
// let myEmoji = SKLabelNode(text: "🎮")
// myEmoji.fontSize = 30
// myEmoji.verticalAlignmentMode = .center
// myShape.addChild(myEmoji)

// ============================================================================
// MARK: - Showing the Result
// ============================================================================

// To see everything, we need to create a "view" — a window that displays
// our scene. Think of the scene as a painting and the view as the frame
// you hang on the wall.

let view = SKView(frame: CGRect(x: 0, y: 0, width: 400, height: 600))
view.presentScene(scene)

// This tells the Playground: "Show this view in the preview panel on the right."
PlaygroundPage.current.liveView = view

/*:
 ---
 ## What you learned

 | Thing | What it is | How to use it |
 |-------|-----------|---------------|
 | `SKScene` | A canvas to draw on | `SKScene(size: CGSize(width: 400, height: 600))` |
 | `SKShapeNode` | A visible shape | `SKShapeNode(circleOfRadius: 50)` |
 | `SKLabelNode` | Text or emoji | `SKLabelNode(text: "Hello")` |
 | `CGSize` | Width × height | `CGSize(width: 100, height: 50)` |
 | `CGPoint` | A position (x, y) | `CGPoint(x: 200, y: 300)` |
 | `.fillColor` | Color inside | `.fillColor = .systemRed` |
 | `.strokeColor` | Border color | `.strokeColor = .white` |
 | `.lineWidth` | Border thickness | `.lineWidth = 3` |
 | `.glowWidth` | Glow effect | `.glowWidth = 2` |
 | `.addChild()` | Put something on screen | `scene.addChild(circle)` |

 ---
 ## Next page ➡️

 Get ready — next we add **physics**. Balls will fall, bounce,
 and crash into each other. For real.
*/
