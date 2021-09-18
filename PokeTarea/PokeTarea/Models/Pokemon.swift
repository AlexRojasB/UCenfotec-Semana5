//
//  Pokemon.swift
//  PokeTarea
//
//  Created by Alexander Rojas Benavides on 9/17/21.
//

import Foundation
struct Pokemon: Codable {
    var name: String
    var id: Int
    var weight: Int
    var height: Int
    var moves: [Move] = []
    var sprites: Sprite = Sprite(back_default: "", front_default: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png")
    var stats: [Stat] = []
    var types: [Types] = []
}
