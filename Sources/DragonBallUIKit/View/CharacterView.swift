import SwiftUI
import RefdsUI
import RefdsShared
import DragonBallKit

public struct CharacterView: View {
    @StateObject private var dragonBallKit = DragonBallKit.shared
    @State private var selectionTransformation: Int = 0
    @State private var transformations: [CharacterModel.Transformation] = []
    
    private let id: Int
    
    public init(id: Int) {
        self.id = id
    }
    
    public var body: some View {
        ScrollView {
            if let character = dragonBallKit.character {
                characterView(for: character)
                    .padding(.horizontal, .padding(.extraLarge))
            }
        }
        .refdsLoading(dragonBallKit.character == nil)
        .scrollIndicators(.never)
        .navigationBarTitleDisplayMode(.inline)
        .animation(.default, value: dragonBallKit.character)
        .onAppear { dragonBallKit.fetchCharacter(by: id) }
        .refreshable { dragonBallKit.fetchCharacter(by: id) }
        .onChange(of: dragonBallKit.character) {
            guard let character = dragonBallKit.character else { return }
            transformations = [.init(
                id: character.id,
                name: character.name,
                image: character.image,
                ki: character.ki
            )]
            transformations += character.transformations
        }
    }
    
    private func characterView(for character: CharacterModel) -> some View {
        VStack(spacing: .padding(.medium)) {
            ZStack {
                TabView(selection: $selectionTransformation) {
                    ForEach(transformations.indices, id: \.self) { index in
                        let transformation = transformations[index]
                        RefdsAsyncImage(url: transformation.image) { image in
                            ZStack {
                                RefdsStarShower(from: .bottom, galaxyHeight: 200, backgroundColor: .accentColor)
                                    .frame(width: 150)
                                    .clipShape(.rect(cornerRadius: .cornerRadius))
                                    .refdsParallax(magnitude: index % 2 == 0 ? 10 : -10)
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 250)
                            }
                        }
                        .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(height: 300)
                .padding(.horizontal, -.padding(.extraLarge))
                
                HStack {
                    leftButton
                    Spacer(minLength: .zero)
                    rightButton
                }
            }
            
            let transformation = transformations[safe: selectionTransformation] ?? .init(
                id: character.id,
                name: character.name,
                image: character.image,
                ki: character.ki
            )
            
            HStack() {
                VStack(alignment: .leading, spacing: .padding(.extraSmall)) {
                    RefdsText(transformation.name, style: .title, weight: .bold, design: .serif)
                        .animation(.bouncy, value: transformation.name)
                    
                    HStack {
                        RefdsText(character.gender.uppercased(), style: .caption2, color: .secondary, design: .serif)
                        Divider().frame(maxHeight: 10)
                        RefdsText(character.affiliation.uppercased(), style: .caption2, color: .secondary, design: .serif)
                    }
                }
                
                Spacer(minLength: .zero)
                RefdsTag(character.race.uppercased(), style: .caption2, color: .accentColor, design: .serif)
            }
            
            VStack(alignment: .leading, spacing: .padding(.small)) {
                Divider()
                
                VStack (spacing: .padding(.extraSmall)) {
                    HStack(spacing: .padding(.medium)) {
                        RefdsText("Ki", design: .serif)
                        Spacer(minLength: .zero)
                        RefdsText(transformation.ki, weight: .bold, design: .serif)
                            .contentTransition(.numericText())
                            .animation(.default, value: transformation.ki)
                    }
                    
                    HStack(spacing: .padding(.medium)) {
                        RefdsText("Max Ki", design: .serif)
                        Spacer(minLength: .zero)
                        RefdsText(character.maxKi, color: .secondary, weight: .bold, design: .serif)
                    }
                }
                
                Divider()
            }

            HStack(spacing: .zero) {
                VStack(alignment: .leading, spacing: .padding(.small)) {
                    RefdsText("Description", style: .title2, weight: .bold, design: .serif)
                    RefdsText(character.description, style: .footnote, design: .serif)
                }
                Spacer(minLength: .zero)
            }
            
            Divider()
            
            HStack {
                VStack(alignment: .leading, spacing: .padding(.small)) {
                    VStack(alignment: .leading, spacing: .zero) {
                        HStack {
                            RefdsText("Origin Planet".uppercased(), style: .caption2, color: .secondary, weight: .bold, design: .serif)
                            Spacer(minLength: .zero)
                            if character.originPlanet.isDestroyed {
                                RefdsText("Destroyed".uppercased(), style: .caption2, color: .red, weight: .bold, design: .serif)
                            }
                        }
                        RefdsText(character.originPlanet.name, style: .title2, weight: .bold, design: .serif)
                    }
                    RefdsText(character.originPlanet.description, style: .footnote, design: .serif)
                }
                Spacer(minLength: .zero)
            }
            
            if !character.transformations.isEmpty {
                Divider()
                
                VStack(alignment: .leading, spacing: .padding(.extraSmall)) {
                    HStack {
                        RefdsText("Transformations", style: .title2, weight: .bold, design: .serif)
                        Spacer(minLength: .zero)
                        RefdsTag(character.transformations.count.asString, style: .caption2)
                    }
                    transformationsView(for: character.transformations)
                }
            }
        }
    }
    
    private func transformationsView(for transformations: [CharacterModel.Transformation]) -> some View {
        ScrollView(.horizontal) {
            HStack(spacing: .padding(.medium)) {
                ForEach(transformations.reversed()) {
                    transformationView(for: $0)
                }
            }
            .padding(.horizontal, .padding(.extraLarge))
            .padding(.vertical, .padding(.large))
        }
        .scrollIndicators(.never)
        .padding(.horizontal, -.padding(.extraLarge))
    }
    
    private func transformationView(for transformation: CharacterModel.Transformation) -> some View {
        VStack(spacing: .padding(.small)) {
            RefdsAsyncImage(url: transformation.image) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
            }
            
            HStack(spacing: .zero) {
                VStack(alignment: .leading, spacing: .padding(.extraSmall)) {
                    RefdsText(transformation.name, style: .caption, weight: .bold, design: .serif, lineLimit: 1)
                    RefdsText(transformation.ki, style: .footnote, color: .secondary, design: .serif, lineLimit: 1)
                }
                Spacer(minLength: .zero)
            }
        }
        .frame(width: 120)
        .refdsCard()
    }
    
