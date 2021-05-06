//
//  PersonDetailsViewController.swift
//  PersonsListApp
//
//  Created by Nataly on 13.04.2021.
//

import UIKit

class PersonDetailsViewController: UIViewController {

    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailLabel.text = "Email: \(person.email ?? "")"
        title = "\(person.first_name ?? "") \(person.last_name ?? "")"
        
        if let data = try? Data(contentsOf: URL(string: person.avatar!)!) {
        imageView.image = UIImage(data: data)
        }
        
        
    }
    override func viewWillLayoutSubviews() {
        
        imageView.layer.cornerRadius = imageView.frame.height / 2
    }
    
}
