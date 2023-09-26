//
//  PokemonList.swift
//  pokemon
//
//  Created by Luis Villamizar on 25/9/23.
//

import SwiftUI
import Foundation

struct pokemonListComponent: View {
    @State private var isLinkActive = false
    @ObservedObject var ObjPokemonListPresenter: PokemonListPresenter
    var body: some View {
        VStack{
            NavigationView {
               List {
                   Section() {
                       SearchBarView(ObjPokemonListPresenter: ObjPokemonListPresenter)
                   }
                   Section{
                       ForEach(ObjPokemonListPresenter.pokemonList) { pokemon in
                           
                           if let idPokemon = pokemon.url.last {
                               NavigationLink(destination: PokemonCardView( nombre: pokemon.name,
                                    id: String(idPokemon), url: pokemon.url, ObjPokemonListPresenter: ObjPokemonListPresenter),
                                            isActive: $isLinkActive) {
                                   HStack {
                                       
                                       if let resultURL = Utils.appendNumericValueToURL(
                                        pokemon.url, additionalURL: URL.officialArtworkImge) {
                                           
                                           URLImage(url: resultURL)
                                               .aspectRatio(contentMode: .fit)
                                               .frame(width: 50, height: 50).bold().font(.body)
                                           
                                           Text(  Utils.capitalizeFirstLetter(pokemon.name) ).bold().font(.body).padding()
                                           
                                       } else {
                                           Text( "Lo sentimos, no se pudieron cargar los datos en este momento. Por favor, verifica tu conexión a internet o inténtalo de nuevo más tarde." ).bold().font(.body).padding()
                                       }
                                   }
                               }
                                 .onTapGesture {
                                   print("onTapGesture")
                                   isLinkActive = true
                                     ObjPokemonListPresenter.displayButtons = false
                               }
                           }
                       }
                   }
               }
               .listStyle(PlainListStyle()).padding(20)
               .navigationTitle("Pokedex").background(Color.red)
                
            }
        }
    }
}
