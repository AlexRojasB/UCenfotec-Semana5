//
//  ContentView.swift
//  PokeTarea
//
//  Created by Alexander Rojas Benavides on 9/14/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: PokemonListViewModel
    
    var body: some View {
        
        NavigationView {
            ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false, content: {
                LazyVStack {
                    ForEach(model.pokemonList, id:\.self) { pokemon in
                        NavigationLink(destination: PokemonDetailView(pokemonName: pokemon.name)
                                        .environmentObject(PokemonDetailViewModel())) {
                            
                            VStack {
                                PokemonCellView(pokemonName: pokemon.name)
                                Divider()
                                    .padding(.top, 4)
                            }
                        }//: NavigationLink
                        .onAppear {
                            if pokemon.id == (model.offset - 5) {
                                model.UpdatePokemonList()
                                print("pokemon ID: \(pokemon.id)")
                            }
                        }
                    }
                }
            })
            .onAppear {
                model.UpdatePokemonList()
        }
            .navigationTitle("Pokemon List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(PokemonListViewModel())
            .previewDevice("iPhone 12 Pro Max")
    }
}
