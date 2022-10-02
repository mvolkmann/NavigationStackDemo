import SwiftUI

struct CountryListView: View {
    @EnvironmentObject var router: Router
    @State private var countryFilter = ""

    private var filteredCountries: [Country] {
        guard !countryFilter.isEmpty else { return Country.countries }
        return Country.countries.filter {
            $0.name.lowercased().contains(countryFilter.lowercased())
        }
    }

    var body: some View {
        /* THIS WORKS!
         NavigationStack(path: $router.path) {
             List(Country.countries) { country in
                 NavigationLink(value: country) {
                     Text("\(country.flag) \(country.name)")
                 }
             }
             .navigationDestination(for: Country.self) { country in
                 CountryView(country: country)
             }
             .navigationTitle("Countries")
         }
          */

        // This only renders a split view on an iPad.
        // On an iPhone it uses a NavigationStack, even in landscape mode.
        NavigationSplitView(columnVisibility: .constant(.all)) {
            List(
                filteredCountries,
                selection: $router.selectedCountry
            ) { country in
                NavigationLink(value: country) {
                    Text("\(country.flag) \(country.name)")
                }
            }
            .navigationTitle("Countries")

            // This adds a search input above the list
            // that can be used to filter the list
            .searchable(text: $countryFilter)

            // This prevents the first character entered in the search input
            // from being changed to uppercase.
            .autocapitalization(.none)
        } detail: {
            if let country = router.selectedCountry {
                CountryView(country: country)
            } else {
                Text("Select a country.").font(.largeTitle)
            }
        }
        // This makes it so the left nav to does not overlap the detail area.
        .navigationSplitViewStyle(.balanced)
        // TODO: Fix this.
        /*
         .onChange(of: $router.selectedCountry) { _ in
             router.selectedCity = nil
         }
         */
    }
}
