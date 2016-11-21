//
//  NoteTableViewCell.swift
//  todo_mvc
//
//  Created by Marquavious on 11/19/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    
    var notesTableViewController: NotesTableViewController? = nil
    var todo: ToDo!
    
    @IBOutlet weak var toDoTextLabel: UILabel!
    @IBOutlet weak var deadlineLabel: UILabel!
    @IBOutlet weak var verificationButton: UIButton!
    @IBAction func verificationButtonPressed(_ sender: Any) {
        notesTableViewController?.changeFinishedState(toDo: todo)
        notesTableViewController?.reloadData()
    }
}
