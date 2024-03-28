import RefdsShared
import RefdsNetwork

protocol GetCharacterUseCase {
    func getCharacter(by id: Int) async -> Result<CharacterModel, RefdsHttpError>
}
