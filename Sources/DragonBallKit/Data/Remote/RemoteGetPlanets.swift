import Foundation
import RefdsShared
import RefdsNetwork

class RemoteGetPlanets: RefdsHttpRequest, GetPlanetsUseCase {
    typealias Response = PlanetsModel
    var httpClient: RefdsHttpClient
    var httpEndpoint: RefdsHttpEndpoint?
    
    init(httpClient: RefdsHttpClient) {
        self.httpClient = httpClient
    }
    
    func getPlanets(
        page: Int?,
        limit: Int?,
        name: String?,
        isDestroyed: Bool?
    ) async -> Result<PlanetsModel, RefdsHttpError> {
        let model = SearchPlanetModel(
            page: page,
            limit: limit,
            name: name,
            isDestroyed: isDestroyed
        )
        httpEndpoint = DragonBallEndpoint.planets(model: model)
        return await withUnsafeContinuation { continuation in
            httpClient.request(self) {
                continuation.resume(returning: $0)
            }
        }
    }
}
