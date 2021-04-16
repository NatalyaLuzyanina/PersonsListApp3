//
//  DetailsPersonsListViewController.swift
//  PersonsListApp
//
//  Created by Nataly on 14.04.2021.
//

import UIKit

class SectionViewController: UITableViewController {

    var personList: [Person]!


    // MARK: - Table view data source
   
    //заголовок для секции
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let person = personList[section]
        return "\(person.name) \(person.surname)"
    }
    
    //кол-во секций
    override func numberOfSections(in tableView: UITableView) -> Int {
        return personList.count
    }
    
    //кол-во строк в секции
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    // настройка содержимого ячейки
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Возвращает повторно используемый объект ячейки табличного представления для указанного идентификатора
        //повторного использования и добавляет его в таблицу. идентификатор нужно указать в сториборде
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailsPerson", for: indexPath)
        
        //извлекаем элемент массива по индексу секции
        let person = personList[indexPath.section]
        // данная строка позволяет задать конфигурацию для ячейки
        var content = cell.defaultContentConfiguration()
        
        //если индекс строки 0, то в нее передается телефон, иначе имейл
        content.text = indexPath.row == 0 ? "\(person.phone)" : "\(person.email)"
        cell.contentConfiguration = content

        return cell
    }
    
    // метод снимает выделение с ячейки по которой тапнул юзер
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
   

}


