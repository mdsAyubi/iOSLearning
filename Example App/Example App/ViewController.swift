//
//  ViewController.swift
//  Example App
//
//  Created by ayubi on 13/01/15.
//  Copyright (c) 2015 Gazelle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        myLabel.text = "It works!!!";        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("Hello World!!!");

        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

