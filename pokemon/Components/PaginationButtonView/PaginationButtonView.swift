//
//  PaginationButtonView.swift
//  pokemon
//
//  Created by Luis Villamizar on 25/9/23.


import SwiftUI
import Foundation

struct PaginationButtonView: View {
    var active : Bool = true
    var isButtonEnabled: Bool
    let onDecrementOffset: () -> Void
    let onIncrementOffset: () -> Void
    var pokemonOffset: Int = 0
    var body: some View {
        
        if active {
            VStack {
                HStack {
                    Spacer()
                    if isButtonEnabled {
                        if pokemonOffset >= 10 {
                            
                            Button(action: {
                                onDecrementOffset()
                            }) {
                                Image(systemName: "arrowtriangle.left.fill")
                                    .foregroundColor(.black)
                                    .font(.system(size: 30))
                            }
                            .padding(13)
                            .background(Color.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            
                        }
                        Button(action: {
                            onIncrementOffset()
                        }) {
                            Image(systemName: "arrowtriangle.right.fill")
                                .foregroundColor(.black)
                                .font(.system(size: 30))
                        }
                        .padding(13)
                        .background(Color.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                            
                      
                    }
                }
                .padding()
            }
        }
        

    }
}
