//
//  ToDo.swift
//  todo_mvc
//
//  Created by Marquavious on 11/19/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

class ToDo {
    
    var taskTitle: String
    var taskDeadline: String
    var finishedState: finishedState
    var finishedSentence = "You are done here! 💪"
    
    init(taskTitle:String, taskDeadline: String, finishedState: finishedState) {
        self.taskTitle = taskTitle
        self.taskDeadline = "DEADLINE: \(taskDeadline)"
        self.finishedState = finishedState
    }
    
    enum finishedState: String {
        case finished = "✅"
        case notFinished = "‼️"
    } 
}
