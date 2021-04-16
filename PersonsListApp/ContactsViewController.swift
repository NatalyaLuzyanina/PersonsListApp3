//
//  ViewController.swift
//  PersonsListApp
//
//  Created by Nataly on 13.04.2021.
//

import UIKit

class ContactsViewController: UITableViewController {

    var personList: [Person]!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // индекс ячейки по которой тапнул пользователь
        guard let indexPath = tableView.indexPathForSelectedRow else {return }
        //создаем экземпляр класса на который хотти передать данные
        guard let persondetailsVC = segue.destination as? PersonDetailsViewController else {return }
        // передаем экземпляр модели с индексом равным индексу строки по которой тапнул пользователь
        persondetailsVC.person = personList[indexPath.row]
    }
    
    //кол-во строк в таблице
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        personList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "person", for: indexPath)
        // данная строка позволяет задать конфигурацию для ячейки
        var content = cell.defaultContentConfiguration()
        //извлекаем экземпляр модели
        let person = personList[indexPath.row]
    
        content.text = "\(person.name) \(person.surname)"
        
        cell.contentConfiguration = content
        
        return cell
    }
}


