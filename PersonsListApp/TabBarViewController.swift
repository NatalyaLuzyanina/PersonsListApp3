//
//  TabBarViewController.swift
//  PersonsListApp
//
//  Created by Nataly on 14.04.2021.
//

import UIKit

class TabBarViewController: UITabBarController {

    private var personsList = getPersonsList()
    var delegate1: PassPersonsData!
    var delegate2: PassPersonsData2!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        delegate1.passData(personsList)
        delegate2.passData(personsList)
        print(personsList.count)
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        guard let tabBarController = segue.destination as? UITabBarController else{ return }
//        guard let viewControllers = tabBarController.viewControllers else{ return }
//
//        for viewController in viewControllers {
//            guard let navigationVC = viewController as? UINavigationController else{ return }
//            if let personListVC = navigationVC.topViewController as? PersonListViewController {
//                personListVC.personData = personsList
//            } else if let detailPersonListVC = navigationVC.topViewController as? DetailsPersonsListViewController {
//                detailPersonListVC.personsData = personsList
//            }
//        }
//    }
    
    
}
