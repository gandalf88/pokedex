//
//  PokemonCardPresenter.swift
//  pokemon
//
//  Created by Luis Villamizar on 18/9/23.
//

import SwiftUI


import Foundation

class PokemonCardPresenter: ObservableObject {
    @Published var pokemonDetails: PokemonDetails?
    @Published var isLoading: Bool = true
    @Published var Message: String = ""
    
    private let httpClient = HTTPClient() // Tu cliente HTTP
    
    func fetchPokemonDetails(name: String) {
        isLoading = true
        
        httpClient.getPokemonByName(name: name) { [weak self] result in
            print(result)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1 ) {
                switch result {
                case .success(let pokemonDetail):
                    self?.pokemonDetails = pokemonDetail
                    self?.isLoading = false
                case .failure(let error):
                    print("Error fetching Pokemon details: \(error)")
                    self?.isLoading = false
                    self?.Message = "Tu solicitud no pudo ser procesada, intenta más tarde."
                }

            }
            
            
        }
    }
    
}

