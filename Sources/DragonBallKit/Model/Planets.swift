import Foundation

public struct Planets: Codable {
    public var items: [Planet]
    public var meta: Meta
    public var links: Links
}

public extension Planets {
    struct Planet: Codable {
        public var id: Int
        public var name: String
        public var isDestroyed: Bool
        public var description: String
        public var image: String
    }
}
