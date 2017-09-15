//
//  DoneTableViewController.swift
//  TODO_UMAI
//
//  Created by Akshara on 15/09/17.
//  Copyright © 2017 UMAI. All rights reserved.
//

import UIKit

class DoneTableViewController: UITableViewController {
  
  @IBOutlet var doneTableView: UITableView!
  
  var doneItems: [TodoItem] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    reloadTable()
  }
  
  /**
   - To reload the items in the list
   */
  
  func reloadTable() {
    doneItems = []
    for item in Common.sharedInstance.items {
      if item.status == true {
        if !doneItems.contains(item) {
          doneItems.append(item)
        }
      }
    }
    doneTableView.reloadData()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return doneItems.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "doneCell", for: indexPath)
    let todoitem: TodoItem = doneItems[indexPath.row]
    cell.textLabel?.text = todoitem.itemDescription
    return cell
  }
  
  /**
   - To delete table row on swipe
  */
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      // remove the item from the items list
      Common.sharedInstance.items.remove(at: indexPath.row)
      doneItems.remove(at: indexPath.row)
      doneTableView.reloadData()
    }
  }
  
}


