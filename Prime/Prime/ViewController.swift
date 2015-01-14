//
//  ViewController.swift
//  Prime
//
//  Created by ayubi on 15/01/15.
//  Copyright (c) 2015 Gazelle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var number: UITextField!
    @IBAction func buttonPressed(sender: AnyObject) {
        
        var numberInt = number.text.toInt()
        
        if(numberInt != nil){
            
            var unwrappedNumberInt = numberInt!
            var isPrime = true;
            if (unwrappedNumberInt == 1){
                isPrime = false;
            }
            if (unwrappedNumberInt != 1 && unwrappedNumberInt != 2){
                
                for (var j=2;j<unwrappedNumberInt;j++){
                    if((unwrappedNumberInt % j) == 0){
                        isPrime = false
                    }
                }
            }
            
            if( isPrime == true){
                resultLabel.text = "Prime"
            }
            else{
                resultLabel.text = "Not prime"
            }
            
        }
        else{
            resultLabel.text = "Please enter a number"
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

