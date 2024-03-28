import SwiftUI
import RefdsUI
import DragonBallKit

public struct CharactersView: View {
    @StateObject private var dragonBallKit = DragonBallKit.shared
    @State private var page: Int = 1
    @State private var limit: Int = 6
    
    public init() {
        let _ = RefdsUI(accentColor: .orange)
        let largeFont = UIFont.preferredFont(forTextStyle: .largeTitle)
        let font = UIFont.preferredFont(forTextStyle: .body)
        if let largeFontDescriptor = largeFont.fontDescriptor.withDesign(.serif)?.withSymbolicTraits(.traitBold),
           let fontDescriptor = font.fontDescriptor.withDesign(.serif)?.withSymbolicTraits(.traitBold) {
            
            UINavigationBar.appearance().largeTitleTextAttributes = [.font: UIFont(descriptor: largeFontDescriptor, size: 0)]
            UINavigationBar.appearance().titleTextAttributes = [.font: UIFont(descriptor: fontDescriptor, size: 0)]
        }
    }
    
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
            .navigationTitle(Text("Characters").font(.system(.largeTitle, design: .serif, weight: .bold)))
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
