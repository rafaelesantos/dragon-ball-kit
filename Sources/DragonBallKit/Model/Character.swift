import Foundation

public struct Character: Codable {
    public var id: Int
    public var name: String
    public var ki: String
    public var maxKi: String
    public var race: String
    public var gender: String
    public var description: String
    public var image: String
    public var affiliation: String
    public var originPlanet: Planets.Planet
    public var transformations: [Transformation]
}

public extension Character {
    struct Transformation: Codable {
        public var id: Int
        public var name: String
        public var image: String
        public var ki: String
    }
}
