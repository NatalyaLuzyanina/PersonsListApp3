//
//  ViewController.swift
//  PersonsListApp
//
//  Created by Nataly on 13.04.2021.
//

import UIKit

class PersonListViewController: UITableViewController {

    var personList: [Person]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabbar = tabBarController as! TabBarViewController
       personList = tabbar.personsList
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let persondetailsVC = segue.destination as? PersonDetailsViewController else {return }
        guard let indexPath = tableView.indexPathForSelectedRow else {return }
        let person = personList[indexPath.row]
        persondetailsVC.person = person
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        personList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "person", for: indexPath)
        let person = personList[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = "\(person.name) \(person.surname)"
        
        cell.contentConfiguration = content
        
        return cell
    }
}


