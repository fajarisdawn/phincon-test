//
//  PokemonEntity.swift
//  PhinconPokemon
//
//  Created by fajaradiwasentosa on 23/06/23.
//

import Foundation

struct PokemonEntity: Codable {
    var abilities: [Ability]
    let baseExperience: Int
    let forms: [Species]
    var gameIndices: [GameIndex]
    let height: Int
    let heldItems: [HeldItem]
    let id: Int
    let isDefault: Bool
    let locationAreaEncounters: String
    var moves: [Move]
    let name: String
    let order: Int
    let pastTypes: [PastType]
    let species: Species?
    let sprites: Sprites?
    let stats: [Stat]
    let types: [TypeElement]
    let weight: Int
    
    // Custom Entry For Local Data
    var nickname: String
    var renameCount: Int
    var nicknameSuffix: Int
    
    enum CodingKeys: String, CodingKey {
        case abilities
        case baseExperience = "base_experience"
        case forms
        case gameIndices = "game_indices"
        case height
        case heldItems = "held_items"
        case id
        case isDefault = "is_default"
        case locationAreaEncounters = "location_area_encounters"
        case moves, name, order
        case pastTypes = "past_types"
        case species, sprites, stats, types, weight, nickname, renameCount, nicknameSuffix
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.abilities = try container.decodeIfPresent([Ability].self, forKey: .abilities) ?? []
        self.baseExperience = try container.decodeIfPresent(Int.self, forKey: .baseExperience) ?? 0
        self.forms = try container.decodeIfPresent([Species].self, forKey: .forms) ?? []
        self.gameIndices = try container.decodeIfPresent([GameIndex].self, forKey: .gameIndices) ?? []
        self.height = try container.decodeIfPresent(Int.self, forKey: .height) ?? 0
        self.heldItems = try container.decodeIfPresent([HeldItem].self, forKey: .heldItems) ?? []
        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.isDefault = try container.decodeIfPresent(Bool.self, forKey: .isDefault) ?? false
        self.locationAreaEncounters = try container.decodeIfPresent(String.self, forKey: .locationAreaEncounters) ?? ""
        self.moves = try container.decodeIfPresent([Move].self, forKey: .moves) ?? []
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.order = try container.decodeIfPresent(Int.self, forKey: .order) ?? 0
        self.pastTypes = try container.decodeIfPresent([PastType].self, forKey: .pastTypes) ?? []
        self.species = try container.decodeIfPresent(Species.self, forKey: .species) ?? nil
        self.sprites = try container.decodeIfPresent(Sprites.self, forKey: .sprites) ?? nil
        self.stats = try container.decodeIfPresent([Stat].self, forKey: .stats) ?? []
        self.types = try container.decodeIfPresent([TypeElement].self, forKey: .types) ?? []
        self.weight = try container.decodeIfPresent(Int.self, forKey: .weight) ?? 0
        self.nickname = try container.decodeIfPresent(String.self, forKey: .nickname) ?? ""
        self.renameCount = try container.decodeIfPresent(Int.self, forKey: .renameCount) ?? 0
        self.nicknameSuffix = try container.decodeIfPresent(Int.self, forKey: .nicknameSuffix) ?? 0
    }
    
    
    // MARK: - Ability
    struct Ability: Codable {
        let ability: Species?
        let isHidden: Bool?
        let slot: Int?
        
        enum CodingKeys: String, CodingKey {
            case ability
            case isHidden = "is_hidden"
            case slot
        }
    }
    
    // MARK: - Species
    struct Species: Codable {
        let name: String?
        let url: String?
        
        enum CodingKeys: String, CodingKey {
            case name = "name"
            case url = "url"
        }
    }
    
    // MARK: - GameIndex
    struct GameIndex: Codable {
        let gameIndex: Int?
        let version: Species?
        
        enum CodingKeys: String, CodingKey {
            case gameIndex = "game_index"
            case version
        }
    }
    
    // MARK: - Move
    struct Move: Codable {
        let move: Species?
        let versionGroupDetails: [VersionGroupDetail]?
        
