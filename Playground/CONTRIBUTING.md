# How to Contribute — Step by Step

This guide walks you through making your first contribution to AtomKit.
By the end, your code will be part of a real Swift package.

## What You Need

- A Mac with [Xcode](https://apps.apple.com/app/xcode/id497799835) installed
- A [GitHub](https://github.com) account
- Basic understanding of Swift (go through the [Playground](CodingIntro.playground) first if you're new!)

## What You'll Do

You'll add a **preset** to one of three files. A preset is a named configuration
that other developers can use in their apps. You can add:

- A **style preset** — a visual look for an atom (color + effects)
- A **color palette** — a themed collection of colors
- A **physics preset** — a set of physics properties (bounciness, weight, friction)

## Step 1: Fork the Repository

Go to the AtomKit repository on GitHub and click the **Fork** button
in the top-right corner. This creates your own copy of the project.

## Step 2: Clone Your Fork

Open **Terminal** (press Cmd + Space, type "Terminal", press Enter) and run:

```bash
git clone https://github.com/YOUR_USERNAME/AtomKit.git
```

Replace `YOUR_USERNAME` with your actual GitHub username.

Then go into the project folder:

```bash
cd AtomKit
```

## Step 3: Create a Branch

A branch is like a separate workspace where you make changes
without affecting the main code. Name it after what you're adding:

```bash
git checkout -b add-preset-your-name
```

Replace `your-name` with your actual name (no spaces, use dashes).

## Step 4: Open in Xcode

```bash
open Package.swift
```

This opens the project in Xcode. You'll see the file tree on the left.
Navigate to `Sources → AtomKit → Presets`.

## Step 5: Add Your Preset

Pick one of the three files and add your entry.
Each file has a template at the bottom — look for the comment that says
"Add your ... below!"

### Option A: Add a Style Preset

Open `StylePresets.swift` and add a new `NamedStyle` to the `all` array:

```swift
NamedStyle(
    id: "galaxy_glow",           // unique ID, lowercase with underscores
    name: "Galaxy Glow",         // display name
    style: AtomStyle(hexColor: "6C3483", layers: [
        EffectLayer(effect: .glass, variant: 5),
        EffectLayer(effect: .glow, opacity: 0.6),
    ]),
    author: "Your Name"
),
```

**Available effects:** `.glass`, `.gloss`, `.matte`, `.gradient`, `.glow`

**Glass variants:** 0 = Clear, 1 = Frosted, 2 = Crystal, 3 = Bubble, 4 = Tinted, 5 = Gem, 6 = Pearl

**Hex colors:** Find any color at [htmlcolorcodes.com](https://htmlcolorcodes.com)

### Option B: Add a Color Palette

Open `ColorPalettes.swift` and add a new `Palette`:

```swift
Palette(
    id: "candy",
    name: "Candy",
    colors: [
        ("Bubblegum", "FF69B4"),
        ("Mint", "98FB98"),
        ("Lemon", "FFF44F"),
        ("Lavender", "E6E6FA"),
    ],
    author: "Your Name"
),
```

A palette needs at least 2 colors. Each color has a name and a hex code.

### Option C: Add a Physics Preset

Open `PhysicsPresets.swift` and add a new `NamedPhysics`:

```swift
NamedPhysics(
    id: "jelly",
    name: "Jelly",
    config: PhysicsConfig(
        restitution: 0.8,       // bounciness: 0.0 (dead stop) – 1.0 (perfect bounce)
        friction: 0.1,          // surface grip: 0.0 (ice) – 1.0 (sandpaper)
        linearDamping: 0.3,     // air resistance: 0.0 (vacuum) – 2.0+ (thick liquid)
        angularDamping: 0.1,    // spin resistance: 0.0 (spins forever) – 2.0+
        massMultiplier: 0.05    // weight factor: 0.01 (feather) – 0.5 (heavy)
    ),
    author: "Your Name"
),
```

## Step 6: Run the Tests

In Terminal, make sure you're in the project folder, then run:

```bash
swift test
```

You should see something like:

```
Test run with 23 tests in 5 suites passed after 0.001 seconds.
```

If a test fails, it will tell you what's wrong — usually a duplicate ID
or an invalid hex code. Fix it and run `swift test` again.

## Step 7: Commit Your Changes

```bash
git add .
git commit -m "Add style preset from Your Name"
```

Write a short message describing what you added.

## Step 8: Push to Your Fork

```bash
git push origin add-preset-your-name
```

This sends your branch to GitHub.

## Step 9: Open a Pull Request

1. Go to your fork on **github.com**
2. You'll see a yellow banner: **"add-preset-your-name had recent pushes"**
3. Click **"Compare & pull request"**
4. Write a short title (e.g. "Add Galaxy Glow style preset")
5. Click **"Create pull request"**

That's it! Your teacher will review your code, and when it's merged,
your preset becomes part of the package.

## Rules

- Your `id` must be unique — no two presets can have the same ID
- Hex codes must be exactly 6 characters (letters A-F and digits 0-9)
- Physics values must be in valid ranges (tests will catch this)
- One preset per Pull Request — keep it focused
