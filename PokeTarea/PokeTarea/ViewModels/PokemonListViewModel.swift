//
//  PokemonViewModel.swift
//  PokeTarea
//
//  Created by Alexander Rojas Benavides on 9/17/21.
//

import Foundation

class PokemonListViewModel: ObservableObject {
    var offset = 0
    let dispatchGroup = DispatchGroup()
    @Published var pokemonList: [PokemonWrapper] = []
    var pokemonTempList: [PokemonWrapper] = []
    
    func UpdatePokemonList() {
        dispatchGroup.enter()
        getPokemonList()
        dispatchGroup.notify(queue: .main) {
          
            self.pokemonList = self.pokemonTempList
        }
    }
    
    func getPokemonList()  {
        let urlString = API.getNSUrlForPokemonList(limit: 20, offset: offset)
        NetworkManager<PokemonResults>.fetch(for: urlString) {
                    (result) in
                    switch result {
                    case .success(let response):
                        DispatchQueue.main.async {
                            print("Updating pokemon list")
                            let res = response.results
                            for pokemon in res {
                                self.offset += 1
                                self.pokemonTempList.append(PokemonWrapper(id: self.offset, name: pokemon.name))
                            }
                            self.dispatchGroup.leave()
                        }
                    case .failure(let error):
                        print(error)
                    }
                }
    }
    
}
