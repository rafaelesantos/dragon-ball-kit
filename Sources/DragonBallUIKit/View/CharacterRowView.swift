import SwiftUI
import RefdsUI
import DragonBallKit

public struct CharacterRowView: View {
    private var character: CharactersModel.CharacterModel
    
    public init(character: CharactersModel.CharacterModel) {
        self.character = character
    }
    
    public var body: some View {
        HStack(spacing: .padding(.large)) {
            RefdsAsyncImage(url: character.image) { image in
                image
                    .resizable()
                    .scaledToFit()
            }
            .frame(width: 100, height: 120)
            
            VStack(alignment: .leading, spacing: .padding(.extraSmall)) {
                HStack(spacing: .padding(.extraSmall)) {
                    RefdsText(character.name, weight: .bold, design: .serif, lineLimit: 1)
                    Spacer(minLength: .zero)
                    RefdsText(character.maxKi, style: .footnote, color: .secondary, weight: .bold, design: .serif, lineLimit: 1)
                }
                RefdsText(character.gender.uppercased() + " | " + character.affiliation.uppercased(), style: .caption2, color: .secondary, design: .serif, lineLimit: 1)
                
                RefdsText(character.description, style: .footnote, weight: .light, design: .serif, lineLimit: 3)
            }
        }
    }
}

#Preview {
    List {
        CharacterRowView(character: .mock)
        CharacterRowView(character: .mock)
        CharacterRowView(character: .mock)
        CharacterRowView(character: .mock)
    }
    .listStyle(.plain)
}
