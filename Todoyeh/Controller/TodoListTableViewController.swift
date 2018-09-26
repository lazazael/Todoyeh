//
//  ViewController.swift
//  Todoyeh
//
//  Created by laza on 2018. 09. 26..
//  Copyright © 2018. laza. All rights reserved.
//

import UIKit

class TodoListTableViewController: UITableViewController {

    
    let defaults = UserDefaults.standard
    
    var itemArray = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        if let items = defaults.array(forKey: "ToDoListArray") as? [String]
//        {
//            itemArray = items
//        }
        let newItem = Item()
        newItem.title = "Mike thing"
        itemArray.append(newItem)
        
        
        let newItem2 = Item()
        newItem2.title = "Bob thing"
        itemArray.append(newItem2)
        
        if let items = defaults.array(forKey: "ToDoListArray") as? [Item]
        {
            itemArray = items
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    //MARK: - tableView  Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        //        if item.done == true
        //        {
        //            cell.accessoryType = .checkmark
        //        }else
        //        {
        //            cell.accessoryType = .none
        //        }
        
        // ternary operator ==>
        // value = condition ? valueIfTrue : valueIfTrue
        
        //cell.accessoryType = item.done == true ? .checkmark : .none
        
        cell.accessoryType = item.done ? .checkmark : .none

        
        return cell
    }
    
    //MARK: - tableView delegate methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //print(itemArray[indexPath.row])

        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
//        if itemArray[indexPath.row].done == true
//        {
//           itemArray[indexPath.row].done = false
//        }else
//        {
//            itemArray[indexPath.row].done = true
//        }
        
        self.tableView.reloadData()

        
//        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
//           tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        } else{
//           tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK : - add new items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoyeh Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen when the user clicks the add item button on our UI alert
            if textField.text != nil {
            
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
                
            self.tableView.reloadData()
            }else
            {
            self.tableView.reloadData()
            }
            //print (textField.text)
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
            //print(alertTextField.text!)
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

