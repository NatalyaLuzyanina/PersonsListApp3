//
//  NetworkManager.swift
//  PersonsListApp
//
//  Created by Nataly on 03.05.2021.
//

import Alamofire

enum URLExamples: String {
    case dataURL = "https://reqres.in/api/users?page=2"
}

class NetworkManager {
    static let shared = NetworkManager()
    
    func fetchPersons(url: String, completion: @escaping ([Person]) -> Void ) {
        
        AF.request(URLExamples.dataURL.rawValue)
            // проверка валидности данных
            .validate()
            .responseJSON { dataResponse in
                
                switch dataResponse.result {
                case .success(let value):
                    
                    guard let value = value as? [String : Any] else { return }
                    guard let personsData = value["data"] as? [[String : Any]] else { return }
//                    guard let persons = personsData["data"] else { return }
//
                    var persons: [Person] = []
                   for person in personsData {
                        let person = Person(id: person["id"] as? Int,
                                            email: person["email"] as? String,
                                            first_name: person["first_name"] as? String,
                                            last_name: person["last_name"] as? String,
                                            avatar: person["avatar"] as? String)
                    print(person)

                        persons.append(person)
                   }
                 
                    DispatchQueue.main.async {
                        completion(persons)

                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
    private init() {}
}



