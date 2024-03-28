import Foundation
import RefdsNetwork
import RefdsInjection

class RemoteFactory {
    static func registerDependencies() {
        let client = RefdsContainer.resolve(type: RefdsHttpClient.self)
        RefdsContainer.register(type: GetCharactersUseCase.self) { RemoteGetCharacters(httpClient: client) }
        RefdsContainer.register(type: GetCharacterUseCase.self) { RemoteGetCharacter(httpClient: client) }
        RefdsContainer.register(type: GetPlanetUseCase.self) { RemoteGetPlanet(httpClient: client) }
        RefdsContainer.register(type: GetPlanetsUseCase.self) { RemoteGetPlanets(httpClient: client) }
    }
}
