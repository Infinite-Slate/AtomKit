/*:
 # Hello, World! 👋

 Welcome to the world of programming with **Swift**!

 On this page you'll learn about:
 - **Variables** (`var`) — how to store data
 - **Data types** — text, numbers, true/false
 - **`print()`** — how to display results

 > Look for the ✏️ mark — that's where you need to change something!
*/

import Foundation

// MARK: - Variables

// A variable is like a box with a name where you can store data.
// To create a variable, use `var`:

var myName = "Your Name"

// ✏️ TASK 1: Replace "Your Name" with your real name

print("Hello, \(myName)! You're a programmer now!")

// MARK: - Data Types

// Swift has different data types:

var age = 12                // Int — a whole number
var height = 1.55           // Double — a decimal number
var loveCoding = true       // Bool — true or false
var favoriteEmoji = "🚀"    // String — text

// ✏️ TASK 2: Change these values to your own

print("My name is \(myName)")
print("I'm \(age) years old, my height is \(height)m")
print("My favorite emoji: \(favoriteEmoji)")

// MARK: - Arrays

// An array is a list of values inside square brackets:

var hobbies = ["coding", "gaming", "music"]

// ✏️ TASK 3: Add your own hobbies to the list

print("My hobbies: \(hobbies)")
print("Number of hobbies: \(hobbies.count)")

// You can add elements:
hobbies.append("drawing")
print("Added one more: \(hobbies)")

// MARK: - Functions

// A function is a set of actions with a name. You can call it many times:

func greet(name: String) -> String {
    return "Hello, \(name)! Welcome to Swift! 🎉"
}

print(greet(name: myName))

// ✏️ TASK 4: Create your own function that returns your favorite phrase
// Hint:
// func myPhrase() -> String {
//     return "your phrase here"
// }
// print(myPhrase())

/*:
 ---
 ## Done? Go to the next page! ➡️

 There we'll draw colorful shapes.
*/
