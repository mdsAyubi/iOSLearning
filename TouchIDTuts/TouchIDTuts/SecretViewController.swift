//
//  SecretViewController.swift
//  TouchIDTuts
//
//  Created by ayubi on 07/09/15.
//  Copyright (c) 2015 Athvillar. All rights reserved.
//

import UIKit

class SecretViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.whiteColor()
        
        var secretText = UILabel(frame: CGRectMake(10, view.frame.midX-50, view.frame.maxX-20, 100))
        secretText.text = "Blah Blah Secret Text View Controller"
        secretText.textColor = UIColor.blackColor()
        
        //Add to main view
        view.addSubview(secretText)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