        enum CodingKeys: String, CodingKey {
            case move
            case versionGroupDetails = "version_group_details"
        }
    }
    
    // MARK: - VersionGroupDetail
    struct VersionGroupDetail: Codable {
        let levelLearnedAt: Int?
        let moveLearnMethod, versionGroup: Species?
        
        enum CodingKeys: String, CodingKey {
            case levelLearnedAt = "level_learned_at"
            case moveLearnMethod = "move_learn_method"
            case versionGroup = "version_group"
        }
    }
    
    // MARK: - GenerationV
    struct GenerationV: Codable {
        let blackWhite: Sprites?
        
        enum CodingKeys: String, CodingKey {
            case blackWhite = "black-white"
        }
    }
    
    // MARK: - GenerationIv
    struct GenerationIv: Codable {
        let diamondPearl, heartgoldSoulsilver, platinum: Sprites?
        
        enum CodingKeys: String, CodingKey {
            case diamondPearl = "diamond-pearl"
            case heartgoldSoulsilver = "heartgold-soulsilver"
            case platinum
        }
    }
    
    // MARK: - Versions
    struct Versions: Codable {
        let generationI: GenerationI?
        let generationIi: GenerationIi?
        let generationIii: GenerationIii?
        let generationIv: GenerationIv?
        let generationV: GenerationV?
        let generationVi: [String: Home]?
        let generationVii: GenerationVii?
        let generationViii: GenerationViii?
        
        enum CodingKeys: String, CodingKey {
            case generationI = "generation-i"
            case generationIi = "generation-ii"
            case generationIii = "generation-iii"
            case generationIv = "generation-iv"
            case generationV = "generation-v"
            case generationVi = "generation-vi"
            case generationVii = "generation-vii"
            case generationViii = "generation-viii"
        }
    }
    
    // MARK: - Sprites
    class Sprites: Codable {
        let backDefault, backFemale, backShiny, backShinyFemale: String?
        let frontDefault, frontFemale, frontShiny, frontShinyFemale: String?
        let other: Other?
        let versions: Versions?
        let animated: Sprites?
        
        enum CodingKeys: String, CodingKey {
            case backDefault = "back_default"
            case backFemale = "back_female"
            case backShiny = "back_shiny"
            case backShinyFemale = "back_shiny_female"
            case frontDefault = "front_default"
            case frontFemale = "front_female"
            case frontShiny = "front_shiny"
            case frontShinyFemale = "front_shiny_female"
            case other, versions, animated
        }
        
        init(backDefault: String?, backFemale: String?, backShiny: String?, backShinyFemale: String?, frontDefault: String?, frontFemale: String?, frontShiny: String?, frontShinyFemale: String?, other: Other?, versions: Versions?, animated: Sprites?) {
            self.backDefault = backDefault
            self.backFemale = backFemale
            self.backShiny = backShiny
            self.backShinyFemale = backShinyFemale
            self.frontDefault = frontDefault
            self.frontFemale = frontFemale
            self.frontShiny = frontShiny
            self.frontShinyFemale = frontShinyFemale
            self.other = other
            self.versions = versions
            self.animated = animated
        }
    }
    
    // MARK: - GenerationI
    struct GenerationI: Codable {
        let redBlue, yellow: RedBlue?
        
        enum CodingKeys: String, CodingKey {
            case redBlue = "red-blue"
            case yellow
        }
    }
    
    // MARK: - RedBlue
    struct RedBlue: Codable {
        let backDefault, backGray, backTransparent, frontDefault: String?
        let frontGray, frontTransparent: String?
        
        enum CodingKeys: String, CodingKey {
            case backDefault = "back_default"
            case backGray = "back_gray"
            case backTransparent = "back_transparent"
            case frontDefault = "front_default"
            case frontGray = "front_gray"
            case frontTransparent = "front_transparent"
        }
    }
    
    // MARK: - GenerationIi
    struct GenerationIi: Codable {
        let crystal: Crystal?
        let gold, silver: Gold?
    }
    
    // MARK: - Crystal
    struct Crystal: Codable {
        let backDefault, backShiny, backShinyTransparent, backTransparent: String?
        let frontDefault, frontShiny, frontShinyTransparent, frontTransparent: String?
        
