//
//  ContentView.swift
//  lab7
//
//  Created by Alexander Rojas Benavides on 9/11/21.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    let list = ["Squirtle", "Bulbasaur", "Charmander", "Pikachu"]
    @State var pokemonName = "---"
    var body: some View {
        VStack {
            Text("Random Pokemon Generator")
            Text(pokemonName)
                .frame(width: UIScreen.main.bounds.width, height: 50)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .padding(10)
            Button(action: { self.switchPokemon()}, label: {
                Text("Run")
            })
        }//: VStack
    }
    
    func switchPokemon() {
        self.pokemonName = list.randomElement() ?? ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
