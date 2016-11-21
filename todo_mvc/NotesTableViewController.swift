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
            cell.deadlineLabel.textColor = UIColor.red
        }
        
        switch todosForTableView.finishedState {
        case .finished:
            cell.verificationButton.setTitle(ToDo.finishedState.notFinished.rawValue, for: .normal)
        default:
            cell.verificationButton.setTitle(ToDo.finishedState.finished.rawValue, for: .normal)
        }
        return cell
    }
    
    // MARK: Prepare for segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTodo" {
            let destinaiton = segue.destination as! TodoViewController
            let indexpath = tableView.indexPathForSelectedRow
            let toDo = toDos[(indexpath?.row)!]
            destinaiton.todo = toDo
            destinaiton.viewControler = self
        } else {
            let destinaiton = segue.destination as! CreateTodoViewController
            destinaiton.notesTableViewController = self
        }
    }
    
    // MARK: View controller states
    
    func changeFinishedState(toDo: ToDo){
        switch toDo.finishedState {
        case .finished :
            toDo.finishedState = .notFinished
            tableView.reloadData()
        case .notFinished :
            toDo.finishedState = .finished
            tableView.reloadData()
        }
    }
    
    func addNewTodo(todo:ToDo) {
        toDos.append(todo)
        tableView.reloadData()
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func deleteTodo(todo:ToDo, index: Int){
        toDos.remove(at: index)
    }
}
