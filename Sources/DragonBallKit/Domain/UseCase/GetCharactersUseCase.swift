import RefdsShared
import RefdsNetwork

protocol GetCharactersUseCase {
    func getCharacters(
        page: Int?,
        limit: Int?,
        name: String?,
        gender: GenderModel?,
        race: RaceModel?,
        affiliation: AffiliationModel?
    ) async -> Result<CharactersModel, RefdsHttpError>
}
