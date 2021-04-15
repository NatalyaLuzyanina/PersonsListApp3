//
//  ViewController.swift
//  PersonsListApp
//
//  Created by Nataly on 13.04.2021.
//

import UIKit

class PersonListViewController: UITableViewController {

    var personData: [Person]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabbar = tabBarController as! TabBarViewController
       personData = tabbar.personsList
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let persondetailsVC = segue.destination as? PersonDetailsViewController else {return }
        // присваиваем в indexPath индекс строки по которой тапнул пользователь
        guard let indexPath = tableView.indexPathForSelectedRow else {return }
        // присваиваем в person элемент масссива по индексу строки по которой тапнул пользователь
        let person = personData[indexPath.row]
        persondetailsVC.person = person
    }
    
    // определяет колич-во строк в секции
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        personData.count
    }
    
    //метод позволяет работать с содержимым ячейки
    // регламентирует работу с отображением содержимого ячейки
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "person", for: indexPath)
        let person = personData[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = "\(person.name) \(person.surname)"
        
        cell.contentConfiguration = content
        
        return cell
    }
}


