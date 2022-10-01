import Charts
import SwiftUI

struct CityView: View {
    @EnvironmentObject var router: Router

    var city: City

    var body: some View {
        VStack {
            ZStack {
                if city.isCapital {
                    Text("🌟")
                        .font(.system(size: 200))
                }
                HStack {
                    Text("\(city.name), \(city.country)")
                        .font(.title2)
                }
            }
            .frame(height: 220)

            Chart(city.fellowCities) { city in

                BarMark(
                    x: .value("City", city.name),
                    y: .value("Population", city.population)
                )
                .foregroundStyle(by: .value("City", city.name))
            }
            .chartLegend(.hidden)
            .padding()

            Button("Back to Countries") {
                router.reset()
            }
            .buttonStyle(.borderedProminent)
        }
        .navigationTitle("City")
        .navigationBarTitleDisplayMode(.inline)
    }
}
