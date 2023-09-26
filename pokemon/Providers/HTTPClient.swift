//
//  HTTPClient.swift
//  MoviesApp
//
//  Created by Mohammad Azam on 7/29/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    
    case badURL
    case noData
    case decodingError
    case timeoutError
    
}

struct Information: Decodable {
  let name: String
}

class HTTPClient {
    
    func getPaginatePokemons(limit: String, offset: String,
                             completion: @escaping (Result<AllPokemons, NetworkError>) -> Void) {

        guard let url = URL.getPokemonsPaginate(limit, offset) else {
            return completion(.failure(.badURL))
        }

        let timeoutInterval: TimeInterval = 30

        var request = URLRequest(url: url)
        request.timeoutInterval = timeoutInterval

        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.timeoutIntervalForRequest = timeoutInterval

        let session = URLSession(configuration: sessionConfiguration)

        let task = session.dataTask(with: request) { data, response, error in
            if let error = error as NSError?, error.code == NSURLErrorTimedOut {
                // El tiempo de espera ha expirado
                completion(.failure(.timeoutError))
                return
            }

            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }

            guard let Pokemons = try? JSONDecoder().decode(AllPokemons.self, from: data) else {
                return completion(.failure(.decodingError))
            }

            completion(.success(Pokemons))
        }

        task.resume()

        // Puedes cancelar la solicitud si excede el tiempo de espera deseado
        DispatchQueue.global().asyncAfter(deadline: .now() + timeoutInterval) {
            if task.state == .running {
                task.cancel()
                completion(.failure(.timeoutError))
            }
        }
    }
    func getAllPokemons(limit: String, completion: @escaping (Result<AllPokemons, NetworkError>) -> Void) {
        
        guard let url = URL.getPokemons(limit) else {
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
         
            guard let Pokemons = try? JSONDecoder().decode(AllPokemons.self, from: data) else {
                return completion(.failure(.decodingError))
            }
            
            completion(.success(Pokemons))
            
        }.resume()
        
    }
    
    func getPokemonByName(name: String, completion: @escaping (Result<PokemonDetails, NetworkError>) -> Void) {
        
        guard let url = URL.getPokemonsByName(name) else {
            return completion(.failure(.badURL))
        }
        
        let timeoutInterval: TimeInterval = 30

        var request = URLRequest(url: url)
        request.timeoutInterval = timeoutInterval

        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.timeoutIntervalForRequest = timeoutInterval // Establece el tiempo de espera para la conexión

        let session = URLSession(configuration: sessionConfiguration)

        session.dataTask(with: request) { data, response, error in

            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }

            guard let pokemonDetail = try? JSONDecoder().decode(PokemonDetails.self, from: data) else {
                return completion(.failure(.decodingError))
            }
            
            completion(.success(pokemonDetail))
        }.resume()
        
    }
    
}
