//
//  ViewController.swift
//  Core Data Demo
//
//  Created by ayubi on 04/04/15.
//  Copyright (c) 2015 Gazelle. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var appDel:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        
        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context) as NSManagedObject
        
        newUser.setValue("Viky", forKey: "userName")
        newUser.setValue("pass123", forKey: "password")
        
        newUser.setValue("UB", forKey: "userName")
        newUser.setValue("pass321", forKey: "password")
        
        context.save(nil)
        
        var request = NSFetchRequest(entityName: "Users")
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "userName = %@", "UB")
        
        var results = context.executeFetchRequest(request, error: nil)
        println(results)
        
        if results?.count > 0{
        
            for result:AnyObject in results! {
                
                if let user = result.valueForKey("userName") as? String {
                    println(user)
                    //println(result.user)
                    
                    if user == "UB" {
                        //context.deleteObject(result as NSManagedObject)
                        //println(user + "has been deleted")
                        result.setValue("passblahblah", forKey: "password")
                    }
                    
                }
            context.save(nil)
            }
        }
        else{
            println("DB empty")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

