import Foundation
import RefdsShared

public struct CharacterModel: RefdsModel, Equatable, Identifiable {
    public var id: Int
    public var name: String
    public var ki: String
    public var maxKi: String
    public var race: String
    public var gender: String
    public var description: String
    public var image: String
    public var affiliation: String
    public var originPlanet: PlanetsModel.PlanetModel
    public var transformations: [Transformation]
    
    public static func == (lhs: CharacterModel, rhs: CharacterModel) -> Bool {
        lhs.id == rhs.id
    }
}

public extension CharacterModel {
    struct Transformation: RefdsModel, Equatable, Identifiable {
        public var id: Int
        public var name: String
        public var image: String
        public var ki: String
        
        public static func == (lhs: Transformation, rhs: Transformation) -> Bool {
            lhs.id == rhs.id
        }
        
        public init(id: Int, name: String, image: String, ki: String) {
            self.id = id
            self.name = name
            self.image = image
            self.ki = ki
        }
    }
}
