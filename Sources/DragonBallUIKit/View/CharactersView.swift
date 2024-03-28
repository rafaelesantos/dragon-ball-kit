import SwiftUI
import RefdsUI
import DragonBallKit

public struct CharactersView: View {
    @StateObject private var dragonBallKit = DragonBallKit.shared
    @State private var page: Int = 1
    @State private var limit: Int = 5
    
    public init() {}
    
    public var body: some View {
        NavigationStack {
            List {
                if let characters = dragonBallKit.characters, !characters.items.isEmpty {
                    ForEach(characters.items) { character in
                        NavigationLink {
                            CharacterView(id: character.id)
                        } label: {
                            CharacterRowView(character: character)
                        }
                    }
                }
            }
            .animation(.default, value: dragonBallKit.characters?.items ?? [])
            .refreshable { fetchCharacters() }
            .onAppear { fetchCharacters() }
            .onChange(of: page) { fetchCharacters() }
            .listStyle(.plain)
            .navigationTitle("Characters")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    RefdsPagination(currentPage: $page, design: .serif, canChangeToNextPage: {
                        page < dragonBallKit.characters?.meta?.totalPages ?? 0
                    })
                }
            }
        }
    }
    
    private func fetchCharacters() {
        dragonBallKit.fetchCharacters(page: page, limit: limit)
    }
}

#Preview {
    CharactersView()
}
