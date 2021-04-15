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
    
   // personsData.names.map
    
    for _ in personsData.names {
        
//        var names: [String] = []
//        var personsName = ""
//        for name in names {
//            guard let personName = personsData.names.randomElement() else { continue }
//            if name == personName { continue
//            } else {
//                names.append(name)
//                personsName = personName
//            }
//        }
        
        guard let name = personsData.names.randomElement() else { continue }
        guard let surname = personsData.surnames.randomElement() else { continue }
        guard let phone = personsData.phoneNumbers.randomElement() else { continue }
        guard let email = personsData.emails.randomElement() else { continue }
        
        
        let person = Person(name: name, surname: surname, phone: phone, email: email)
        persons.append(person)
    }
  
    return persons
}
