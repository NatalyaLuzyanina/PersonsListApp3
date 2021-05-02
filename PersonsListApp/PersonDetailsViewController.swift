//
//  PersonDetailsViewController.swift
//  PersonsListApp
//
//  Created by Nataly on 13.04.2021.
//

import UIKit

class PersonDetailsViewController: UIViewController {

    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //phoneLabel.text = "Phone: \(person.phone)"
        emailLabel.text = "Email: \(person.email ?? "")"
        title = "\(person.first_name ?? "") \(person.last_name ?? "")"
    }
}
