//
//  PokeTareaApp.swift
//  PokeTarea
//
//  Created by Alexander Rojas Benavides on 9/14/21.
//

import SwiftUI

@main
struct PokeTareaApp: App {
    @StateObject var pokemonModel = PokemonListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(pokemonModel)
        }
    }
}
