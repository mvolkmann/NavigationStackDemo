import SwiftUI

struct CountryListView: View {
    @EnvironmentObject var router: Router

    var body: some View {
        NavigationStack(path: $router.path) {
            List(Country.countries) { country in
                NavigationLink(value: country) {
                    HStack {
                        Text(country.flag)
                        Text(country.name)
                    }
                }
            }
            .navigationDestination(for: Country.self) { country in
                CountryView(country: country)
            }
            .navigationTitle("Countries")
        }
    }
}
