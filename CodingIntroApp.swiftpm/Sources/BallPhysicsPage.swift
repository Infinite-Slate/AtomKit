import SwiftUI
import SpriteKit

// ============================================================================
// Page 3: Ball Physics
//
// Interactive physics sandbox. Students control gravity and add balls
// with different properties. Teaches: physics, for loops, parameters.
// ============================================================================

struct BallPhysicsPage: View {
    @State private var gravityY: Double = -9.8
    @State private var scene: BallPlayground = {
        let s = BallPlayground(size: CGSize(width: 400, height: 600))
        s.scaleMode = .aspectFit
        s.physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
        return s
    }()

    @State private var ballEmoji = "⭐️"
    @State private var ballRadius: CGFloat = 30
    @State private var ballBounciness: CGFloat = 0.7
    @State private var ballColorHex = "FBBF24"

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // SpriteKit view — tap to add balls!
                SpriteView(scene: scene)
                    .frame(height: 340)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.horizontal)

                ScrollView {
                    VStack(spacing: 12) {
                        // Gravity
                        GroupBox("Gravity") {
                            VStack(spacing: 6) {
                                HStack {
                                    Slider(value: $gravityY, in: -25...25, step: 0.1)
                                        .onChange(of: gravityY) { _, newValue in
                                            scene.physicsWorld.gravity = CGVector(dx: 0, dy: newValue)
                                        }
                                    Text(gravityLabel)
                                        .font(.system(.caption, design: .monospaced))
                                        .frame(width: 80, alignment: .trailing)
                                }
                                HStack(spacing: 8) {
                                    gravityPreset("Moon", -1.6)
                                    gravityPreset("Earth", -9.8)
                                    gravityPreset("Jupiter", -24.8)
                                    gravityPreset("Zero", 0)
                                    gravityPreset("Flip!", 9.8)
                                }
                                .font(.caption2)
                            }
                            .padding(.vertical, 4)
                        }

                        // Ball controls
                        GroupBox("Add a Ball") {
                            VStack(spacing: 8) {
                                HStack {
                                    Text("Emoji:")
                                        .frame(width: 70, alignment: .leading)
                                    TextField("", text: $ballEmoji)
                                        .textFieldStyle(.roundedBorder)
                                        .frame(width: 60)
                                    Spacer()
                                    Text("Color:")
                                    TextField("Hex", text: $ballColorHex)
                                        .textFieldStyle(.roundedBorder)
                                        .frame(width: 80)
                                        .font(.system(.caption, design: .monospaced))
                                }

                                labeledSlider("Radius", value: $ballRadius, range: 10...50)
                                labeledSlider("Bounciness", value: $ballBounciness, range: 0...1)

                                Button {
                                    let x = CGFloat.random(in: 50...350)
                                    scene.addBall(
                                        emoji: ballEmoji,
                                        color: UIColor(hex: ballColorHex),
                                        radius: ballRadius,
                                        at: CGPoint(x: x, y: 550),
                                        bounciness: ballBounciness
                                    )
                                } label: {
                                    Label("Drop Ball", systemImage: "plus.circle.fill")
                                        .frame(maxWidth: .infinity)
                                }
                                .buttonStyle(.borderedProminent)
                                .tint(.orange)
                            }
                            .padding(.vertical, 4)
                        }

                        // Cheat sheet
                        GroupBox("Physics Cheat Sheet") {
                            VStack(alignment: .leading, spacing: 4) {
                                cheatRow("Bounciness 0.0", "No bounce (clay)")
                                cheatRow("Bounciness 0.5", "Half bounce (tennis ball)")
                                cheatRow("Bounciness 1.0", "Perfect bounce (forever)")
                                cheatRow("Radius 10", "Tiny, light")
                                cheatRow("Radius 30", "Medium, balanced")
                                cheatRow("Radius 50", "Huge, heavy")
                            }
                            .padding(.vertical, 4)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)
                }
            }
            .navigationTitle("Ball Physics! 🎱")
        }
    }

    private var gravityLabel: String {
        if gravityY == 0 { return "Space!" }
        if gravityY > 0 { return "Flipped!" }
        return String(format: "%.1f", gravityY)
    }

    private func gravityPreset(_ name: String, _ value: Double) -> some View {
        Button(name) {
            gravityY = value
            scene.physicsWorld.gravity = CGVector(dx: 0, dy: value)
        }
        .buttonStyle(.bordered)
    }

    private func labeledSlider(_ label: String, value: Binding<CGFloat>, range: ClosedRange<CGFloat>) -> some View {
        HStack {
            Text(label)
                .font(.caption)
                .frame(width: 75, alignment: .leading)
            Slider(value: value, in: range)
            Text(String(format: "%.1f", value.wrappedValue))
                .font(.system(.caption, design: .monospaced))
                .frame(width: 35, alignment: .trailing)
        }
    }

    private func cheatRow(_ key: String, _ value: String) -> some View {
        HStack {
            Text(key)
                .font(.system(.caption, design: .monospaced))
                .fontWeight(.medium)
                .frame(width: 130, alignment: .leading)
            Text(value)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}
