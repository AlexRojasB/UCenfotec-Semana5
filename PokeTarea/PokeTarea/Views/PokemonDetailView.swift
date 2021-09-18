//
//  PokemonDetailView.swift
//  PokeTarea
//
//  Created by Alexander Rojas Benavides on 9/17/21.
//

import SwiftUI

struct PokemonDetailView: View {
    @EnvironmentObject var model: PokemonDetailViewModel
    var pokemonName: String
    
    var body: some View {
        
        VStack {
            RemoteImageView(
                url: URL(string: model.pokemon.sprites.front_default)!,
                placeholder: {
                  Image("placeholder").frame(width: 80) // etc.
                },
                image: {
                  $0.scaledToFit().clipShape(Circle()) // etc.
                }
              )
            VStack(alignment: .leading) {
                HStack {
                    Text(model.pokemon.name)
                    Text("#\(model.pokemon.id)")
                }
                Text("Peso: \(model.pokemon.weight * 10)gr")
                Text("Altura: \(model.pokemon.height * 10)cm")
            }
        }
        .onAppear {
            model.getPokemonDetail(pokemonName)
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemonName: "Pikachu")
            .environmentObject(PokemonDetailViewModel())
    }
}
