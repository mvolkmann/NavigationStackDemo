import SwiftUI

class Router: ObservableObject {
    @Published var path = NavigationPath()
    @Published var selectedTab: String = "Countries"

    func reset() {
        path = NavigationPath()
    }
}
