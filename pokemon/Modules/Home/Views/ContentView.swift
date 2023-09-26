//
//  ContentView.swift
//  pokemon
//
//  Created by Luis Villamizar on 12/9/23.
//

import SwiftUI
import Foundation

struct ContentView: View {
    
    @StateObject public var ObjPokemonListPresenter = PokemonListPresenter()
    @State private var inputText: String = ""
    @State private var isRedirecting: Bool = false
    @State private var isEditing: Bool = false
    @State private var isLinkActive = false
    var imageURL = URL.officialArtworkImge
    var body: some View {
        
        VStack {
            if ObjPokemonListPresenter.isLoading {
               
                Image("InternationalPokemon") 
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.yellow))
                    .scaleEffect(4.0)
            }else {
                ZStack{
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
                                                id: String(idPokemon), url: pokemon.url, ObjPokemonListPresenter: ObjPokemonListPresenter)) {
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
                                       }
                                   }
                               }
                           }
                           .listStyle(PlainListStyle()).padding(20)
                           .navigationTitle("Pokedex")
                            
                        }
                        
                    }
                   
                }
                Spacer()
              
                    PaginationButtonView(
                        active: ObjPokemonListPresenter.displayButtons,
                        isButtonEnabled: ObjPokemonListPresenter.isButtonEnabled,
                        onDecrementOffset: {
                            ObjPokemonListPresenter.decrementOffset()
                        },
                        onIncrementOffset: {
                            ObjPokemonListPresenter.incrementOffset()
                        },
                        pokemonOffset:ObjPokemonListPresenter.pokemonOffset
                    )
            }
            
          
            

    
        } .onAppear {
            
            ObjPokemonListPresenter.fetchPaginatePokemons(limit: "10", offset: "0")
        }
           

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct loadingView: View {
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .red))
                .scaleEffect(3)
        }
    }
}



