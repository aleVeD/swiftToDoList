//
//  ToDoTableViewController.swift
//  ToDoListApp
//
//  Created by user166463 on 5/19/20.
//  Copyright © 2020 user166463. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    var toDos:  [ToDoItem] = []
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool){
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDataToDoItems = try? context.fetch(ToDoItem.fetchRequest()) as? [ToDoItem]{
                toDos = coreDataToDoItems
                print(coreDataToDoItems)
                tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*  if let createVC = segue.destination as? CreateToDoViewController{
            createVC.toDoTableViewVC = self
           
        }
 */
        
        if let completeVC = segue.destination as? CompleteViewController {
            
            if let toDo = sender as? ToDoItem{
                completeVC.toDo = toDo
               // completeVC.toDoTableVC = self
            }
        }
    }
    
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }*/

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedToDo = toDos[indexPath.row]
        performSegue(withIdentifier: "goToComplete", sender: selectedToDo)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let toDo = toDos[indexPath.row]
        
        if toDo.important {
            if let name = toDo.name{
                 cell.textLabel?.text = " 🔸 " + name
            }
        }else{
            cell.textLabel?.text = toDo.name
            
        }
        return cell
    }

}
