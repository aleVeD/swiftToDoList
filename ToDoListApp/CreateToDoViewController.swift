//
//  CreateToDoViewController.swift
//  ToDoListApp
//
//  Created by user166463 on 5/19/20.
//  Copyright © 2020 user166463. All rights reserved.
//

import UIKit

class CreateToDoViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var importantS: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addTapped(_ sender: Any) {
        if let context  = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            let newToDo = ToDoItem(context: context)
            if let name = nameTextField.text{
               newToDo.name = name
               newToDo.important = importantS.isOn
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
               navigationController?.popViewController(animated: true)
            }
        }
    }
}
