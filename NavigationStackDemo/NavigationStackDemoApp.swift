import SwiftUI

@main
struct NavigationStackDemoApp: App {
    @StateObject var router = Router()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(router)
                .onOpenURL { url in
                    navigate(to: url)
                }
        }
    }

    private func navigate(to url: URL) {
        guard let scheme = url.scheme,
              scheme == "NavStack" else { return }
        guard let country = url.host else { return }

        if let matchedCountry = Country.countries.first(where: {
            $0.name == country
        }) {
            router.selectedTab = "Countries Stack"
            router.reset()
            router.path.append(matchedCountry)

            if url.pathComponents.count == 2 {
                let city = url.lastPathComponent
                if let matchedCity = matchedCountry.cities
                    .first(where: { $0.name == city }) {
                    router.path.append(matchedCity)
                }
            }
        }
    }
}
