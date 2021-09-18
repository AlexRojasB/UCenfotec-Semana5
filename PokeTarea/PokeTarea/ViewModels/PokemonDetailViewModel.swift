//
//  PokemonDetailViewModel.swift
//  PokeTarea
//
//  Created by Alexander Rojas Benavides on 9/17/21.
//

import Foundation
class PokemonDetailViewModel: ObservableObject {
    let dispatchGroup = DispatchGroup()
    @Published  var pokemon: Pokemon = Pokemon(name: "", id: 0, weight: 0, height: 0)
    
    var tempPokemon: Pokemon = Pokemon(name: "", id: 0, weight: 0, height: 0)

    func getPokemonDetail(_ pokemonName: String) {
        dispatchGroup.enter()
        getPokemonByIdOrName(pokemonName)
        dispatchGroup.notify(queue: .main) {
          self.pokemon = self.tempPokemon
        }
    }
    
    private func getPokemonByIdOrName(_ name: String)  {
        let urlString = API.getNSUrlForPokemonId(idOrName: name)
        NetworkManager<Pokemon>.fetch(for: urlString) {
                    (result) in
                    switch result {
                    case .success(let response):
                        DispatchQueue.main.async {
                            print("Updating pokemon")
                            self.tempPokemon = response
                            self.dispatchGroup.leave()
                        }
                    case .failure(let error):
                        print(error)
                    }
                }
    }
    
}
