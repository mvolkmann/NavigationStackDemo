import SwiftUI

struct CountryView: View {
    var country: Country

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(country.flag)
                Text(country.name)
            }
            .font(.largeTitle)
            HStack {
                Spacer()
                Text("Population: \(country.population)")
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Country")
    }
}
