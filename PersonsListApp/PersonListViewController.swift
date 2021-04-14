//
//  ViewController.swift
//  PersonsListApp
//
//  Created by Nataly on 13.04.2021.
//

import UIKit
protocol PassPersonsData2 {
    func passData(_ persons: [Person])
}

class PersonListViewController: UITableViewController {

    var personData: [Person]!
    //var delegate1: PassPersonsData!
    
    //var delegate1: PersonListViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
   
   
    // кол-во секций (если одна он не нужен)
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        0
//    }
    
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
        //print(person.name)
        
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabbarVC = segue.destination as? TabBarViewController else { return }
        tabbarVC.delegate2 = self
        
        //guard let navigationVC = segue.destination as? UINavigationController else {return }
        guard let persondetailsVC = segue.destination as? PersonDetailsViewController else {return }
        // присваиваем в indexPath индекс строки по которой тапнул пользователь
        guard let indexPath = tableView.indexPathForSelectedRow else {return }
        // присваиваем в person элемент масссива по индексу строки по которой тапнул пользователь
        let person = personData[indexPath.row]
        persondetailsVC.person = person
    }


}
extension PersonListViewController: PassPersonsData2 {
    func passData(_ persons: [Person]) {
        personData = persons
    }
}

