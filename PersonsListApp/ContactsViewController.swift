//
//  ViewController.swift
//  PersonsListApp
//
//  Created by Nataly on 13.04.2021.
//

import UIKit

enum URLExamples: String {
    case dataURL = "https://reqres.in/api/users?page=2"
}

class ContactsViewController: UITableViewController {

    var data: [Person]?
    var personsData: PersonDescription!
   // var personsList = persons
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchPersons()
        print("00")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // индекс ячейки по которой тапнул пользователь
        guard let indexPath = tableView.indexPathForSelectedRow else {return }
        //создаем экземпляр класса на который хотти передать данные
        guard let persondetailsVC = segue.destination as? PersonDetailsViewController else {return }
        // передаем экземпляр модели с индексом равным индексу строки по которой тапнул пользователь
        persondetailsVC.person = data?[indexPath.row]
    }
    
    //кол-во строк в таблице
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // persons = personsData.data
        print("10")
        return data?.count ?? 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "person", for: indexPath)
        // данная строка позволяет задать конфигурацию для ячейки
        var content = cell.defaultContentConfiguration()
        //извлекаем экземпляр модели
        let person = data?[indexPath.row]
    
        content.text = "\(person?.first_name ?? "") \(person?.last_name ?? "")"
        
        cell.contentConfiguration = content
        
        return cell
    }
}

// MARK: - Networking
extension ContactsViewController {
    func fetchPersons() {
        print("0")
        guard let url = URL(string: URLExamples.dataURL.rawValue) else { return print("12") }
        print("000")
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            print("1")
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                print("3")
                return
            }
            print(data)
            do {
                self.personsData = try JSONDecoder().decode(PersonDescription.self, from: data)
                print("4")
                DispatchQueue.main.async {
                    print("5")
                    self.data = self.personsData.data
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error.localizedDescription)
                print("6")
            }
         print("7")
           // print(self.personsData)
        }.resume()
    }
}
//private func fetchImage() {
//    guard let url = URL(string: URLExamples.imageURL.rawValue) else { return }
//
//    URLSession.shared.dataTask(with: url) { (data, response, error) in
//        guard let data = data, let response = response else {
//            print(error?.localizedDescription ?? "No error description")
//            return
//        }
//        print(response)
//        guard let image = UIImage(data: data) else { return }
//
//        DispatchQueue.main.async {
//            self.imageView.image = image
//            self.activityIndicator.stopAnimating()
//        }
//    }.resume()
//}
