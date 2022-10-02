import SwiftUI

class Router: ObservableObject {
    @Published var path = NavigationPath()
    @Published var selectedTab: String = "Countries Stack"

    func reset() {
        path = NavigationPath()
    }
}
