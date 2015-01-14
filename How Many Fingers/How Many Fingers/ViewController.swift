//
//  ViewController.swift
//  How Many Fingers
//
//  Created by ayubi on 14/01/15.
//  Copyright (c) 2015 Gazelle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var inputNumber: UITextField!
    @IBAction func guessPressed(sender: AnyObject) {
        
        var randomNumber = arc4random_uniform(6)
        var input = inputNumber.text.toInt()
        
        if( input != nil ){
            
            if( input == Int(randomNumber) ){
                resultLabel.text = "Correct"
            }
            else{
                resultLabel.text = "Incorrect, correct finger was \(randomNumber)"
            }
            
        }
        
        else{
            resultLabel.text = "Please enter a number between 0 and 5"
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

