//
//  PendingTableViewController.swift
//  TODO_UMAI
//
//  Created by Akshara on 15/09/17.
//  Copyright © 2017 UMAI. All rights reserved.
//

import UIKit


class PendingTableViewController: UITableViewController {
  
  @IBOutlet var pendingTableView: UITableView!
  var pendingItems: [TodoItem] = []
  var toDoItem: TodoItem?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector((addTodoItem)))
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  /**
   - Item Add action
   */
  
  @objc func addTodoItem() {
    let alertController = UIAlertController(title: "Add Item", message: "Add an Item to your TODO List", preferredStyle: .alert)
    
    let saveAction = UIAlertAction(title: "Save", style: .default, handler: {
      alert -> Void in
      
      let todoItemTextField = alertController.textFields![0] as UITextField
      
      if todoItemTextField.text != "" {
        self.saveItem(itemDescription: todoItemTextField.text ?? "", status: false)
        self.reloadTable()
      }
      
    })
    
    let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: {
      (action : UIAlertAction!) -> Void in
      
    })
    
    alertController.addTextField { (textField : UITextField!) -> Void in
      textField.placeholder = "Enter a TODO Item"
    }
    
    alertController.addAction(saveAction)
    alertController.addAction(cancelAction)
    
    self.present(alertController, animated: true, completion: nil)
  }
  
  /**
   - To add an item to TODO list
   */
  
  func saveItem(itemDescription: String, status: Bool) {
    let item: TodoItem? = TodoItem()
    item?.itemDescription = itemDescription
    item?.status = status
    Common.sharedInstance.items.append(item!)
  }
  
  /**
   - To reload table data
   */
  
  func reloadTable() {
    for item in Common.sharedInstance.items {
      if item.status == false {
        if !pendingItems.contains(item) {
          pendingItems.append(item)
        }
      }
    }
    pendingTableView.reloadData()
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return pendingItems.count
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "pendingCell", for: indexPath)
    let todoitem: TodoItem = pendingItems[indexPath.row]
    DispatchQueue.main.async(){
      cell.textLabel?.text = todoitem.itemDescription
      if todoitem.status == true {
        cell.accessoryType = .checkmark
      } else {
        cell.accessoryType = .none
      }
    }
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if pendingItems[indexPath.row].status == false {
      pendingItems[indexPath.row].status = true
    } else {
      pendingItems[indexPath.row].status = false
    }
    pendingTableView.reloadData()
  }
  
  /**
   - To delete table row on swipe
   */
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      
      // remove the item from the data model
      Common.sharedInstance.items.remove(at: indexPath.row)
      
      pendingItems.remove(at: indexPath.row)
      pendingTableView.reloadData()
    }
  }
  
}
