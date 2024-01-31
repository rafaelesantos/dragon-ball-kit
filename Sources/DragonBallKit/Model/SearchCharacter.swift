import Foundation

public struct SearchCharacter {
    public var name: String?
    public var gender: Gender?
    public var race: Race?
    public var affiliation: Affiliation?
    
    public init(
        name: String? = nil,
        gender: Gender? = nil,
        race: Race? = nil,
        affiliation: Affiliation? = nil
    ) {
        self.name = name
        self.gender = gender
        self.race = race
        self.affiliation = affiliation
    }
}
