import SwiftUI

class Router: ObservableObject {
    @Published var path = NavigationPath()
    @Published var selectedCity: City?
    @Published var selectedCountry: Country?
    @Published var selectedTab: String = "Fruits"

    func reset() {
        path = NavigationPath()
    }
}
