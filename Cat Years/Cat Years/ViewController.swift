//
//  ViewController.swift
//  Cat Years
//
//  Created by ayubi on 13/01/15.
//  Copyright (c) 2015 Gazelle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outputAge: UILabel!
    @IBOutlet weak var inputAge: UITextField!
    @IBAction func buttonPressed(sender: AnyObject) {
        var enteredAge = inputAge.text.toInt()
        
        
        if enteredAge != nil {
            var catYears = enteredAge! * 7
            outputAge.text = "Your cat is \(catYears) years"
        
            println(catYears);
        }
        else{
            outputAge.text = "Please enter a number"
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

