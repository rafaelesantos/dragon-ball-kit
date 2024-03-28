import RefdsShared
import RefdsNetwork

protocol GetPlanetUseCase {
    func getPlanet(by id: Int) async -> Result<PlanetModel, RefdsHttpError>
}
