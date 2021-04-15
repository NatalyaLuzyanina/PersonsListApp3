//
//  DetailsPersonsListViewController.swift
//  PersonsListApp
//
//  Created by Nataly on 14.04.2021.
//

import UIKit

class DetailsPersonsListViewController: UITableViewController {

    var personList: [Person]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabbar = tabBarController as! TabBarViewController
       personList = tabbar.personsList
    }

    // MARK: - Table view data source
   
    override func numberOfSections(in tableView: UITableView) -> Int {
        return personList.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        var rowCount = 0
//        for i in 0...personList.count - 1 {
//            if !personList[i].phone.isEmpty {
//                rowCount += 1
//            }
//            if !personList[i].email.isEmpty {
//                rowCount += 1
//            }
//        }
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailsPerson", for: indexPath)

        let person = personList[indexPath.section]
        var content = cell.defaultContentConfiguration()
        content.text = indexPath.row == 0 ? "\(person.phone)" : "\(person.email)"
        cell.contentConfiguration = content

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let person = personList[section]
        return "\(person.name) \(person.surname)"
    }

}


