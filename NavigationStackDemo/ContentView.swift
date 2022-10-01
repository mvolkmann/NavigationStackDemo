import SwiftUI

// This is based on the Stewart Lynch video at
// https://www.youtube.com/watch?v=6-OeaFfDXXw
struct ContentView: View {
    var body: some View {
        TabView {
            FruitListView()
                .tabItem {
                    Label("Fruits", systemImage: "1.circle.fill")
                }
            AuthorListView()
                .tabItem {
                    Label("Authors", systemImage: "2.circle.fill")
                }
            CountryListView()
                .tabItem {
                    Label("Countries", systemImage: "3.circle.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
