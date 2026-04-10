# Learning App (iPad)

An interactive Swift app that teaches programming through a hands-on physics playground. Runs on **iPad** and **Mac** using the free **Swift Playgrounds** app. No Xcode needed.

> **No coding experience needed.** Learn by tapping, sliding, and watching things bounce.

## What You Need

| Requirement | Where to Get It |
|---|---|
| An iPad (any model with iPadOS 18+) or a Mac | You probably already have one |
| Swift Playgrounds app (free) | [iPad](https://apps.apple.com/app/swift-playgrounds/id908519492) / [Mac](https://apps.apple.com/app/swift-playgrounds/id1496833156) |

> **Have a Mac with Xcode?** You can also use the [Xcode Playground version](../Playground/) which teaches code-writing directly.

## Getting Started

### For Students

#### Option A: Your Teacher Shared a File

1. Your teacher will send you the `CodingIntroApp.swiftpm` folder via **AirDrop**, **iCloud Drive**, **Google Drive**, or **Schoolwork**
2. Tap on the file — **Swift Playgrounds** will open automatically
3. Tap **Open** if prompted
4. You're ready!

#### Option B: Download from GitHub

1. Open Safari on your iPad
2. Go to the AtomKit repository on GitHub
3. Tap the green **Code** button, then **Download ZIP**
4. Open the **Files** app, find the downloaded ZIP, tap to unzip
5. Find the `CodingIntroApp.swiftpm` folder inside
6. Tap on it — Swift Playgrounds opens

#### Option C: Using a Mac

1. Download or clone the repository
2. Open `CodingIntroApp.swiftpm` with the **Swift Playgrounds** app (not Xcode)
3. Or double-click the folder — macOS will suggest the right app

### Running the App

Once open in Swift Playgrounds:

1. Tap the **Play** button (triangle icon at the top) to build and run
2. The app will appear with **4 tabs** at the bottom
3. Go through the tabs in order — each one teaches something new

## The Four Tabs

### Tab 1: Hello World

**What you'll learn:** Variables, data types, text

**How it works:**
- Type your **name**, **age**, and **favorite emoji** in the text fields
- Tap **Run Code**
- See the console output — exactly like a real program

You'll see how different data types work: text needs quotes (`"hello"`), numbers don't (`42`), and booleans are just `true` or `false`.

The bottom section shows a cheat sheet of every concept with examples.

### Tab 2: Colors & Shapes

**What you'll learn:** How graphics work — coordinates, shapes, colors

**How it works:**
- Use **sliders** to move a circle around the screen
- Change the **color** by typing a hex code (like `FF1D55` for red)
- Change the **emoji** inside the shape
- Adjust the **radius** (size) with the slider
- Tap **Refresh Scene** to see your changes

The coordinate system is shown at the bottom:
- **x**: 0 (left) to 400 (right)
- **y**: 0 (bottom) to 600 (top)

### Tab 3: Ball Physics

**What you'll learn:** Gravity, bounciness, mass, real-time physics simulation

**How it works:**
- **Tap anywhere** on the dark scene to spawn random balls
- Use the **Gravity slider** to change how strong gravity is
- Tap **preset buttons** to try Moon, Earth, Jupiter, Zero Gravity, or Flipped
- Customize a ball (emoji, color, size, bounciness) and tap **Drop Ball**
- Watch how different settings change the way balls behave

**Physics controls:**

| Slider | What it does | Try this |
|---|---|---|
| Gravity | How hard things fall | Set to 0 for space, 9.8 for upside down |
| Radius | Ball size (also affects weight) | Tiny (10) vs huge (50) — drop both and watch the collision |
| Bounciness | Energy kept after bounce | 0.0 = clay, 1.0 = bounces forever |

### Tab 4: Your Challenge

**What you'll learn:** Customization, color theory, how code maps to visuals

**How it works:**
- Design your own ball using the controls
- Pick an **emoji**, **color** (from the palette or type a hex code), **size**, and **position**
- Tap **Drop It!** to see your ball fall alongside the teacher's example ball
- The **Your Code** section shows the exact Swift code that creates your ball
- **Tap the scene** to add more random balls!

## Tips for Teachers

### Before the Class

1. **Install Swift Playgrounds** on all iPads (it's free, no Apple ID required for school-managed devices)
2. **Transfer the project** to each iPad via one of:
   - **AirDrop**: Select all iPads at once, send `CodingIntroApp.swiftpm`
   - **iCloud Drive**: Put the folder in a shared iCloud folder
   - **Schoolwork app**: Create an assignment with the file attached
   - **USB**: Connect each iPad and copy via Finder
3. **Test it first**: Open on one iPad, tap Play, verify all 4 tabs work

### During the Class

| Tab | Recommended Time | Notes |
|---|---|---|
| 1. Hello World | 10 minutes | Let students type their info and read the output. Explain variables. |
| 2. Colors & Shapes | 15 minutes | Let students play with sliders freely. Explain coordinates. |
| 3. Ball Physics | 20 minutes | The most engaging part. Let them tap to create balls for 5 minutes before the structured exercises. |
| 4. Your Challenge | 15 minutes | Each student designs their unique ball. Walk around and see their creations. |

### Discussion Points

- **After Tab 1:** "What's the difference between `var` and `let`? When would you use each?"
- **After Tab 2:** "Why does the computer need x AND y to place something? What happens if you only had x?"
- **After Tab 3:** "What happens in zero gravity? Why do balls still move when they collide?" / "Which is more realistic — bounciness 0.5 or 1.0? Why?"
- **After Tab 4:** "Look at the code preview — can you read it? What does each line do?"

### For Advanced Students

Students who finish early can:
- Open the **source code** in Swift Playgrounds (tap the file list icon)
- Read `BallScene.swift` to see how the physics engine works
- Try modifying `BallScene.swift` to add new features (e.g., change wall bounciness, add a floor color)
- Move to the [Xcode Playground](../Playground/) for a code-first experience

## Troubleshooting

| Problem | Solution |
|---|---|
| "Unable to open" error | Make sure Swift Playgrounds is installed and updated to the latest version |
| App doesn't build | Tap the stop button, wait 3 seconds, tap play again. If it persists, close and reopen the project |
| Scene is black/empty | Tap the scene area — balls appear where you tap. On Tab 2/4, tap "Refresh Scene" |
| Sliders don't do anything | On Tab 2/4, tap "Refresh Scene" after changing sliders. On Tab 3, changes are instant |
| App crashes on older iPad | This app requires iPadOS 18+. Check Settings > General > Software Update |

## Differences from the Xcode Version

| Feature | iPad App | Xcode Playground |
|---|---|---|
| **Input** | Sliders, buttons, taps | Writing Swift code |
| **Learning style** | Visual, exploratory | Code-first, text-based |
| **Requires** | iPad + Swift Playgrounds (free) | Mac + Xcode (free) |
| **Git / GitHub** | Not included | Page 4 teaches Git workflow |
| **Best for** | Younger kids, first exposure | Teens, aspiring developers |

Both versions teach the same core concepts. Start with the iPad version for the "wow factor," then move to the Xcode version when students are ready to write code.
