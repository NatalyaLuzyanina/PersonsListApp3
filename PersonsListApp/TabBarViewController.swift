//
//  TabBarViewController.swift
//  PersonsListApp
//
//  Created by Nataly on 14.04.2021.
//

import UIKit

class TabBarViewController: UITabBarController {

    var personsList: [Person]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
        }
  
    //функция создает экземпляры классов в которые мы передаем данные
    //метод prepare здесь не работает тк нет перехода по сигвею (вьюшки уже сидят внутри таб бара)
    func setupViewControllers() {
        guard let contactsVC = viewControllers?.first as? ContactsViewController else { return }
        guard let sectionsVC = viewControllers?.last as? SectionViewController else { return }
        
        NetworkManager.shared.fetchPersons(url: URLExamples.dataURL.rawValue) { (personsDesc) in
            self.personsList = personsDesc.data
            
            guard let personsList = self.personsList else { return }
            
            contactsVC.personsList = personsList
            contactsVC.tableView.reloadData()
            
            sectionsVC.personList = personsList
            sectionsVC.tableView.reloadData()
       //можно перебирать вьюконтроллеры с помощью цикла
//        viewControllers?.forEach {
//            if let contactsVC = $0 as? ContactsViewController {
//                contactsVC.personList = personsList
//            } else if let sectionVC = $0 as? SectionViewController {
//                sectionVC.personList = personsList
//            }
//        }
        
        
//        for vc in viewControllers! {
//            if let contactsVC = vc as? ContactsViewController {
//                contactsVC.personList = personsList
//            } else if let sectionsVC = vc as? SectionViewController {
//                sectionsVC.personList = personsList
//            }
//        }
        
    }
}
}
