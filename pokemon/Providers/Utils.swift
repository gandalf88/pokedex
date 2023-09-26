//
//  Utils.swift
//  pokemon
//
//  Created by Luis Villamizar on 19/9/23.
//

import Foundation
import SwiftUI

class Utils {
    
    static func appendNumericValueToURL(_ originalURL: String, additionalURL: String) -> String? {
        
        let components = originalURL.split(separator: "/")
        if let lastComponent = components.last {
            if let numericValue = Int(lastComponent) {
                let finalURL = additionalURL + "\(numericValue).png"
                return finalURL
            }
        }
        
        return nil
    }
    static func capitalizeFirstLetter(_ input: String) -> String {
        guard !input.isEmpty else { return input } 
        
        let firstChar = input.prefix(1).capitalized
        let restOfString = input.dropFirst()
        
        return firstChar + restOfString
    }
   

    static func getColorForType(typeName: String) -> Color {
        
        if typeName == "normal" {
                return Color(red: 79.1/255, green: 59.6/255, blue: 65.6/255)
            } else if typeName == "fighting" {
                return Color(red: 92.8/255, green: 39.0/255, blue: 21.4/255)
            } else if typeName == "flying" {
                return Color(red: 57.6/255, green: 69.8/255, blue: 78.1/255)
            } else if typeName == "poison" {
                return Color(red: 37.0/255, green: 17.8/255, blue: 53.2/255)
            } else if typeName == "ground" {
                return Color(red: 66.4/255, green: 43.7/255, blue: 16.5/255)
            } else if typeName == "rock" {
                return Color(red: 28.5/255, green: 10.7/255, blue: 5.1/255)
            } else if typeName == "bug" {
                return Color(red: 11.1/255, green: 29.4/255, blue: 15.0/255)
            } else if typeName == "ghost" {
                return Color(red: 20.6/255, green: 19.6/255, blue: 41.8/255)
            } else if typeName == "steel" {
                return Color(red: 28.2/255, green: 74.3/255, blue: 58.7/255)
            } else if typeName == "fire" {
                return Color(red: 99.4/255, green: 29.7/255, blue: 35.2/255)
            } else if typeName == "water" {
                return Color(red: 7.9/255, green: 32.6/255, blue: 89.6/255)
            } else if typeName == "grass" {
                return Color(red: 15.0/255, green: 79.6/255, blue: 30.4/255)
            } else if typeName == "electric" {
                return Color(red: 98.4/255, green: 98.4/255, blue: 44.5/255)
            } else if typeName == "psychic" {
                return Color(red: 97.3/255, green: 10.9/255, blue: 56.8/255)
            } else if typeName == "ice" {
                return Color(red: 52.5/255, green: 81.9/255, blue: 96.8/255)
            } else if typeName == "dragon" {
                return Color(red: 37.4/255, green: 79.8/255, blue: 85.2/255)
            } else if typeName == "dark" {
                return Color(red: 35.4/255, green: 34.9/255, blue: 47.6/255)
            } else if typeName == "fairy" {
                return Color(red: 91.8/255, green: 7.0/255, blue: 41.3/255)
            } else if typeName == "unknown" {
                return Color(red: 100.0/255, green: 100.0/255, blue: 100.0/255)
            } else if typeName == "shadow" {
                return Color(red: 35.4/255, green: 34.9/255, blue: 47.6/255)
          } else {
              return Color.gray // Color por defecto en caso de que no se encuentre un tipo válido
          }

    }

    static func translateType(_ typeName: String) -> String {
        switch typeName {
        case "normal":  return "normal"
        case "fighting": return "lucha"
        case "flying":  return "volador"
        case "poison": return "veneno"
        case "ground":return "tierra"
        case "rock": return "roca"
        case "bug": return "bicho"
        case "ghost": return "fantasma"
        case "steel":return "acero"
        case "fire":return "fuego"
        case "water":return "agua"
        case "grass": return "planta"
        case "electric": return "eléctrico"
        case "psychic": return "psíquico"
        case "ice":return "hielo"
        case "dragon": return "dragón"
        case "dark": return "siniestro"
        case "fairy":return "hada"
        case "unknown":return "desconocido"
        case "shadow":return "sombra"
        default:return typeName
        }
    }
    static func iconType(_ typeName: String) -> String {
        switch typeName {
        case "normal":  return "circle"
        case "fighting": return "figure.boxing"
        case "flying":  return "airplane"
        case "poison": return "exclamationmark.shield.fill"
        case "ground":return "mountain.2.fill"
        case "rock": return "octagon.fill"
        case "bug": return "ant.fill"
        case "ghost": return "fantasma"
        case "steel":return "rhombus.fill"
        case "fire":return "flame"
        case "water":return "water.waves"
        case "grass": return "leaf.fill"
        case "electric": return "bolt.fill"
        case "psychic": return "eye"
        case "ice":return "snowflake"
        case "dragon": return "lizard.fill"
        case "dark": return "cloud.moon.rain.fill"
        case "fairy":return "wand.and.stars"
        case "unknown":return "timelapse"
        case "shadow":return "sombra"
        default:return  "questionmark.circle.fill"
        }
    }
    
}
