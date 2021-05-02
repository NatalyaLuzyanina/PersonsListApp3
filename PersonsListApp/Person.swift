//
//  Person.swift
//  PersonsListApp
//
//  Created by Nataly on 13.04.2021.
//


struct Person: Decodable {
    let id: Int?
    let email: String?
    let first_name: String?
    let last_name: String?
    let avatar: String?
}

struct PersonDescription: Decodable {
    let data: [Person]?
    
    
}


    //let phone: String
    
    
    // функция которая перебирает 4 массива и создает один массив элементы которого имеют тип Person
//    static func getPersonsList() -> [Person] {
//
//        var persons: [Person] = []
//        
//        //создаем массив имен, фамилий и тд и перемешиваем при помощи shuffled()
//        let names = DataManager.shared.names.shuffled()
//        let surname = DataManager.shared.surnames.shuffled()
//        let phone = DataManager.shared.phoneNumbers.shuffled()
//        let email = DataManager.shared.emails.shuffled()
//        
//        // массивы могут иметь разное кол-во элементов, нам нужно ниаменьшее чтобы цикл не вышел за пределы диапазона
//        let indexCount = min(names.count, surname.count, phone.count, email.count)
//        
//        for index in 0..<indexCount {
//            
//            let person = Person(
//                first_name: names[index],
//                last_name: surname[index],
//                //phone: phone[index],
//                email: email[index]
//            )
//            persons.append(person)
//        }
//        return persons
//    }


