import SwiftUI

@main
struct CodingIntroApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                HelloWorldPage()
                    .tabItem {
                        Label("1. Hello World", systemImage: "hand.wave")
                    }

                ColorsAndShapesPage()
                    .tabItem {
                        Label("2. Shapes", systemImage: "paintpalette")
                    }

                BallPhysicsPage()
                    .tabItem {
                        Label("3. Physics", systemImage: "circle.circle")
                    }

                YourChallengePage()
                    .tabItem {
                        Label("4. Challenge", systemImage: "trophy")
                    }
            }
        }
    }
}
