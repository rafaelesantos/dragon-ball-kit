import SwiftUI
import RefdsShared
import RefdsNetwork
import RefdsInjection

public final class DragonBallKit: ObservableObject {
    public static let shared = DragonBallKit()
    
    @Published public var error: DragonBallKitError?
    @Published public var characters: CharactersModel?
    @Published public var character: CharacterModel?
    @Published public var planets: PlanetsModel?
    @Published public var planet: PlanetModel?
    
    private init() {
        InfraFactory.registerDependencies()
        RemoteFactory.registerDependencies()
    }
    
    public func fetchCharacters(
        page: Int? = 1,
        limit: Int? = 5,
        name: String? = nil,
        gender: GenderModel? = nil,
        race: RaceModel? = nil,
        affiliation: AffiliationModel? = nil
    ) {
        let remote = RefdsContainer.resolve(type: GetCharactersUseCase.self)
        Task { @MainActor in
            let result = await remote.getCharacters(
                page: page,
                limit: limit,
                name: name,
                gender: gender,
                race: race,
                affiliation: affiliation
            )
            switch result {
            case .success(let model): characters = model
            case .failure(let error): self.error = DragonBallKitError(httpError: error)
            }
        }
    }
    
    public func fetchCharacter(by id: Int) {
        let remote = RefdsContainer.resolve(type: GetCharacterUseCase.self)
        Task { @MainActor in
            let result = await remote.getCharacter(by: id)
            switch result {
            case .success(let model): character = model
            case .failure(let error): self.error = DragonBallKitError(httpError: error)
            }
        }
    }
    
    public func fetchPlanets(
        page: Int? = 1,
        limit: Int? = 5,
        name: String? = nil,
        isDestroyed: Bool? = nil
    ) {
        let remote = RefdsContainer.resolve(type: GetPlanetsUseCase.self)
        Task { @MainActor in
            let result = await remote.getPlanets(
                page: page,
                limit: limit,
                name: name,
                isDestroyed: isDestroyed
            )
            switch result {
            case .success(let model): planets = model
            case .failure(let error): self.error = DragonBallKitError(httpError: error)
            }
        }
    }
    
    public func fetchPlanet(by id: Int) {
        let remote = RefdsContainer.resolve(type: GetPlanetUseCase.self)
        Task { @MainActor in
            let result = await remote.getPlanet(by: id)
            switch result {
            case .success(let model): planet = model
            case .failure(let error): self.error = DragonBallKitError(httpError: error)
            }
        }
    }
}
