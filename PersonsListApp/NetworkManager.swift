//
//  NetworkManager.swift
//  PersonsListApp
//
//  Created by Nataly on 03.05.2021.
//

import Foundation

enum URLExamples: String {
    case dataURL = "https://reqres.in/api/users?page=2"
}

class NetworkManager {
    static let shared = NetworkManager()
    
    func fetchPersons(url: String, completion: @escaping ((PersonDescription) -> Void)) {
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let personsData = try decoder.decode(PersonDescription.self, from: data)
                DispatchQueue.main.async {
                    completion(personsData)
                    print("0")
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    private init() {}
}


