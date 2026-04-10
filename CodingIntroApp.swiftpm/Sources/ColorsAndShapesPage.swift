import SwiftUI
import SpriteKit

// ============================================================================
// Page 2: Colors and Shapes
//
// Interactive SpriteKit scene where students control shapes via sliders.
// Teaches: SKScene, SKShapeNode, coordinate system, colors.
// ============================================================================

struct ColorsAndShapesPage: View {
    @State private var circleX: CGFloat = 120
    @State private var circleY: CGFloat = 480
    @State private var circleRadius: CGFloat = 50
    @State private var circleColorHex = "38A9EB"
    @State private var emoji = "🌟"
    @State private var sceneId = UUID()

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // SpriteKit view
                SpriteView(scene: makeScene())
                    .id(sceneId)
                    .frame(height: 340)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.horizontal)

                ScrollView {
                    VStack(spacing: 12) {
                        GroupBox("Controls") {
                            VStack(spacing: 10) {
                                HStack {
                                    Text("Emoji:")
                                        .frame(width: 55, alignment: .leading)
                                    TextField("", text: $emoji)
                                        .textFieldStyle(.roundedBorder)
                                        .frame(width: 60)
                                    Spacer()
                                    Text("Color:")
                                        .frame(width: 45, alignment: .leading)
                                    TextField("Hex", text: $circleColorHex)
                                        .textFieldStyle(.roundedBorder)
                                        .frame(width: 80)
                                        .font(.system(.body, design: .monospaced))
                                }

                                labeledSlider("X Position", value: $circleX, range: 20...380)
                                labeledSlider("Y Position", value: $circleY, range: 20...580)
                                labeledSlider("Radius", value: $circleRadius, range: 15...80)
                            }
                            .padding(.vertical, 4)
                        }

                        Button {
                            sceneId = UUID()
                        } label: {
                            Label("Refresh Scene", systemImage: "arrow.clockwise")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.blue)

                        GroupBox("Coordinate System") {
                            Text("x: 0 (left) → 400 (right)\ny: 0 (bottom) → 600 (top)\nBottom-left corner is (0, 0)")
                                .font(.system(.caption, design: .monospaced))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.vertical, 4)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)
                }
            }
            .navigationTitle("Colors & Shapes 🎨")
        }
    }

    private func makeScene() -> SKScene {
        let scene = SKScene(size: CGSize(width: 400, height: 600))
        scene.backgroundColor = SKColor(red: 0.08, green: 0.08, blue: 0.14, alpha: 1)
        scene.scaleMode = .aspectFit

        let circle = SKShapeNode(circleOfRadius: circleRadius)
        circle.fillColor = UIColor(hex: circleColorHex)
        circle.strokeColor = .white
        circle.lineWidth = 3
        circle.position = CGPoint(x: circleX, y: circleY)
        scene.addChild(circle)

        let label = SKLabelNode(text: emoji)
        label.fontSize = circleRadius * 0.8
        label.verticalAlignmentMode = .center
        circle.addChild(label)

        let title = SKLabelNode(text: "My First Drawing!")
        title.fontSize = 22
        title.fontColor = .white
        title.fontName = "AvenirNext-Bold"
        title.position = CGPoint(x: 200, y: 200)
        scene.addChild(title)

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
}
