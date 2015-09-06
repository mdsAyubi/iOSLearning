//
//  ViewController.swift
//  TouchIDTuts
//
//  Created by ayubi on 07/09/15.
//  Copyright (c) 2015 Athvillar. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var authenticationObject = LAContext()
        var authenticationError:NSError?
        
        authenticationObject.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: &authenticationError)
        
        if authenticationError != nil{
            //Error
            println("Authentication not available for this version iOS...")
        }
        else{
            //No error
            authenticationObject.evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, localizedReason: "Access with touch of you finger!", reply: { (complete:Bool, error:NSError!) -> Void in
                if error != nil {
                    //Error, user likely pressed cancel
                    println(error.localizedDescription)
                }else{
                    //Authentication Successfull.
                    if complete == true {
                        println("Authentication Successful")
                        var secretViewController = SecretViewController(nibName:nil, bundle:nil)
                        self.presentViewController(secretViewController, animated: true, completion: nil)
                    }else{
                        //Not correct user
                        println("Authentication failed.")
                    }
                }
            })
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

