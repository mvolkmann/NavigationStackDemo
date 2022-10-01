import SwiftUI

// This is based on the Stewart Lynch video at
// https://www.youtube.com/watch?v=6-OeaFfDXXw
struct ContentView: View {
    var body: some View {
        TabView() {
            NavigationStackDemo()
                .tabItem {
                Label("NavigationStack", systemImage: "1.circle.fill")
            }
            NavigationLinksDemo()
                .tabItem {
                Label("NavigationLinks", systemImage: "2.circle.fill")
            }
            DeepLinksDemo()
                .tabItem {
                Label("Deep Links", systemImage: "3.circle.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
