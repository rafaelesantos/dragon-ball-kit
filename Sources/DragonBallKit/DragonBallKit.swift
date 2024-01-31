import Foundation
import SwiftUI

public final class DragonBallKit: ObservableObject {
    public static let shared = DragonBallKit()
    
    @Published public var error: DragonBallError?
    @Published public var characters: Characters?
    @Published public var charactersFiltered: [Characters.Character] = []
    @Published public var character: Character?
    @Published public var planets: Planets?
    @Published public var planetsFiltered: [Planets.Planet] = []
    @Published public var planet: Planet?
    
    
    public func fetchCharacters(for url: String? = nil) {
        guard let url = url else { 
            return DragonBallService.shared.makeRequest(
                for: .characters,
                type: Characters.self
            ) { result in
                Task { @MainActor in
                    switch result {
                    case .success(let characters): self.characters = characters; print(characters)
                    case .failure(let error): self.error = error; print(error)
                    }
                }
            }
        }
        
        DragonBallService.shared.makeRequest(
            for: url,
            type: Characters.self
        ) { result in
            Task { @MainActor in
                switch result {
                case .success(let characters): self.characters = characters; print(characters)
                case .failure(let error): self.error = error; print(error)
                }
            }
        }
    }
    
    public func fetchCharacter(for id: Int) {
        DragonBallService.shared.makeRequest(
            for: .character(id: id),
            type: Character.self
        ) { result in
            Task { @MainActor in
                switch result {
                case .success(let character): self.character = character; print(character)
                case .failure(let error): self.error = error; print(error)
                }
            }
        }
    }
    
    public func fetchSearchCharacter(for value: SearchCharacter) {
        DragonBallService.shared.makeRequest(
            for: .searchCharacter(value),
            type: [Characters.Character].self
        ) { result in
            Task { @MainActor in
                switch result {
                case .success(let charactersFiltered): self.charactersFiltered = charactersFiltered; print(charactersFiltered)
                case .failure(let error): self.error = error; print(error)
                }
            }
        }
    }
    
    public func fetchPlanets(for url: String? = nil) {
        guard let url = url else {
            return DragonBallService.shared.makeRequest(
                for: .planets,
                type: Planets.self
            ) { result in
                Task { @MainActor in
                    switch result {
                    case .success(let planets): self.planets = planets; print(planets)
                    case .failure(let error): self.error = error; print(error)
                    }
                }
            }
        }
        
        DragonBallService.shared.makeRequest(
            for: url,
            type: Planets.self
        ) { result in
            Task { @MainActor in
                switch result {
                case .success(let planets): self.planets = planets; print(planets)
                case .failure(let error): self.error = error; print(error)
                }
            }
        }
    }
    
    public func fetchPlanet(for id: Int) {
        DragonBallService.shared.makeRequest(
            for: .planet(id: id),
            type: Planet.self
        ) { result in
            Task { @MainActor in
                switch result {
                case .success(let planet): self.planet = planet; print(planet)
                case .failure(let error): self.error = error; print(error)
                }
            }
        }
    }
    
    public func fetchSearchPlanet(for value: SearchPlanet) {
        DragonBallService.shared.makeRequest(
            for: .searchPlanet(value),
            type: [Planets.Planet].self
        ) { result in
            Task { @MainActor in
                switch result {
                case .success(let planetsFiltered): self.planetsFiltered = planetsFiltered; print(planetsFiltered)
                case .failure(let error): self.error = error; print(error)
                }
            }
        }
    }
}
