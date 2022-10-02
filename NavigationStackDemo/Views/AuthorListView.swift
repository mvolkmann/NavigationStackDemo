import SwiftUI

struct Author: Hashable, Identifiable {
    let name: String
    let numBooks: Int
    let color: Color
    var id: String { name }

    static var authors: [Author] {
        [
            .init(name: "Mark Twain", numBooks: 28, color: .orange),
            .init(name: "Robert Ludlum", numBooks: 27, color: .red),
            .init(name: "Robert Harris", numBooks: 18, color: .purple),
            .init(name: "Jane Austen", numBooks: 7, color: .cyan),
            .init(name: "Agatha Christie", numBooks: 66, color: .blue)
        ]
    }
}

struct AuthorListView: View {
    // Use this approach when all the NavigationLink values have the same type.
    // @State private var path: [Author] = []

    // Use this approach when the NavigationLink values have differing types.
    @State private var path = NavigationPath()

    let authors = Author.authors

    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                // This demonstrates using NavigationLinks
                // whose values have different types.
                NavigationLink(authors[0].name, value: authors[0].name)
                NavigationLink(authors[1].name, value: authors[1].numBooks)
                NavigationLink(authors[2].name, value: authors[2].color)
                NavigationLink(authors[3].name, value: authors[3])
                Button("Random") {
                    let author = authors.randomElement()!
                    path.append(author)
                }
            }
            .buttonStyle(.bordered)

            // This specifies a different navigation destination
            // for each supported value type.
            .navigationDestination(for: String.self) { string in
                Text(string).font(.largeTitle)
            }
            .navigationDestination(for: Int.self) { numBooks in
                Text("\(numBooks) books").font(.largeTitle)
            }
            .navigationDestination(for: Color.self) { color in
                color
            }
            .navigationDestination(for: Author.self) { author in
                ZStack {
                    author.color
                    VStack {
                        Text(author.name)
                        Text("\(author.numBooks)")
                    }
                }
            }

            .navigationTitle("Authors")
        }
    }
}
