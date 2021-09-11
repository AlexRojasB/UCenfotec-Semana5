//
//  ContentView.swift
//  lab8
//
//  Created by Alexander Rojas Benavides on 9/11/21.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    @State var results = [DogFact]()
    
    var body: some View {
        List(results, id: \.fact) { item in
            VStack(alignment: .leading) {
                Text(item.fact)
            }
        }.onAppear(perform: loadData)
    }
    
    func loadData() {
        guard let url = URL(string: "https://dog-facts-api.herokuapp.com/api/v1/resources/dogs/all") else {
            print("Your API end point is Invalid")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode([DogFact].self, from: data) {
                    DispatchQueue.main.async {
                        self.results = response
                    }
                    return
                }
            }
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
