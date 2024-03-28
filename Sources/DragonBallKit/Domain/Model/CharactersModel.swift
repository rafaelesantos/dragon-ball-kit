import Foundation
import RefdsShared

public struct CharactersModel: RefdsModel {
    public var items: [CharacterModel]
    public var meta: MetaModel?
    public var links: LinksModel?
}

public extension CharactersModel {
    struct CharacterModel: RefdsModel, Identifiable, Equatable {
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

public extension CharactersModel.CharacterModel {
    static var mock: CharactersModel.CharacterModel {
        CharactersModel.CharacterModel(
            id: 1,
            name: "Goku",
            ki: "60.000.000",
            maxKi: "90 Septillion",
            race: "Saiyan",
            gender: "Male",
            description: "El protagonista de la serie, conocido por su gran poder y personalidad amigable. Originalmente enviado a la Tierra como un infante volador con la misión de conquistarla. Sin embargo, el caer por un barranco le proporcionó un brutal golpe que si bien casi lo mata, este alteró su memoria y anuló todos los instintos violentos de su especie, lo que lo hizo crecer con un corazón puro y bondadoso, pero conservando todos los poderes de su raza. No obstante, en la nueva continuidad de Dragon Ball se establece que él fue enviado por sus padres a la Tierra con el objetivo de sobrevivir a toda costa a la destrucción de su planeta por parte de Freeza. Más tarde, Kakarot, ahora conocido como Son Goku, se convertiría en el príncipe consorte del monte Fry-pan y líder de los Guerreros Z, así como el mayor defensor de la Tierra y del Universo 7, logrando mantenerlos a salvo de la destrucción en innumerables ocasiones, a pesar de no considerarse a sí mismo como un héroe o salvador.",
            image: "https://res.cloudinary.com/dgtgbyo76/image/upload/v1699044374/hlpy6q013uw3itl5jzic.webp",
            affiliation: "Z Fighter"
        )
    }
}
