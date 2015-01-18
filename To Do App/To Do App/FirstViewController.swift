//
//  FirstViewController.swift
//  To Do App
//
//  Created by ayubi on 18/01/15.
//  Copyright (c) 2015 Gazelle. All rights reserved.
//

import UIKit

var toDoItems:[String] = []


class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tasksTable:UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return toDoItems.count
        
    }
 
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        cell.textLabel?.text = toDoItems[indexPath.row]
        return cell
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        
        //var storedToDoItems:AnyObject
        if var storedToDoItems: AnyObject = NSUserDefaults.standardUserDefaults().objectForKey("toDoItems"){
        //if  storedToDoItems.length != 0 {
            toDoItems = []
            for var i = 0; i < storedToDoItems.count; i++ {
                toDoItems.append(storedToDoItems[i] as NSString)
            }
            
            
        }
        
        //println(storedToDoItems)
        tasksTable?.reloadData()
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        
        if ( editingStyle == UITableViewCellEditingStyle.Delete ){
            
            toDoItems.removeAtIndex(indexPath.row)
            
            let fixedToDoItems = toDoItems
            NSUserDefaults.standardUserDefaults().setObject(fixedToDoItems, forKey: "toDoItems")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            tasksTable?.reloadData()
        }
    }


}

