import SwiftUI

class Router: ObservableObject {
    @Published var path = NavigationPath()

    func reset() {
        path = NavigationPath()
    }
}
