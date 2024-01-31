import Foundation

public struct Characters: Codable {
    public var items: [Character]
    public var meta: Meta
    public var links: Links
}

public extension Characters {
    struct Character: Codable {
        public var id: Int
        public var name: String
        public var ki: String
        public var maxKi: String
        public var race: String
        public var gender: String
        public var description: String
        public var image: String
        public var affiliation: String
    }
}
