import SwiftUI

class Router: ObservableObject {
    @Published var path = NavigationPath()
    @Published var selectedTab: String = "Fruits"

    func reset() {
        path = NavigationPath()
    }
}
