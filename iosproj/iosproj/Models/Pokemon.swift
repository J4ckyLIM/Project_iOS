//
//  Pokemon.swift
//  iosproj
//
//  Created by Jacky LIM on 16/12/2020.
//

import Foundation

class Pokemon {
//    var id: Int
    var name: String
//    var base_exp: Int
//    var height: Int
//    var stats: [PokemonStats]
//    var types: [PokemonType]
    
    init(/*id: Int ,*/ name: String/*, base_exp: Int?, height: Int?, stats: [PokemonStats]?, types: [PokemonType]? */) {
//        self.id = id
        self.name = name
//        self.base_exp = base_exp!
//        self.height = height!
//        self.stats = stats!
//        self.types = types!
    }
}

struct PokemonStats {
    var stat: NameAndUrl
    var effort: Int
    var base_stat: Int
}

struct PokemonType {
    var slot: Int
    var type: NameAndUrl
}

struct NameAndUrl {
    var name: String
    var url: String
}