        enum CodingKeys: String, CodingKey {
            case backDefault = "back_default"
            case backShiny = "back_shiny"
            case backShinyTransparent = "back_shiny_transparent"
            case backTransparent = "back_transparent"
            case frontDefault = "front_default"
            case frontShiny = "front_shiny"
            case frontShinyTransparent = "front_shiny_transparent"
            case frontTransparent = "front_transparent"
        }
    }
    
    // MARK: - Gold
    struct Gold: Codable {
        let backDefault, backShiny, frontDefault, frontShiny: String?
        let frontTransparent: String?
        
        enum CodingKeys: String, CodingKey {
            case backDefault = "back_default"
            case backShiny = "back_shiny"
            case frontDefault = "front_default"
            case frontShiny = "front_shiny"
            case frontTransparent = "front_transparent"
        }
    }
    
    // MARK: - GenerationIii
    struct GenerationIii: Codable {
        let emerald: OfficialArtwork?
        let fireredLeafgreen, rubySapphire: Gold?
        
        enum CodingKeys: String, CodingKey {
            case emerald
            case fireredLeafgreen = "firered-leafgreen"
            case rubySapphire = "ruby-sapphire"
        }
    }
    
    // MARK: - OfficialArtwork
    struct OfficialArtwork: Codable {
        let frontDefault, frontShiny: String?
        
        enum CodingKeys: String, CodingKey {
            case frontDefault = "front_default"
            case frontShiny = "front_shiny"
        }
    }
    
    // MARK: - Home
    struct Home: Codable {
        let frontDefault, frontFemale, frontShiny, frontShinyFemale: String?
        
        enum CodingKeys: String, CodingKey {
            case frontDefault = "front_default"
            case frontFemale = "front_female"
            case frontShiny = "front_shiny"
            case frontShinyFemale = "front_shiny_female"
        }
    }
    
    // MARK: - GenerationVii
    struct GenerationVii: Codable {
        let icons: DreamWorld?
        let ultraSunUltraMoon: Home?
        
        enum CodingKeys: String, CodingKey {
            case icons
            case ultraSunUltraMoon = "ultra-sun-ultra-moon"
        }
    }
    
    // MARK: - DreamWorld
    struct DreamWorld: Codable {
        let frontDefault: String?
        let frontFemale: String?
        
        enum CodingKeys: String, CodingKey {
            case frontDefault = "front_default"
            case frontFemale = "front_female"
        }
    }
    
    // MARK: - GenerationViii
    struct GenerationViii: Codable {
        let icons: DreamWorld?
    }
    
    // MARK: - Other
    struct Other: Codable {
        let dreamWorld: DreamWorld?
        let home: Home?
        let officialArtwork: OfficialArtwork?
        
        enum CodingKeys: String, CodingKey {
            case dreamWorld = "dream_world"
            case home
            case officialArtwork = "official-artwork"
        }
    }
    
    // MARK: - Stat
    struct Stat: Codable {
        let baseStat, effort: Int?
        let stat: Species?
        
        enum CodingKeys: String, CodingKey {
            case baseStat = "base_stat"
            case effort, stat
        }
    }
    
    // MARK: - TypeElement
    struct TypeElement: Codable {
        let slot: Int?
        let type: Species?
        
        enum CodingKeys: String, CodingKey {
            case slot
            case type = "type"
        }
    }
    
    // MARK: - HeldItem
    struct HeldItem: Codable {
        let item: Species?
        let versionDetails: [VersionDetail]?
        
        enum CodingKeys: String, CodingKey {
            case item
            case versionDetails = "version_details"
        }
    }
    
    struct VersionDetail: Codable {
        let rarity: Int?
        let version: Species?
    }
    
    // MARK: - PastType
    struct PastType: Codable {
        let generation: Species?
        let types: [Species]?
    }
    
    
    func originalImage() -> String {
        let pathUrl = String(format: "%03d", id)
        return "https://assets.pokemon.com/assets/cms2/img/pokedex/detail/\(pathUrl).png"
    }
}
