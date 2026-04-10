import SwiftUI

// ============================================================================
// Page 1: Hello, World!
//
// This page teaches Swift fundamentals: variables, types, arrays,
// if/else, and functions. Students edit values and see output live.
// ============================================================================

struct HelloWorldPage: View {
    @State private var name = "Your Name"
    @State private var age = 12
    @State private var favoriteEmoji = "🚀"
    @State private var loveCoding = true
    @State private var output: [String] = []

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    // Input section
                    GroupBox("Your Info") {
                        VStack(spacing: 12) {
                            HStack {
                                Text("Name:")
                                    .frame(width: 60, alignment: .leading)
                                TextField("Your name", text: $name)
                                    .textFieldStyle(.roundedBorder)
                            }
                            HStack {
                                Text("Age:")
                                    .frame(width: 60, alignment: .leading)
                                TextField("Age", value: $age, format: .number)
                                    .textFieldStyle(.roundedBorder)
                                    .keyboardType(.numberPad)
                            }
                            HStack {
                                Text("Emoji:")
                                    .frame(width: 60, alignment: .leading)
                                TextField("Emoji", text: $favoriteEmoji)
                                    .textFieldStyle(.roundedBorder)
                            }
                            Toggle("Love coding?", isOn: $loveCoding)
                        }
                        .padding(.vertical, 4)
                    }

                    // Run button
                    Button {
                        runCode()
                    } label: {
                        Label("Run Code", systemImage: "play.fill")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.green)

                    // Console output
                    GroupBox("Console Output") {
                        VStack(alignment: .leading, spacing: 4) {
                            if output.isEmpty {
                                Text("Press 'Run Code' to see output...")
                                    .foregroundStyle(.secondary)
                                    .italic()
                            } else {
                                ForEach(Array(output.enumerated()), id: \.offset) { _, line in
                                    Text(line)
                                        .font(.system(.body, design: .monospaced))
                                }
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 4)
                    }

                    // Lesson content
                    GroupBox("What You're Learning") {
                        VStack(alignment: .leading, spacing: 8) {
                            lessonRow("var", "A value that can change", "var score = 0")
                            lessonRow("let", "A value that's locked", "let pi = 3.14")
                            lessonRow("Int", "Whole number", "42")
                            lessonRow("String", "Text in quotes", "\"hello\"")
                            lessonRow("Bool", "True or false", "true")
                            lessonRow("Array", "A list of values", "[\"a\", \"b\"]")
                            lessonRow("print()", "Show on screen", "print(\"hi\")")
                        }
                        .padding(.vertical, 4)
                    }
                }
                .padding()
            }
            .navigationTitle("Hello, World! 👋")
        }
    }

    private func runCode() {
        output = [
            "Hello, \(name)! You just wrote real code.",
            "",
            "My name is \(name)",
            "I'm \(age) years old",
            "Do I love coding? \(loveCoding)",
            "My emoji: \(favoriteEmoji)",
            "",
            age >= 13 ? "\(name) is a teenager!" : "\(name) is \(age) — almost a teenager!",
            "",
            "Welcome, \(name)! You're one of us now. 🎉"
        ]
    }

    private func lessonRow(_ concept: String, _ description: String, _ example: String) -> some View {
        HStack(alignment: .top) {
            Text(concept)
                .font(.system(.caption, design: .monospaced))
                .fontWeight(.bold)
                .foregroundStyle(.blue)
                .frame(width: 60, alignment: .leading)
            Text(description)
                .font(.caption)
                .frame(width: 120, alignment: .leading)
            Text(example)
                .font(.system(.caption, design: .monospaced))
                .foregroundStyle(.secondary)
        }
    }
}
