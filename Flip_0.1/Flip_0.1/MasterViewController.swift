//
//  MasterViewController.swift
//  Flip_0.1
//
//  Created by ayubi on 03/06/15.
//  Copyright (c) 2015 Athvillar. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var objects = [AnyObject]()
    var coins = ["Dollar","Euro"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                
                println(indexPath)
                let object = coins[indexPath.row]
                
                (segue.destinationViewController as! DetailViewController).detailItem = object
                
                //let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                
                //controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                //controller.navigationItem.leftItemsSupplementBackButton = true
            }

            
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell

        //self.configureCell(cell, atIndexPath: indexPath)
        //cell.textLabel!.text = "Test"
        let row = indexPath.row
        cell.textLabel?.text = coins[row]
        return cell
    }
    
    func configureCell(cell: UITableViewCell, atIndexPath indexPath: NSIndexPath) {
        //let object = self.fetchedResultsController.objectAtIndexPath(indexPath) as! NSManagedObject
        //cell.textLabel!.text = object.valueForKey("title")!.description
        //cell.detailTextLabel!.text = object.valueForKey("author")!.description
    }


    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }


}

