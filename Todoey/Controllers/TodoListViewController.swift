//
//  ViewController.swift
//  Todoey
//
//  Created by Houmem Zaghdoudi on 9/3/18.
//  Copyright © 2018 Houmem Zaghdoudi. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    // reusable cell methond makes the check mark reappear at the bottom whent he cell disappear on the top of the screen
    // this is becuase the checkmark is cell property, we need to assciate the checkmark with the data in the cell not the cell
    // instead of array we can use a Dictionnay, a better solution is to create a data model
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Find Mike"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Buy Eggos"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Destroyer"
        itemArray.append(newItem3)
        
        
        // enables the app to look into the app sandbox for the simulator and garb data on load
        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
          itemArray = items
            
        }
    }

    //MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        //Ternery operator :
        // value = condition ? valueifTrue : valueiffalse
        
        cell.accessoryType = item.done  ? .checkmark : .none
        // the above line replaces the below block of code
        //if item.done == true {
         //   cell.accessoryType = .checkmark
        //} else {
          //  cell.accessoryType = .none
        //}
        
        return cell
        
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        // this single line above equals the below toggle cod block
        //if itemArray[indexPath.row].done == false {
        //    itemArray[indexPath.row].done = true
        //} else {
        //    itemArray[indexPath.row].done = false
        //}
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        tableView.reloadData()
    
    }
    
    //MARK - Add item
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
}

