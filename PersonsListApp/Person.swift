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
    
    // функция которая перебирает 4 массива и создает один массив элементы которого имеют тип Person
    static func getPersonsList() -> [Person] {

        var persons: [Person] = []
        
        //создаем массив имен, фамилий и тд и перемешиваем при помощи shuffled()
        let names = DataManager.shared.names.shuffled()
        let surname = DataManager.shared.surnames.shuffled()
        let phone = DataManager.shared.phoneNumbers.shuffled()
        let email = DataManager.shared.emails.shuffled()
        
        // массивы могут иметь разное кол-во элементов, нам нужно ниаменьшее чтобы цикл не вышел за пределы диапазона
        let indexCount = min(names.count, surname.count, phone.count, email.count)
        
        for index in 0..<indexCount {
            
            let person = Person(
                name: names[index],
                surname: surname[index],
                phone: phone[index],
                email: email[index]
            )
            persons.append(person)
        }
        return persons
    }
}

