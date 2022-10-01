import Foundation

struct Country: Hashable, Identifiable {
    var name: String
    var flag: String
    var population: Int
    var cities: [City]
    var id: String { name }

    static var countries: [Country] {
        [
            Country(
                name: "Canada",
                flag: "🇨🇦",
                population: 36_991_981,
                cities: City.cities.filter { $0.country == "Canada" }
            ),
            Country(
                name: "United States",
                flag: "🇺🇸",
                population: 332_278_200,
                cities: City.cities.filter { $0.country == "United States" }
            ),
            Country(
                name: "United Kingdom",
                flag: "🇬🇧",
                population: 67_886_004,
                cities: City.cities.filter { $0.country == "United Kingdom" }
            ),
            Country(
                name: "France",
                flag: "🇫🇷",
                population: 67_413_000,
                cities: City.cities.filter { $0.country == "France" }
            ),
            Country(
                name: "Mexico",
                flag: "🇲🇽",
                population: 128_830,
                cities: City.cities.filter { $0.country == "Mexico" }
            ),
        ]
    }
}

struct City: Hashable, Identifiable {
    var name: String
    var country: String
    var isCapital = false
    var population: Int
    var id: String { name }

    static var cities: [City] {
        [
            City(name: "Vancouver", country: "Canada", population: 2_632_000),
            City(name: "Victoria", country: "Canada", population: 394_000),
            City(name: "Toronto", country: "Canada", population: 6_313_000),
            City(
                name: "Ottawa",
                country: "Canada",
                isCapital: true,
                population: 1_433_000
            ),
            City(
                name: "Seattle",
                country: "United States",
                population: 4_102_100
            ),
            City(
                name: "Denver",
                country: "United States",
                population: 2_897_000
            ),
            City(
                name: "San Francisco",
                country: "United States",
                population: 3_318_000
            ),
            City(
                name: "Washington D.C.",
                country: "United States",
                isCapital: true,
                population: 5_434_000
            ),
            City(
                name: "London",
                country: "United Kingdom",
                isCapital: true,
                population: 95_410_000
            ),
            City(
                name: "Glasgow",
                country: "United Kingdom",
                population: 1_689_000
            ),
            City(
                name: "Cardiff",
                country: "United Kingdom",
                population: 485_000
            ),
            City(name: "Leeds", country: "United Kingdom", population: 780_000),
            City(
                name: "Edinburgh",
                country: "United Kingdom",
                population: 548_000
            ),
            City(
                name: "Belfast",
                country: "United Kingdom",
                population: 630_000
            ),
            City(name: "Lyon", country: "France", population: 1_748_000),
            City(
                name: "Paris",
                country: "France",
                isCapital: true,
                population: 2_140_000
            ),
            City(name: "Marseille", country: "France", population: 1_620_000),
            City(name: "Toulon", country: "France", population: 584_000),
            City(name: "Nice", country: "France", population: 945_000),
            City(name: "Tijuana", country: "Mexico", population: 2_221_000),
            City(
                name: "Mexico City",
                country: "Mexico",
                isCapital: true,
                population: 22_085_000
            ),
            City(name: "Cancun", country: "Mexico", population: 998_000),
            City(name: "Monterrey", country: "Mexico", population: 1_135_000),
            City(name: "Iztapalapa", country: "Mexico", population: 1_815_000),
            City(name: "Puebla", country: "Mexico", population: 1_434_000),
            City(name: "Chihuahua", country: "Mexico", population: 809_232)
        ]
    }

    var fellowCities: [City] {
        Self.cities.filter { $0.country == country }
    }
}
