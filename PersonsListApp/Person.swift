//
//  Person.swift
//  PersonsListApp
//
//  Created by Nataly on 13.04.2021.
//

struct Person {
    let name: String
    let surname: String
    let phone: String
    let email: String
}

func getPersonsList() -> [Person] {
    let personsData = DataManager()
    var persons: [Person] = []
    
    for _ in personsData.names {
        
        guard let name = personsData.names.randomElement() else { continue }
        guard let surname = personsData.surnames.randomElement() else { continue }
        guard let phone = personsData.phoneNumbers.randomElement() else { continue }
        guard let email = personsData.emails.randomElement() else { continue }
        
        
        let person = Person(name: name, surname: surname, phone: phone, email: email)
        persons.append(person)
    }
    
    return persons
}
