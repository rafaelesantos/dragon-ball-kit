import Foundation

public struct Planet: Codable {
    public var id: Int
    public var name: String
    public var isDestroyed: Bool
    public var description: String
    public var image: String
    public var characters: [Characters.Character]
}
