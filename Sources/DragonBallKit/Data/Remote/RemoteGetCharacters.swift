import Foundation
import RefdsShared
import RefdsNetwork

class RemoteGetCharacters: RefdsHttpRequest, GetCharactersUseCase {
    typealias Response = CharactersModel
    var httpClient: RefdsHttpClient
    var httpEndpoint: RefdsHttpEndpoint?
    
    init(httpClient: RefdsHttpClient) {
        self.httpClient = httpClient
    }
    
    func getCharacters(
        page: Int?,
        limit: Int?,
        name: String?,
        gender: GenderModel?,
        race: RaceModel?,
        affiliation: AffiliationModel?
    ) async -> Result<CharactersModel, RefdsHttpError> {
        let model = SearchCharacterModel(
            page: page,
            limit: limit,
            name: name,
            gender: gender,
            race: race,
            affiliation: affiliation
        )
        httpEndpoint = DragonBallEndpoint.characters(model: model)
        return await withUnsafeContinuation { continuation in
            httpClient.request(self) {
                continuation.resume(returning: $0)
            }
        }
    }
    
    func decode(_ data: Data) throws -> CharactersModel {
        guard let characters: [CharactersModel.CharacterModel] = data.asModel() else {
            guard let charactersModel: CharactersModel = data.asModel() else {
                throw RefdsError.decodedError(type: CharactersModel.self)
            }
            return charactersModel
        }
        return CharactersModel(items: characters, meta: nil, links: nil)
    }
}
