import SwiftUI

struct CountrySplitView: View {
    @EnvironmentObject var router: Router
    @State private var countryFilter = ""
    @State private var selectedCity: City?
    @State private var selectedCountry: Country?

    // This is the middle view.
    private var content: some View {
        VStack(alignment: .leading) {
            if let selectedCountry {
                Text(
                    "\(selectedCountry.flag) \(selectedCountry.name)"
                )
                .font(.title2)
                HStack {
                    Spacer()
                    Text("Population: \(selectedCountry.population)")
                }

                List(
                    selectedCountry.cities,
                    id: \.self,
                    selection: $selectedCity
                ) { city in
                    Text(city.name)
                }
            } else {
                Text("Select a country.").font(.largeTitle)
            }
        }
        .padding()
        .navigationTitle("Cities")
        .navigationBarTitleDisplayMode(.inline)
    }

    // This is the right view.
    private var detail: some View {
        VStack {
            if let selectedCity {
                CityView(city: selectedCity)
            } else if let selectedCountry {
                Text("Select a city.").font(.largeTitle)
            }
        }
        .navigationTitle("Selected City")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var filteredCountries: [Country] {
        guard !countryFilter.isEmpty else { return Country.countries }
        return Country.countries.filter {
            $0.name.lowercased().contains(countryFilter.lowercased())
        }
    }

    // This is the left view.
    private var sidebar: some View {
        List(
            filteredCountries,
            selection: $selectedCountry
        ) { country in
            NavigationLink(value: country) {
                Text("\(country.flag) \(country.name)")
            }
        }
        .navigationTitle("Countries")
        .navigationBarTitleDisplayMode(.inline)

        // This adds a search input above the list
        // that can be used to filter the list
        .searchable(text: $countryFilter)

        // This prevents the first character entered in the search input
        // from being changed to uppercase.
        .autocapitalization(.none)
    }

    var body: some View {
        // This renders a split view on an iPad, but uses a
        // NavigationStack on an iPhone, even in landscape mode.
        NavigationSplitView(
            columnVisibility: .constant(.all),
            sidebar: { sidebar },
            content: { content },
            detail: { detail }
        )

        // This makes it so the left nav to does not overlap the detail area.
        .navigationSplitViewStyle(.balanced)

        // When a new country is selected, clear the city selection.
        .onChange(of: selectedCountry) { _ in
            selectedCity = nil
        }
    }
}
