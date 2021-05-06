//
//  ViewController.swift
//  PersonsListApp
//
//  Created by Nataly on 13.04.2021.
//

import UIKit

class ContactsViewController: UITableViewController {

    var personsList: [Person]?
 
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let indexPath = tableView.indexPathForSelectedRow else {return }
        guard let persondetailsVC = segue.destination as? PersonDetailsViewController else {return }
        persondetailsVC.person = personsList?[indexPath.row]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personsList?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "person", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let person = personsList?[indexPath.row]
    
        content.text = "\(person?.first_name ?? "") \(person?.last_name ?? "")"
        
        cell.contentConfiguration = content
        
        return cell
    }
}

