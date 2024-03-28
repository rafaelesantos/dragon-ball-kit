import Foundation
import RefdsShared

public struct PlanetModel: RefdsModel, Equatable, Identifiable {
    public var id: Int
    public var name: String
    public var isDestroyed: Bool
    public var description: String
    public var image: String
    public var characters: [CharactersModel.CharacterModel]
}
