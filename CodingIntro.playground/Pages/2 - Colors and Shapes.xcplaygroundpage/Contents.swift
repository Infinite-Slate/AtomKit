/*:
 # Colors and Shapes 🎨

 On this page you'll learn how to:
 - Create a **scene** (a canvas for drawing)
 - Draw **shapes** — circles, rectangles
 - Use **colors**
 - Add **text** to the screen

 > Look for the ✏️ mark — that's where you need to change something!
*/

import SpriteKit
import PlaygroundSupport

// MARK: - Create a Scene

// A scene is a canvas where everything is displayed
let scene = SKScene(size: CGSize(width: 400, height: 600))
scene.backgroundColor = SKColor(red: 0.08, green: 0.08, blue: 0.14, alpha: 1)

// MARK: - Circle

let circle = SKShapeNode(circleOfRadius: 50)
circle.fillColor = .systemBlue
circle.strokeColor = .white
circle.lineWidth = 3
circle.position = CGPoint(x: 120, y: 480)
scene.addChild(circle)

// ✏️ TASK 1: Change the circle color!
// Try: .systemRed, .systemGreen, .systemYellow, .systemPurple, .systemOrange

// MARK: - Rectangle

let square = SKShapeNode(rectOf: CGSize(width: 80, height: 80), cornerRadius: 12)
square.fillColor = .systemGreen
square.strokeColor = .white
square.lineWidth = 3
square.position = CGPoint(x: 280, y: 480)
scene.addChild(square)

// ✏️ TASK 2: Change the rectangle size (width and height)
// Try making it wide: CGSize(width: 150, height: 40)

// MARK: - Emoji in a Circle

let emojiCircle = SKShapeNode(circleOfRadius: 40)
emojiCircle.fillColor = .systemYellow
emojiCircle.strokeColor = .systemOrange
emojiCircle.lineWidth = 3
emojiCircle.glowWidth = 2
emojiCircle.position = CGPoint(x: 120, y: 340)
scene.addChild(emojiCircle)

let emojiLabel = SKLabelNode(text: "🌟")
emojiLabel.fontSize = 40
emojiLabel.verticalAlignmentMode = .center
emojiCircle.addChild(emojiLabel)

// ✏️ TASK 3: Change the emoji! Try: "🎈", "🚀", "🎮", "🦄"

// MARK: - Text

let title = SKLabelNode(text: "My First Drawing!")
title.fontSize = 22
title.fontColor = .white
title.fontName = "AvenirNext-Bold"
title.position = CGPoint(x: 200, y: 200)
scene.addChild(title)

// ✏️ TASK 4: Change the text to your own

// MARK: - Your Shape

// ✏️ TASK 5: Add your own shape!
// Uncomment the code below and change the parameters:

// let myShape = SKShapeNode(circleOfRadius: 35)
// myShape.fillColor = .systemPink
// myShape.position = CGPoint(x: 280, y: 340)
// scene.addChild(myShape)

// MARK: - Show the Result

let view = SKView(frame: CGRect(x: 0, y: 0, width: 400, height: 600))
view.presentScene(scene)
PlaygroundPage.current.liveView = view

/*:
 ---
 ## Next up — the fun part! ➡️

 On the next page, balls will **fall and bounce** thanks to physics!
*/
