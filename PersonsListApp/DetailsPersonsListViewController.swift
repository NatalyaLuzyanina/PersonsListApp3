//
//  DetailsPersonsListViewController.swift
//  PersonsListApp
//
//  Created by Nataly on 14.04.2021.
//

import UIKit

//protocol PersonListViewControllerDelegate {
//    func setPersonsList(_ persons: [Person])
//}
protocol PassPersonsData {
    func passData(_ persons: [Person])
}
class DetailsPersonsListViewController: UITableViewController {

    var personsData: [Person]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return personsData.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailsPerson", for: indexPath)

        let person = personsData[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = "\(person.name) \(person.surname)"
        //print(person.name)
        
        
        cell.contentConfiguration = content

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabbarVC = segue.destination as? TabBarViewController else { return }
        tabbarVC.delegate1 = self
    }
   
}
//extension DetailsPersonsListViewController: PersonListViewControllerDelegate {
//    func setPersonsList(_ persons: [Person]) {
//        personsList = persons
//    }
//}
extension DetailsPersonsListViewController: PassPersonsData {
    func passData(_ persons: [Person]) {
        personsData = persons
    }
}

