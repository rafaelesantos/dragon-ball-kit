import Foundation

public struct SearchCharacterModel {
    public var page: Int?
    public var limit: Int?
    public var name: String?
    public var gender: GenderModel?
    public var race: RaceModel?
    public var affiliation: AffiliationModel?
    
    public init(
        page: Int? = 1,
        limit: Int? = 5,
        name: String? = nil,
        gender: GenderModel? = nil,
        race: RaceModel? = nil,
        affiliation: AffiliationModel? = nil
    ) {
        self.page = page
        self.limit = limit
        self.name = name
        self.gender = gender
        self.race = race
        self.affiliation = affiliation
    }
}
