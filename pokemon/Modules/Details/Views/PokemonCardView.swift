//
//  PokemonDetails.swift
//  pokemon
//
//  Created by Luis Villamizar on 18/9/23.
//

import SwiftUI

struct PokemonCardView: View {
    
     var nombre: String
    
    var imageURL = URL(string: URL.officialArtworkImge)!
    
    var id:String = "0"
    var url: String = ""
    
    @State private var downloadedImage: UIImage? = nil
    @StateObject private var viewModel = PokemonCardPresenter()
    @ObservedObject var ObjPokemonListPresenter: PokemonListPresenter

    var displayPokemonDetail : Bool = false
    @State var pokemonColor: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        ZStack{
            if viewModel.isLoading {
                
                VStack{
                    Image("InternationalPokemon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color.red))
                        .scaleEffect(4.0)
                }

            }else{
                Text("").navigationBarBackButtonHidden(true)
                        .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            print(ObjPokemonListPresenter.displayButtons)
                            presentationMode.wrappedValue.dismiss()
                            ObjPokemonListPresenter.displayButtons = true
                            print(ObjPokemonListPresenter.displayButtons)
                        } label: {
                            HStack {
                                Image(systemName: "chevron.backward")
                                Text("Volver")
                            }
                        }.navigationBarTitle("Detalles del Pokemon", displayMode: .inline)
                    }
                }
                if let pokemonType = viewModel.pokemonDetails?.types[0].type.name {
                   
                    Utils.getColorForType(typeName: pokemonType)
                    
                    ZStack{
                    VStack {
                        Spacer()
                        
                        VStack(alignment: .center) {
                            
                            if let resultURL = Utils.appendNumericValueToURL(
                                self.url, additionalURL: URL.officialArtworkImge) {
     
                                URLImage(url: resultURL)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 200, height: 200)
                            } else {
                                if let pokemonImage = viewModel.pokemonDetails?.sprites.other?.officialArtwork.frontDefault  {
                             
                                    URLImage(url: pokemonImage)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 200, height: 200)
                                } else {
                                    ProgressView()
                                    Text("Cargando imagen...")
                                }
                            }
                            
                            if let pokemonName = viewModel.pokemonDetails?.name {
                               Text(" \( Utils.capitalizeFirstLetter(pokemonName) )")
                                    .font(.custom("Pokemon", size: 20)).foregroundColor(Color.red)
                            }

                            if let id = viewModel.pokemonDetails?.id {
                                Text("Id: \(id)").font(.custom("Pokemon", size: 15))
                                    .font(.subheadline)
                                    .padding(.top, 1)
                            }
     
                        } .padding(.top, 9.0)
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        
                        HStack{
                         
                            
                            Text("Tipo de pokemon: \(Utils.translateType(pokemonType))")
                                .font(Font.custom("Pokemon", size: 15)).foregroundColor(Color.yellow).padding(.top, 1)
                            Image(systemName: Utils.iconType(pokemonType))
                                .font(.largeTitle).foregroundColor(.yellow).padding().frame(width: 35, height: 35)
                        }


                        TabView {
                            RedView(typePokemon: pokemonType) {
                         
                                    if let stats: [Stat] = viewModel.pokemonDetails?.stats {

                                        List {
                                            ForEach(stats, id: \.stat.name) { stat in
                                                HStack {
                                                    Text(Utils.capitalizeFirstLetter(stat.stat.name))
                                                        .font(.custom("Pokemon", size: 15))
                                                        .foregroundColor(Color.blue)
                                                        .frame(maxWidth: .infinity, alignment: .leading)
                                                        .padding(.leading, 16)
                                                    
                                                    Spacer()
                                                    
                                                    Text(String(stat.baseStat))
                                                        .font(.custom("Pokemon", size: 15))
                                                        .foregroundColor(Color.red)
                                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                                        .padding(.trailing, 16)
                                                }
                                                .listRowBackground(
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .fill(Color.white)
                                                        .frame(height: 50)
                                                        .shadow(radius: 5)
                                                )
                                            }
                                        }
                                        .navigationTitle("Pokedex")
                                        .listStyle(PlainListStyle())
                                        .padding(20)
                                    }
                               } .tabItem {
                                   Label("Estadistica", systemImage: "chart.bar.xaxis")
                               }
                            }
                        
                        }
                    }
                }
            }
            
           
      
        }.onAppear {
            ObjPokemonListPresenter.displayButtons = false
            if !nombre.isEmpty {
                viewModel.fetchPokemonDetails(name: nombre)
                downloadImage()
            } else {
                
            }
        }
        
    }
    
    
    private func downloadImage() {
        
           URLSession.shared.dataTask(with: imageURL) { data, _, _ in
               if let data = data, let image = UIImage(data: data) {
                   DispatchQueue.main.async {
                       self.downloadedImage = image
                   }
               }
           }.resume()
           
    }
}
/*
struct PokemonCardView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCardView(nombre: "charmander" ) // Proporciona un valor inicial para la variable nombre
    }
}
*/
struct RedView<Content: View>: View {
    var content: () -> Content
     var typePokemon: String
     
     init(typePokemon: String, @ViewBuilder content: @escaping () -> Content) {
         self.content = content
         self.typePokemon = typePokemon
     }
     
     var body: some View {
         Utils.getColorForType(typeName: typePokemon).overlay(content())
     }
}



