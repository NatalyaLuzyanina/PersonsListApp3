//
//  TabBarViewController.swift
//  PersonsListApp
//
//  Created by Nataly on 14.04.2021.
//

import Alamofire

class TabBarViewController: UITabBarController {
    
    var personsList: [Person]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
    }
    
    func setupViewControllers() {
        guard let contactsVC = viewControllers?.first as? ContactsViewController else { return }
        guard let sectionsVC = viewControllers?.last as? SectionViewController else { return }
        
        NetworkManager.shared.fetchPersons(url: URLExamples.dataURL.rawValue) { (personsData) in
            self.personsList = personsData
            
            guard let personsList = self.personsList else { return }
            
            contactsVC.personsList = personsList
            contactsVC.tableView.reloadData()
            
            sectionsVC.personList = personsList
            sectionsVC.tableView.reloadData()
        }
    }
    
}


