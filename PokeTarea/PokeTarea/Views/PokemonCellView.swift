//
//  PokemonCellView.swift
//  PokeTarea
//
//  Created by Alexander Rojas Benavides on 9/17/21.
//

import SwiftUI

struct PokemonCellView: View {
    var pokemonName: String
    var body: some View {
        HStack {
            Text(pokemonName)
                .font(.title)
                .bold()
        }
        .frame(width: UIScreen.main.bounds.width, height: 80, alignment: .center)
    }
}

struct PokemonCellView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCellView(pokemonName: "Pikachu")
            .previewLayout(.sizeThatFits)
    }
}
