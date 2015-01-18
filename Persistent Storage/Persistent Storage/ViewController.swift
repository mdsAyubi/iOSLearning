//
//  ViewController.swift
//  Persistent Storage
//
//  Created by ayubi on 18/01/15.
//  Copyright (c) 2015 Gazelle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NSUserDefaults.standardUserDefaults().setObject("Viky", forKey:"myName")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        println(NSUserDefaults.standardUserDefaults().objectForKey("myName"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

