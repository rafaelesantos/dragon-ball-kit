import RefdsShared
import RefdsNetwork

class RemoteGetCharacter: RefdsHttpRequest, GetCharacterUseCase {
    typealias Response = CharacterModel
    var httpClient: RefdsHttpClient
    var httpEndpoint: RefdsHttpEndpoint?
    
    init(httpClient: RefdsHttpClient) {
        self.httpClient = httpClient
    }
    
    func getCharacter(by id: Int) async -> Result<CharacterModel, RefdsHttpError> {
        httpEndpoint = DragonBallEndpoint.character(id: id)
        return await withUnsafeContinuation { continuation in
            httpClient.request(self) {
                continuation.resume(returning: $0)
            }
        }
    }
}
