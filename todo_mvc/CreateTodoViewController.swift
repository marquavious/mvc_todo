//
//  ViewController.swift
//  todo_mvc
//
//  Created by Marquavious on 11/19/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

import UIKit

class CreateTodoViewController: UIViewController {
    @IBOutlet weak var newTodoTextField: UITextField!

    @IBAction func datePicked(_ sender: Any) {
        handler(sender: datePicker)
    }
    
    @IBOutlet weak var datePicker: UIDatePicker!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
         datePicker.addTarget(self, action: Selector("handler:"), for: UIControlEvents.valueChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func handler(sender: UIDatePicker) {
        var timeFormatter = DateFormatter()
        timeFormatter.timeStyle = DateFormatter.Style.short
        
        var strDate = timeFormatter.string(from: datePicker.date)
        // do what you want to do with the string.
        print(strDate)
    }
}

