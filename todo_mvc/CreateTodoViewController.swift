//
//  ViewController.swift
//  todo_mvc
//
//  Created by Marquavious on 11/19/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

import UIKit

class CreateTodoViewController: UIViewController {
    
    var notesTableViewController: NotesTableViewController!
    @IBOutlet weak var newTodoTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func saveToDo(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let strDate = dateFormatter.string(from: datePicker.date)
        let newToDo = ToDo(taskTitle: newTodoTextField.text!, taskDeadline: strDate, finishedState: .notFinished)
        notesTableViewController.addNewTodo(todo: newToDo)
        presentingViewController?.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

