//
//  Person.swift
//  PersonsListApp
//
//  Created by Nataly on 13.04.2021.
//


struct Person: Codable {
    let id: Int?
    let email: String?
    let first_name: String?
    let last_name: String?
    let avatar: String?
}

struct PersonData: Decodable {
    let data: [Person]?
    
    
}
