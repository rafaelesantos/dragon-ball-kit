import SwiftUI
import RefdsUI
import DragonBallKit

public struct PlanetRowView: View {
    private var planet: PlanetsModel.PlanetModel
    
    public init(planet: PlanetsModel.PlanetModel) {
        self.planet = planet
    }
    
    public var body: some View {
        HStack(spacing: .padding(.large)) {
            RefdsAsyncImage(url: planet.image) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipped()
                    .clipShape(.rect(cornerRadius: .cornerRadius))
            }
            
            VStack(alignment: .leading, spacing: .padding(.extraSmall)) {
                HStack(spacing: .padding(.extraSmall)) {
                    RefdsText(planet.name, weight: .bold, design: .serif, lineLimit: 1)
                    Spacer(minLength: .zero)
                }
                
                if planet.isDestroyed {
                    RefdsText("Destroyed", style: .footnote, color: .red, weight: .bold, design: .serif, lineLimit: 1)
                }
                
                RefdsText(planet.description, style: .footnote, weight: .light, design: .serif, lineLimit: 3)
            }
        }
    }
}

#Preview {
    List {
        PlanetRowView(planet: .mock)
        PlanetRowView(planet: .mock)
        PlanetRowView(planet: .mock)
    }
    .listStyle(.plain)
}
