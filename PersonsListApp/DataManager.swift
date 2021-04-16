//
//  DataManager.swift
//  PersonsListApp
//
//  Created by Nataly on 13.04.2021.
//

class DataManager {
    
    // класс является синглтоном - имеет один экземпляр
    // чтобы сделать синглтон, нужно создать экземпляр класса, а инициализатор сделать приватным
    
    // создаем экземпляр класса ()
    static let shared = DataManager()
    
    let names = [
        "Oliver", "Jack", "Harry", "Jacob",
        "Charley", "Thomas", "George", "Oscar"
    ]
    let surnames = [
        "Smith", "Johnson", "Williams", "Jones",
        "Brown", "Davis", "Miller", "Wilson"
    ]
    
    let emails = [
        "aaa@mail.com", "bbb@mail.com", "ccc@mail.com", "ddd@mail.com",
        "eee@mail.com", "fff@mail.com", "ggg@mail.com", "hhh@mail.com"
    ]
    
    let phoneNumbers = [
        "135678956", "246952857", "356863937", "467457495",
        "545357432", "678456359", "745987356", "845693576"
    ]
    
    // инициализатор делаем приватным
    private init() {}
}
