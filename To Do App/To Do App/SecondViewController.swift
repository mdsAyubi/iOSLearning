//
//  SecondViewController.swift
//  To Do App
//
//  Created by ayubi on 18/01/15.
//  Copyright (c) 2015 Gazelle. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    


    @IBOutlet weak var toDoItem: UITextField!
    
    
    @IBAction func addItem(sender: AnyObject) {
        
        toDoItems.append(toDoItem.text)
        let fixedToDoItems = toDoItems
        NSUserDefaults.standardUserDefaults().setObject(fixedToDoItems, forKey: "toDoItems")
        NSUserDefaults.standardUserDefaults().synchronize()
        
     
        
        self.view.endEditing(true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }


}

