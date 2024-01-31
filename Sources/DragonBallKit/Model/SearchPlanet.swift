import Foundation

public struct SearchPlanet {
    public var name: String?
    public var isDestroyed: Bool?
    
    public init(name: String? = nil, isDestroyed: Bool? = nil) {
        self.name = name
        self.isDestroyed = isDestroyed
    }
}
