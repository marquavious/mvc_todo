//
//  TodoViewController.swift
//  todo_mvc
//
//  Created by Marquavious on 11/19/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

import UIKit

class TodoViewController: UIViewController {
    var todo:ToDo?
    var viewControler: NotesTableViewController!
    @IBOutlet weak var deadlineTextLabel: UILabel!
    @IBOutlet weak var markAsDoneButton: UIButton!
    
    @IBAction func markAsDoneAction(_ sender: Any) {
        
        if todo?.finishedState == .notFinished {
            todo?.finishedState = .finished
        } else {
            todo?.finishedState = .notFinished
        }
        checkForCompletion()
        viewControler.reloadData()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        deadlineTextLabel.text = todo?.taskDeadline
        self.title = todo?.taskTitle
        checkForCompletion()
        
    }
    
    func checkForCompletion() {
        if todo?.finishedState == .finished {
            markAsDoneButton.setTitle("Mark as UnFinished\(ToDo.finishedState.notFinished.rawValue)", for: .normal)
            deadlineTextLabel.text = todo?.finishedSentence
            deadlineTextLabel.textColor = UIColor.green
        } else {
            markAsDoneButton.setTitle("Mark as Finished\(ToDo.finishedState.finished.rawValue)", for: .normal)
            deadlineTextLabel.text = todo?.taskDeadline
            deadlineTextLabel.textColor = UIColor.red

        }
    }
}
