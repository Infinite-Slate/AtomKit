import SwiftUI
import SpriteKit

// ============================================================================
// Page 4: Your Challenge!
//
// Students create their own ball and see it live. The scene includes
// the teacher example ball plus the student's custom ball.
// ============================================================================

struct YourChallengePage: View {
    @State private var myEmoji = "🎮"
    @State private var myColorHex = "A855F7"
    @State private var myRadius: CGFloat = 25
    @State private var myX: CGFloat = 150
    @State private var myY: CGFloat = 500
    @State private var sceneId = UUID()

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Live scene
                SpriteView(scene: makeScene())
                    .id(sceneId)
                    .frame(height: 340)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.horizontal)

                ScrollView {
                    VStack(spacing: 12) {
                        GroupBox("Your Ball") {
                            VStack(spacing: 10) {
                                HStack {
                                    Text("Emoji:")
                                        .frame(width: 55, alignment: .leading)
                                    TextField("", text: $myEmoji)
                                        .textFieldStyle(.roundedBorder)
                                        .frame(width: 60)
                                    Spacer()
                                    Text("Color:")
                                    TextField("Hex", text: $myColorHex)
                                        .textFieldStyle(.roundedBorder)
                                        .frame(width: 80)
                                        .font(.system(.caption, design: .monospaced))
                                }

                                labeledSlider("Radius", value: $myRadius, range: 15...45)
                                labeledSlider("X Position", value: $myX, range: 30...370)
                                labeledSlider("Y Position", value: $myY, range: 400...570)
                            }
                            .padding(.vertical, 4)
                        }

                        Button {
                            sceneId = UUID()
                        } label: {
                            Label("Drop It!", systemImage: "play.fill")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.green)

                        // Code preview
                        GroupBox("Your Code") {
                            Text(codePreview)
                                .font(.system(.caption, design: .monospaced))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.vertical, 4)
                        }

                        // Color suggestions
                        GroupBox("Color Ideas") {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 6) {
                                colorSwatch("Red", "FF1D55")
                                colorSwatch("Purple", "A855F7")
                                colorSwatch("Blue", "38A9EB")
                                colorSwatch("Green", "34D399")
                                colorSwatch("Yellow", "FBBF24")
                                colorSwatch("Turquoise", "2DD4BF")
                                colorSwatch("Coral", "FF6B6B")
                                colorSwatch("Mint", "4ECDC4")
                            }
                            .padding(.vertical, 4)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)
                }
            }
            .navigationTitle("Your Challenge! 🏆")
        }
    }

    private var codePreview: String {
        """
        scene.addBall(
            emoji: "\(myEmoji)",
            color: SKColor(hex: "\(myColorHex)"),
            radius: \(Int(myRadius)),
            at: CGPoint(x: \(Int(myX)), y: \(Int(myY)))
        )
        """
    }

    private func makeScene() -> SKScene {
        let scene = BallPlayground(size: CGSize(width: 400, height: 600))
        scene.scaleMode = .aspectFit
        scene.physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)

        // Teacher example
        scene.addBall(emoji: "🍎", color: .systemRed, radius: 30, at: CGPoint(x: 200, y: 550))

        // Student's ball
        scene.addBall(
            emoji: myEmoji,
            color: SKColor(hex: myColorHex),
            radius: myRadius,
            at: CGPoint(x: myX, y: myY)
        )

        return scene
    }

    private func labeledSlider(_ label: String, value: Binding<CGFloat>, range: ClosedRange<CGFloat>) -> some View {
        HStack {
            Text(label)
                .font(.caption)
                .frame(width: 75, alignment: .leading)
            Slider(value: value, in: range)
            Text("\(Int(value.wrappedValue))")
                .font(.system(.caption, design: .monospaced))
                .frame(width: 35, alignment: .trailing)
        }
    }

    private func colorSwatch(_ name: String, _ hex: String) -> some View {
        Button {
            myColorHex = hex
            sceneId = UUID()
        } label: {
            HStack(spacing: 6) {
                Circle()
                    .fill(Color(hex: hex))
                    .frame(width: 16, height: 16)
                Text(name)
                    .font(.caption)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .buttonStyle(.plain)
    }
}
