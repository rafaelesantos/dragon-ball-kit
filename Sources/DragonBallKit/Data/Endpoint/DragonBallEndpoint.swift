import Foundation
import RefdsNetwork

public enum DragonBallEndpoint: RefdsHttpEndpoint {
    case characters(model: SearchCharacterModel)
    case character(id: Int)
    case planets(model: SearchPlanetModel)
    case planet(id: Int)
    
    public var scheme: RefdsHttpScheme { .https }
    public var host: String { "dragonball-api.com" }
    public var method: RefdsHttpMethod { .get }
    
    public var path: String {
        switch self {
        case .characters: return "/api/characters"
        case .character(let id): return "/api/characters/\(id)"
        case .planets: return "/api/planets"
        case .planet(let id): return "/api/planets/\(id)"
        }
    }
    
    public var queryItems: [URLQueryItem]? {
        switch self {
        case .characters(let model):
            return [
                .init(name: "page", value: model.page?.asString),
                .init(name: "limit", value: model.limit?.asString),
                .init(name: "name", value: model.name),
                .init(name: "gender", value: model.gender?.rawValue),
                .init(name: "race", value: model.race?.rawValue),
                .init(name: "affiliation", value: model.affiliation?.rawValue)
            ]
        case .planets(let model):
            return [
                .init(name: "page", value: model.page?.asString),
                .init(name: "limit", value: model.limit?.asString),
                .init(name: "name", value: model.name),
                .init(name: "isDestroyed", value: model.isDestroyed?.asString)
            ]
        default: return []
        }
    }
}
