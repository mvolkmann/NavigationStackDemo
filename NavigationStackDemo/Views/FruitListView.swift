import SwiftUI

struct FruitView: View {
    let item: String

    var body: some View {
        Text("You chose \(item).").font(.largeTitle)
    }
}

struct FruitListView: View {
    let fruits = ["🍎", "🍐", "🍋", "🍑", "🍌", "🍉", "🍇", "🍒", "🫐", "🍓"]

    var body: some View {
        NavigationStack {
            VStack {
                List(fruits, id: \.self) { fruit in
                    NavigationLink("Choose \(fruit)", value: fruit)
                }

                HStack {
                    NavigationLink("Show Favorite", value: fruits[3])
                    // This works because FruitView accepts any string.
                    NavigationLink("Smile", value: "😀")
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationDestination(for: String.self) { item in
                FruitView(item: item)
            }
            .navigationTitle("Fruit of the Day")
            .padding()
        }
    }
}
