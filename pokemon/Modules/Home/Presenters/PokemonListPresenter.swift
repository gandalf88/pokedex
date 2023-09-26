//
//  PokemonListPresenter.swift
//  pokemon
//
//  Created by Luis Villamizar on 14/9/23.
//

import SwiftUI

class PokemonListPresenter: ObservableObject {
    
    @Published var pokemonList: [Pokemon] = []
    @Published  var isLoading = true
    @Published var pokemonLimit: Int = 10
    @Published var pokemonOffset: Int = 0
    @Published var isButtonEnabled = true
    @Published var displayButtons : Bool = true
    private var pokemonCount: Int = 10
    private var httpClient = HTTPClient()

    func toggleDisplayButtons() {
        print(self.displayButtons)
        self.displayButtons.toggle()
        print(self.displayButtons)
    }
    func incrementOffset() -> Void {
        print("incrementOffset")
        print(self.pokemonOffset)
        self.isLoading = true
        self.pokemonOffset += self.pokemonCount
        self.isButtonEnabled = false
        fetchPaginatePokemons(limit: "\(self.pokemonLimit)", offset: "\(self.pokemonOffset)")
    }
    
    func decrementOffset() -> Void {
        print("decrementOffset")
        print(self.pokemonOffset)
        self.isLoading = true
        self.isButtonEnabled = false
        self.pokemonOffset -= self.pokemonCount
        fetchPaginatePokemons(limit: "\(self.pokemonLimit)", offset: "\(self.pokemonOffset)")

    }
    
    func fetchPokemons(limit: String) {
        self.isLoading = true
        httpClient.getAllPokemons(limit: limit) { result in
            switch result {
            case .success(let allPokemons):
                DispatchQueue.main.asyncAfter(deadline: .now() + 1 ) {
                    self.pokemonList = allPokemons.results
                    self.isLoading = false
                    self.isButtonEnabled = true
                }
             
            case .failure(let error):
                print("Error fetching data: \(error)")
                self.isLoading = false
                self.isButtonEnabled = true
            }
        }
    }
    func fetchPaginatePokemons(limit: String, offset: String) {
        self.isLoading = true
        httpClient.getPaginatePokemons(limit: limit, offset: offset) { result in
            switch result {
            case .success(let allPokemons):
                DispatchQueue.main.asyncAfter(deadline: .now() + 1 ) {
                    self.pokemonList = allPokemons.results
                    self.isLoading = false
                    self.isButtonEnabled = true

                }
             
            case .failure(let error):
                print("Error fetching data: \(error)")
                self.isLoading = false
                self.isButtonEnabled = true
            }
        }
    }
    
    
    func appendNumericValueToURL(_ originalURL: String, additionalURL: String) -> String? {

        let components = originalURL.split(separator: "/")
        
        if let lastComponent = components.last {
            if let numericValue = Int(lastComponent) {
                let finalURL = additionalURL + "\(numericValue).png"
                return finalURL
            }
        }
        
       
        return nil
    }
}


