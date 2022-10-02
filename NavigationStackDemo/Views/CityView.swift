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
                Grid {
                    GridRow(alignment: .top) {
                        Text("City Name:").bold().gridColumnAlignment(.trailing)
                        Text(city.name).gridColumnAlignment(.leading)
                    }
                    // The remaining GridRows inherit column alignments
                    // from the first GridRow.
                    GridRow(alignment: .top) {
                        Text("Country:").bold()
                        Text(city.country)
                    }
                    GridRow(alignment: .top) {
                        Text("Population:").bold()
                        Text(city.population)
                    }
                }
                .font(.title2)
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

            // This is only useful when using NavigationStack
            // instead of NavigationSplitView.
            /*
             Button("Back to Countries") {
                 router.reset()
             }
             .buttonStyle(.borderedProminent)
             */
        }
    }
}