    private var canNextTransformation: Bool {
        selectionTransformation + 1 < transformations.count
    }
    
    private var canPreviousTransformation: Bool {
        selectionTransformation + 1 > 1
    }
    
    private var leftButton: some View {
        RefdsButton {
            if canPreviousTransformation { 
                withAnimation {
                    selectionTransformation -= 1
                }
            }
        } label: {
            RefdsIcon(
                .chevronLeft,
                color: !canPreviousTransformation ? .placeholder : .accentColor,
                style: .caption2,
                weight: .bold,
                renderingMode: .hierarchical
            )
            .frame(
                width: .padding(.large),
                height: .padding(.large)
            )
            .background((!canPreviousTransformation ? RefdsColor.placeholder : .accentColor).opacity(0.2))
            .clipShape(.circle)
        }
        .disabled(!canPreviousTransformation)
    }
    
    private var rightButton: some View {
        RefdsButton {
            if canNextTransformation { 
                withAnimation {
                    selectionTransformation += 1
                }
            }
        } label: {
            RefdsIcon(
                .chevronRight,
                color: !canNextTransformation ? .placeholder : .accentColor,
                style: .caption2,
                weight: .bold,
                renderingMode: .hierarchical
            )
            .frame(
                width: .padding(.large),
                height: .padding(.large)
            )
            .background((!canNextTransformation ? RefdsColor.placeholder : .accentColor).opacity(0.2))
            .clipShape(.circle)
        }
        .disabled(!canNextTransformation)
    }
}

#Preview {
    CharacterView(id: 2)
}
