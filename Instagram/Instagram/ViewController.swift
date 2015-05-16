//
//  ViewController.swift
//  Instagram
//
//  Created by ayubi on 20/04/15.
//  Copyright (c) 2015 Gazelle. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController, UINavigationControllerDelegate,UIImagePickerControllerDelegate {

    @IBOutlet weak var pickedImage: UIImageView!
    
    var activityIndicator = UIActivityIndicatorView()
    
    
    @IBAction func pause(sender: AnyObject) {
        
        activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0, 0, 50, 50))
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = .Gray //UIActivityIndicatorViewStyle.Gray
        
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        //UIApplication.sharedApplication().beginIgnoringInteractionEvents()
        
        
    }
    
    
    @IBAction func restore(sender: AnyObject) {
        
        activityIndicator.stopAnimating()
        //UIApplication.sharedApplication().endIgnoringInteractionEvents()
    }
    
    @IBAction func createAlert(sender: AnyObject) {
        
        var alert = UIAlertController(title: "Hey", message: "Sure?", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    @IBAction func pickImage(sender: AnyObject) {
        
        var image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        image.allowsEditing = false
        
        self.presentViewController(image, animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        println("Image selected")
        self.dismissViewControllerAnimated(true, completion: nil)
        pickedImage.image = image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        /*
        Parse.enableLocalDatastore()
        
        // Initialize Parse.
        Parse.setApplicationId("v02nftHkCHuj5C72n1cXnGefVJkXvcqA40Tjl4uP",
            clientKey: "thREytLXf16whZvzwOSMJAtE3ngyE1tRFlNIF7b0")
        
        
        var score = PFObject(className: "UserScore")
        score.setObject("Viky", forKey: "name")
        score.setObject(95, forKey: "score")
        score.saveInBackgroundWithBlock {
           (success:Bool!, error:NSError!) ->Void in
            
            if success == true {
                println("Created the score with ID: \(score.objectId)")
            }else{
                println(error)
            }
            
            
        }
        
        var query = PFQuery(className: "UserScore")
        query.getObjectInBackgroundWithId("t39VtxhSIm"){
            
            (score:PFObject!, error:NSError!) ->Void in
            
            if error == nil {
                //println(score)
                println(score.objectForKey("name"))
                println(score.objectForKey("score"))
                
                score["name"] = "Vixy"
                score["score"] = 100
                score.saveInBackgroundWithBlock()
                println("Done updating")
                
            }else{
                println(error)
            }
            
        }*/
        
        //println("Done...")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

