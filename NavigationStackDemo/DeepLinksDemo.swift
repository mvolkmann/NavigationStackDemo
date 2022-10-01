import SwiftUI

struct DeepLinksDemo: View {
    var body: some View {
        NavigationStack {
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
