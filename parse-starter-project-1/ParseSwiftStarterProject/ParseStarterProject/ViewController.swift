//
//  ViewController.swift
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var registeredText: UILabel!
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    var signUpActive = true
    @IBOutlet weak var userName: UITextField!

    @IBOutlet weak var passWord: UITextField!
    
    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    
    func displayAlert(tile:String,message:String){
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func signUp(sender: AnyObject) {
        
        if userName.text == "" || passWord.text == "" {
            
            displayAlert("Error in form", message: "Please enter username and password")
            
        }else{
            
            activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0, 0, 50, 50))
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
            view.addSubview(activityIndicator)
            
            activityIndicator.startAnimating()
            UIApplication.sharedApplication().beginIgnoringInteractionEvents()
            
            var errorMessage = "Please try again later"
            
            if signUpActive == true {
            
                var user = PFUser()
                user.username = userName.text
                user.password = passWord.text
            
                user.signUpInBackgroundWithBlock({ (success, error) -> Void in
                
                self.activityIndicator.stopAnimating()
                UIApplication.sharedApplication().endIgnoringInteractionEvents()
                
                if error == nil{
                    //Signup successfull
                    println("Signup successfull")
                    self.performSegueWithIdentifier("login", sender: self)
                    }else{
                    
                        if let errorString = error!.userInfo?["error"] as? String{
                            errorMessage = errorString
                        }
                        self.displayAlert("Failed Sign Up", message: errorMessage)
                    }
                
                })
            }else{
                self.activityIndicator.stopAnimating()
                UIApplication.sharedApplication().endIgnoringInteractionEvents()
                
                PFUser.logInWithUsernameInBackground(userName.text, password: passWord.text, block: { (user, error) -> Void in
                    
                    if user != nil {
                        //Log in successfull
                        println("Log In successfull")
                        self.performSegueWithIdentifier("llogin", sender: self)
                    }else{
                        
                        if let errorString = error!.userInfo?["error"] as? String{
                            errorMessage = errorString
                        }
                        self.displayAlert("Failed to Log In", message: errorMessage)
                    }
                    
                })
                
            }
            
            
        }
        
        
    }

    @IBAction func logIn(sender: AnyObject) {
        
        if signUpActive == true {
            
            signUpButton.setTitle("Log In", forState: UIControlState.Normal)
            registeredText.text = "Not yet registered?"
            loginButton.setTitle("Sign Up", forState: UIControlState.Normal)
            signUpActive = false
            
        }else{
            
            signUpButton.setTitle("Sign Up", forState: UIControlState.Normal)
            registeredText.text = "Already registered?"
            loginButton.setTitle("Log In", forState: UIControlState.Normal)
            signUpActive = true
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    
    override func viewDidAppear(animated: Bool) {
        
        if PFUser.currentUser() != nil {
            self.performSegueWithIdentifier("login", sender: self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

func parseTest(){
    // Do any additional setup after loading the view, typically from a nib.
    
    /*var product = PFObject(className: "Products")
    product["name"] = "Pizza"
    product["description"] = "Cheesy"
    product["price"] = 10.01
    
    product.saveInBackgroundWithBlock { (success, error) -> Void in
    
    if success == true{
    println("Successfull")
    } else{
    println("Failed")
    println(error)
    }
    
    }
    
    var query = PFQuery(className: "Products")
    query.getObjectInBackgroundWithId("M2kqsi7Tgj", block: { (object:PFObject?, error) -> Void in
    if error != nil {
    println(error)
    
    }else{
    println(object)
    }
    })*/
}