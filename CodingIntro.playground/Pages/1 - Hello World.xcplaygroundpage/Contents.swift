/*:
 # Hello, World! 👋

 Welcome to **Swift** — a programming language made by Apple.

 Every app on your iPhone, every game on your iPad — they're all built with code.
 Swift is one of the most popular languages for making those apps.
 And right now, you're going to write your first lines of real code.

 This isn't a simulation or a toy — this is the same language
 that professional developers use every single day.

 **How this works:**
 - Read the code and the comments (lines that start with `//`)
 - Find the ✏️ marks — those are places where YOU change something
 - Press **Cmd + Shift + Enter** to run the code and see what happens
 - The results appear in the gray sidebar on the right →

 Let's go!
*/

import Foundation

// This line loads a library called Foundation.
// A library is a collection of ready-made tools that someone already wrote.
// You don't have to build everything from scratch — you can use what others made.
// Foundation gives us basics like text, numbers, and dates.

// ============================================================================
// MARK: - Variables
// ============================================================================

// Imagine you have a box. You write a label on it (the name),
// and you put something inside (the value).
// That's what a variable is — a named container for data.
//
// To create one, you write:
//   var name = value
//
// `var` tells Swift: "I'm creating a variable."

var myName = "Your Name"

// ✏️ TASK 1: Delete "Your Name" and type your real name instead.
//            Keep the quotes — Swift needs them to know it's text.

// Now let's use it. `print()` shows a message in the console.
// The `\( )` part takes whatever is inside the variable and puts it into the text.
// So if myName is "Alex", it will print: "Hello, Alex!"

print("Hello, \(myName)! You just wrote real code.")

// ============================================================================
// MARK: - Data Types
// ============================================================================

// Not everything is text. Swift understands different kinds of data:

var age = 12                // This is an Integer (Int) — a whole number.
                            // No decimals. Like counting on your fingers: 1, 2, 3...

var height = 1.55           // This is a Double — a number WITH a decimal point.
                            // Used for measurements, money, anything precise.

var loveCoding = true       // This is a Bool (short for Boolean).
                            // It can only be one of two things: true or false.
                            // Like a light switch — on or off, nothing in between.

var favoriteEmoji = "🚀"    // This is a String — any text wrapped in quotes.
                            // Even a single emoji counts as text!

// ✏️ TASK 2: Change all four values above to match YOU.
//            Remember: numbers don't need quotes, text does.

print("My name is \(myName)")
print("I'm \(age) years old, height: \(height)m")
print("Do I love coding? \(loveCoding)")
print("My emoji: \(favoriteEmoji)")

// ----- var vs let -----

// `var` means the value CAN change later.
// `let` means the value is LOCKED — once you set it, that's it. Done. Final.

let pi = 3.14159           // Pi never changes. It's always 3.14159.
var score = 0              // A game score changes all the time.
score = 10                 // See? We changed it. This works because it's `var`.
// pi = 3.2               // ← This would CRASH. You can't change a `let`.

// Rule of thumb: use `let` when you know the value won't change.
// Swift will actually warn you if you use `var` but never change the value.

// ============================================================================
// MARK: - Naming Rules
// ============================================================================

// Variable names matter. A lot. Other people (and future you) need to
// read your code and understand what's going on.
//
// ✅ Good names:
//   var playerScore = 100    — you instantly know what this is
//   var isGameOver = false   — clear, descriptive
//   var screenWidth = 400    — specific and useful
//
// ❌ Bad names:
//   var x = 100              — what is "x"? nobody knows
//   var thing = false        — what thing??
//   var a = 400              — meaningless
//
// Naming rules in Swift:
//   1. Start with a lowercase letter (not a number or symbol)
//   2. No spaces! Use camelCase instead:
//      "player score" → playerScore
//      "my favorite color" → myFavoriteColor
//      The first word is lowercase, every next word starts with UPPERCASE.
//   3. Letters, numbers, and underscores are allowed: score_1, level2

// ============================================================================
// MARK: - Arrays
// ============================================================================

// What if you want to store not one thing, but a whole LIST of things?
// That's an Array — a list of values in square brackets [].

var hobbies = ["coding", "gaming", "music"]

// Think of it like a numbered list, but it starts from 0 (not 1):
//   [0] = "coding"
//   [1] = "gaming"
//   [2] = "music"

// ✏️ TASK 3: Replace the hobbies with your own. Add as many as you want!

print("My hobbies: \(hobbies)")

// .count tells you how many items are in the list:
print("I have \(hobbies.count) hobbies")

// You can get a specific item by its number (called "index"):
print("My first hobby: \(hobbies[0])")     // Remember — counting starts at 0!

// You can add things to the end:
hobbies.append("reading")
print("Added one: \(hobbies)")

// ============================================================================
// MARK: - If / Else
// ============================================================================

// Sometimes you want the computer to make a decision.
// "IF this is true, do this. OTHERWISE, do that."

if age >= 13 {
    print("\(myName) is a teenager!")
} else {
    print("\(myName) is \(age) — almost a teenager!")
}

// How to compare things:
//   ==    equal to           (5 == 5 is true)
//   !=    NOT equal to       (5 != 3 is true)
//   >     greater than       (10 > 5 is true)
//   <     less than          (3 < 7 is true)
//   >=    greater or equal   (5 >= 5 is true)
//   <=    less or equal      (3 <= 4 is true)

// ============================================================================
// MARK: - Functions
// ============================================================================

// A function is like a recipe. You give it a name, write the steps inside,
// and then you can use that recipe whenever you want — just by calling its name.
//
// Here's how to read a function:
//
//   func greet(name: String) -> String
//   │    │      │     │         │
//   │    │      │     │         └── What it gives back (the result)
//   │    │      │     └── What kind of input it expects (text)
//   │    │      └── The name of the input
//   │    └── The name of the function
//   └── This word means "I'm creating a function"

func greet(name: String) -> String {
    return "Welcome, \(name)! You're one of us now. 🎉"
}

// To use the function, "call" it by name and give it the input:
print(greet(name: myName))

// Why bother? Because you can reuse it:
print(greet(name: "Alice"))
print(greet(name: "Bob"))
// One recipe, used three times. That's the power of functions.

// Functions can take multiple inputs:
func introduce(name: String, age: Int) -> String {
    return "\(name), age \(age)"
}

print(introduce(name: myName, age: age))

// ✏️ TASK 4: Write your own function!
// It should return your favorite quote, motto, or catchphrase.
//
// func myMotto() -> String {
//     return "write something cool here"
// }
// print(myMotto())

/*:
 ---
 ## What you learned

 | Concept | What it is | Example |
 |---------|-----------|---------|
 | `var` | A value that can change | `var score = 0` |
 | `let` | A value that's locked forever | `let pi = 3.14` |
 | `Int` | Whole number | `42` |
 | `Double` | Decimal number | `3.14` |
 | `String` | Text (in quotes) | `"hello"` |
 | `Bool` | True or false | `true` |
 | `Array` | A list of values | `["a", "b", "c"]` |
 | `if/else` | Make decisions | `if age > 12 { ... }` |
 | `func` | Reusable recipe | `func greet() { ... }` |
 | `print()` | Show something on screen | `print("hi")` |

 ---
 ## Ready? Go to the next page ➡️

 We're going to start drawing things on screen — real shapes, real colors.
*/
