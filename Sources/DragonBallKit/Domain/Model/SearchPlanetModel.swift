import Foundation

public struct SearchPlanetModel {
    public var page: Int?
    public var limit: Int?
    public var name: String?
    public var isDestroyed: Bool?
    
    public init(
        page: Int? = 1,
        limit: Int? = 5,
        name: String? = nil,
        isDestroyed: Bool? = nil
    ) {
        self.page = page
        self.limit = limit
        self.name = name
        self.isDestroyed = isDestroyed
    }
}
