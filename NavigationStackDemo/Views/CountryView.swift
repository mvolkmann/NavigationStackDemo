import SwiftUI

struct CountryView: View {
    @EnvironmentObject var router: Router

    var country: Country

    var body: some View {
        /* This works!
         VStack(alignment: .leading) {
             HStack {
                 Spacer()
                 Text("Population: \(country.population)")
             }

             // TODO: Sort the cities alphabetically.
             List(country.cities) { city in
                 NavigationLink(value: city) {
                     Text(city.name)
                 }
             }
         }
         .padding()
         .navigationTitle("Cities in \(country.name) \(country.flag)")
         .navigationDestination(for: City.self) { city in
             CityView(city: city)
         }
         */

        VStack(alignment: .leading) {
            // This only renders a split view on an iPad.
            // On an iPhone it uses a NavigationStack, even in landscape mode.
            NavigationSplitView(columnVisibility: .constant(.all)) {
                Text("in \(country.name) \(country.flag)")
                    .font(.title2)
                    .border(.red)
                HStack {
                    Spacer()
                    Text("Population: \(country.population)")
                }

                // TODO: Sort the cities alphabetically.
                List(country.cities, selection: $router.selectedCity) { city in
                    Text(city.name)
                }
                .navigationTitle("Cities")
            } detail: {
                // TODO: Why does selectedCity not get set after tapping a city name in the List above?
                if let city = router.selectedCity {
                    CityView(city: city)
                } else {
                    Text("Select a city.").font(.largeTitle)
                }
            }
            // This makes it so the left nav to does not overlap the detail area.
            .navigationSplitViewStyle(.balanced)
        }
    }
}
