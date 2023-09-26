//
//  BackButton.swift
//  pokemon
//
//  Created by Luis Villamizar on 26/9/23.
//

import Foundation
import SwiftUI

struct BackButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            HStack {
                Image(systemName: "arrow.left")
                Text("Volver")
            }
            .foregroundColor(.blue)
        }
    }
}
