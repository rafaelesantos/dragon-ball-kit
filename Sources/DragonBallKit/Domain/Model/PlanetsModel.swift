import Foundation
import RefdsShared

public struct PlanetsModel: RefdsModel {
    public var items: [PlanetsModel.PlanetModel]
    public var meta: MetaModel?
    public var links: LinksModel?
}

public extension PlanetsModel {
    struct PlanetModel: RefdsModel, Equatable, Identifiable {
        public var id: Int
        public var name: String
        public var isDestroyed: Bool
        public var description: String
        public var image: String
    }
}

public extension PlanetsModel.PlanetModel {
    static var mock: PlanetsModel.PlanetModel {
        PlanetsModel.PlanetModel(
            id: 3,
            name: "Vegeta",
            isDestroyed: true,
            description: "El planeta Vegeta, conocido como planeta Plant antes del fin de la Guerra Saiyan-tsufruiana en el año 730, es un planeta rocoso ficticio de la serie de manga y anime Dragon Ball y localizado en la Vía Láctea de las Galaxias del Norte del Universo 7 hasta su destrucción a manos de Freezer en los años 737-739. Planeta natal de los Saiyans, destruido por Freezer. Anteriormente conocido como Planeta Plant.",
            image: "https://res.cloudinary.com/dgtgbyo76/image/upload/v1699145235/tuxongfmdhde18bhkvo3.webp"
        )
    }
}
