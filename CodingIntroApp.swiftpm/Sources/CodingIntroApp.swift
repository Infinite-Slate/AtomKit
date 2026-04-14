import SwiftUI

@main
struct CodingIntroApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: 500, minHeight: 600)
        }
        #if os(macOS)
        .defaultSize(width: 600, height: 800)
        #endif
    }
}

struct ContentView: View {
    @State private var selectedTab = 0

    var body: some View {
        #if os(iOS)
        TabView(selection: $selectedTab) {
            Tab("1. Hello World", systemImage: "hand.wave", value: 0) {
                HelloWorldPage()
            }
            Tab("2. Shapes", systemImage: "paintpalette", value: 1) {
                ColorsAndShapesPage()
            }
            Tab("3. Physics", systemImage: "circle.circle", value: 2) {
                BallPhysicsPage()
            }
            Tab("4. Challenge", systemImage: "trophy", value: 3) {
                YourChallengePage()
            }
        }
        #else
        NavigationSplitView {
            List(selection: $selectedTab) {
                Label("Hello World", systemImage: "hand.wave").tag(0)
                Label("Colors & Shapes", systemImage: "paintpalette").tag(1)
                Label("Ball Physics", systemImage: "circle.circle").tag(2)
                Label("Your Challenge", systemImage: "trophy").tag(3)
            }
            .navigationTitle("CodingIntro")
        } detail: {
            switch selectedTab {
            case 0: HelloWorldPage()
            case 1: ColorsAndShapesPage()
            case 2: BallPhysicsPage()
            case 3: YourChallengePage()
            default: HelloWorldPage()
            }
        }
        #endif
    }
}
