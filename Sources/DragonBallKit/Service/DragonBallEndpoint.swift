import Foundation

enum DragonBallEndpoint {
    case characters
    case character(id: Int)
    case searchCharacter(SearchCharacter)
    case planets
    case planet(id: Int)
    case searchPlanet(SearchPlanet)
    
    var url: URL? { URL(string: base + path) }
    
    private var base: String { "https://dragonball-api.com/api/" }
    
    private var path: String {
        switch self {
        case .characters: return "characters"
        case .character(let id): return "characters/\(id)"
        case .searchCharacter(let searchCharacter):
            var components: [String] = []
            if let name = searchCharacter.name { components += ["name=\(name)"] }
            if let gender = searchCharacter.gender { components += ["gender=\(gender.rawValue)"] }
            if let race = searchCharacter.race { components += ["race=\(race.rawValue)"] }
            if let affiliation = searchCharacter.affiliation { components += ["affiliation=\(affiliation.rawValue)"] }
            return "characters?" + components.joined(separator: "&")
        case .planets: return "planets"
        case .planet(let id): return "planets/\(id)"
        case .searchPlanet(let searchPlanet):
            var components: [String] = []
            if let name = searchPlanet.name { components += ["name=\(name)"] }
            if let isDestroyed = searchPlanet.isDestroyed { components += ["isDestroyed=\(isDestroyed)"] }
            return "planets?" + components.joined(separator: "&")
        }
    }
}
