//
//  SearchBarView.swift
//  pokemon
//
//  Created by Luis Villamizar on 22/9/23.
//

import Foundation
import SwiftUI
import Combine

struct SearchBarView: View {
    @State var inputText: String = ""
    @State var isEditing: Bool = false
    @State var isRedirecting: Bool = false
    @State private var showAlert = false
    @ObservedObject var ObjPokemonListPresenter: PokemonListPresenter
    var body: some View {
        HStack {
            TextField("", text: $inputText, onEditingChanged: { editing in
                isEditing = editing
            })
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 2)
            )
            .overlay(
                Group {
                    if !isEditing {
                        HStack {
                            Text("Nombre")
                                .foregroundColor(.gray)
                                .padding(.leading, 8)
                            Spacer()
                        }
                    }
                }
            )
            Button(action: {
                let isAlphabetic = inputText.rangeOfCharacter(from: CharacterSet.letters.inverted) == nil
                let containsWhitespace = inputText.rangeOfCharacter(from: CharacterSet.whitespaces) != nil
                
                if isAlphabetic && !containsWhitespace && !inputText.isEmpty  {
                    isRedirecting = true
                    showAlert = false
                }else {
                    isRedirecting = false
                    showAlert = true
                }
            }) {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.yellow)
                    .cornerRadius(10)
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Pokedex Warning!"),
                      message: Text("por favor escribe el nombre del pokemon"),
                      dismissButton: .default(Text("Aceptar")))
            }
            if isRedirecting {
                NavigationLink("", destination: PokemonCardView(nombre: inputText.lowercased(),ObjPokemonListPresenter:ObjPokemonListPresenter), isActive: $isRedirecting)
                    .navigationBarHidden(true)
            }
        }
    }
}
