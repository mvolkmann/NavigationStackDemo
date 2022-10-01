import SwiftUI

@main
struct NavigationStackDemoApp: App {
    @StateObject var router = Router()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(router)
        }
    }
}
