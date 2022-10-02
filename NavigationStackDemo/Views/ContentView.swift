import SwiftUI

// This is based on the Stewart Lynch video at
// https://www.youtube.com/watch?v=6-OeaFfDXXw
struct ContentView: View {
    @EnvironmentObject var router: Router

    var body: some View {
        TabView(selection: $router.selectedTab) {
            FruitListView()
                .tabItem {
                    Label("Fruits", systemImage: "1.circle.fill")
                }
                .tag("Fruits")
            AuthorListView()
                .tabItem {
                    Label("Authors", systemImage: "2.circle.fill")
                }
                .tag("Authors")
            CountryStackView()
                .tabItem {
                    Label("Countries Stack", systemImage: "3.circle.fill")
                }
                .tag("Countries Stack")
            CountrySplitView()
                .tabItem {
                    Label("Countries Split", systemImage: "4.circle.fill")
                }
                .tag("Countries")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
