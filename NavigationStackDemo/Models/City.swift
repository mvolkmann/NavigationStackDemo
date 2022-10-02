import Foundation

struct City: Hashable, Identifiable {
    var name: String
    var country: String
    var isCapital = false
    var population: Int
    var id: String { name }

    static var cities: [City] {
        [
            .init(
                name: "Ottawa",
                country: "Canada",
                isCapital: true,
                population: 1_433_000
            ),
            .init(name: "Toronto", country: "Canada", population: 6_313_000),
            .init(name: "Vancouver", country: "Canada", population: 2_632_000),
            .init(name: "Victoria", country: "Canada", population: 394_000),

            .init(
                name: "Denver",
                country: "United States",
                population: 2_897_000
            ),
            .init(
                name: "San Francisco",
                country: "United States",
                population: 3_318_000
            ),
            .init(
                name: "Seattle",
                country: "United States",
                population: 4_102_100
            ),
            .init(
                name: "Washington D.C.",
                country: "United States",
                isCapital: true,
                population: 5_434_000
            ),

            .init(
                name: "Belfast",
                country: "United Kingdom",
                population: 630_000
            ),
            .init(
                name: "Cardiff",
                country: "United Kingdom",
                population: 485_000
            ),
            .init(
                name: "Edinburgh",
                country: "United Kingdom",
                population: 548_000
            ),
            .init(
                name: "Glasgow",
                country: "United Kingdom",
                population: 1_689_000
            ),
            .init(
                name: "Leeds",
                country: "United Kingdom",
                population: 780_000
            ),
            .init(
                name: "London",
                country: "United Kingdom",
                isCapital: true,
                population: 95_410_000
            ),

            .init(name: "Lyon", country: "France", population: 1_748_000),
            .init(name: "Marseille", country: "France", population: 1_620_000),
            .init(name: "Nice", country: "France", population: 945_000),
            .init(
                name: "Paris",
                country: "France",
                isCapital: true,
                population: 2_140_000
            ),
            .init(name: "Toulon", country: "France", population: 584_000),

            .init(name: "Cancun", country: "Mexico", population: 998_000),
            .init(name: "Chihuahua", country: "Mexico", population: 809_232),
            .init(name: "Iztapalapa", country: "Mexico", population: 1_815_000),
            .init(
                name: "Mexico City",
                country: "Mexico",
                isCapital: true,
                population: 22_085_000
            ),
            .init(name: "Monterrey", country: "Mexico", population: 1_135_000),
            .init(name: "Puebla", country: "Mexico", population: 1_434_000),
            .init(name: "Tijuana", country: "Mexico", population: 2_221_000)
        ]
    }

    var fellowCities: [City] {
        Self.cities.filter { $0.country == country }
    }

    static func inCountry(_ countryName: String) -> [City] {
        Self.cities.filter { $0.country == countryName }
    }
}

