//
//  APIExtensions.swift
//  PokeTarea
//
//  Created by Alexander Rojas Benavides on 9/17/21.
//

import Foundation

extension API {
    static func getNSUrlForPokemonList(limit: Int, offset: Int) -> URLRequest {
       
        let request = NSMutableURLRequest(url: NSURL(string: "\(PokemonHost)pokemon/?limit=\(limit)&offset=\(offset)&json=true")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        return request as URLRequest
    }
    
    static func getNSUrlForPokemonId(idOrName: String) -> URLRequest {
       
        let request = NSMutableURLRequest(url: NSURL(string: "\(PokemonHost)pokemon/\(idOrName)")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        return request as URLRequest
    }
}
