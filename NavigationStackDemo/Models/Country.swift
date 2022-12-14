import Foundation

struct Country: Hashable, Identifiable {
    var name: String
    var flag: String
    var population: Int
    var cities: [City]
    var id: String { name }

    static var countries: [Country] {
        [
            .init(
                name: "Canada",
                flag: "π¨π¦",
                population: 36_991_981,
                cities: City.inCountry("Canada")
            ),
            .init(
                name: "France",
                flag: "π«π·",
                population: 67_413_000,
                cities: City.inCountry("France")
            ),
            .init(
                name: "Mexico",
                flag: "π²π½",
                population: 129_829_800,
                cities: City.inCountry("Mexico")
            ),
            .init(
                name: "United States",
                flag: "πΊπΈ",
                population: 331_893_745,
                cities: City.inCountry("United States")
            ),
            .init(
                name: "United Kingdom",
                flag: "π¬π§",
                population: 67_886_004,
                cities: City.inCountry("United Kingdom")
            )
        ]
    }
}
