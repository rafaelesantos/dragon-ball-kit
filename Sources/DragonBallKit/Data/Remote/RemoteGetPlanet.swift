import RefdsShared
import RefdsNetwork

class RemoteGetPlanet: RefdsHttpRequest, GetPlanetUseCase {
    typealias Response = PlanetModel
    var httpClient: RefdsHttpClient
    var httpEndpoint: RefdsHttpEndpoint?
    
    init(httpClient: RefdsHttpClient) {
        self.httpClient = httpClient
    }
    
    func getPlanet(by id: Int) async -> Result<PlanetModel, RefdsHttpError> {
        httpEndpoint = DragonBallEndpoint.planet(id: id)
        return await withUnsafeContinuation { continuation in
            httpClient.request(self) {
                continuation.resume(returning: $0)
            }
        }
    }
}
