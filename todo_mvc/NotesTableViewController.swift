//
//  NotesTableViewController.swift
//  todo_mvc
//
//  Created by Marquavious on 11/19/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController {
    
    var toDos:[ToDo]=[
        ToDo(taskTitle: "Feed the dog", taskDeadline: "11/23/2016", finishedState: .finished),
        ToDo(taskTitle: "Eat Food", taskDeadline: "12/23/2016", finishedState: .notFinished),
        ToDo(taskTitle: "Clean Up Room", taskDeadline: "10/13/2016", finishedState: .finished)
    ]
    
    // MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: TableView Funtions
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NoteTableViewCell
        cell.notesTableViewController = self
        cell.todo = toDos[indexPath.row]
        let todosForTableView = toDos[indexPath.row]
        cell.toDoTextLabel.text = todosForTableView.taskTitle
        
        if todosForTableView.finishedState == .finished {
            cell.deadlineLabel.text = todosForTableView.finishedSentence
            cell.deadlineLabel.textColor = UIColor.green
        } else {
            cell.deadlineLabel.text = todosForTableView.taskDeadline
        }
        
        switch todosForTableView.finishedState {
        case .finished:
            cell.verificationButton.setTitle(ToDo.finishedState.notFinished.rawValue, for: .normal)
        default:
            cell.verificationButton.setTitle(ToDo.finishedState.finished.rawValue, for: .normal)
        }
        return cell
    }
    
    // MARK: Extra functions
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTodo" {
            let destinaiton = segue.destination as! TodoViewController
            let indexpath = tableView.indexPathForSelectedRow
            let toDo = toDos[(indexpath?.row)!]
            destinaiton.todo = toDo
            destinaiton.viewControler = self
        }
    }
    
    func changeFinishedState(){
        //MARK: add functions here that allow user to change the mood by tapping the picture in the cell
        
        //checks for the currant state of the todo objecet and chages it to the oppisite when tapped
        
    }
    
    func addNewTodo(){
        
    }
    
    func reloadData() {
        tableView.reloadData()
    }
}
