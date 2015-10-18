//
//  ViewController.swift
//  WirePrototype
//
//  Created by ayubi on 07/10/15.
//  Copyright © 2015 Athvillar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var wires = [Wire]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadSampleData();

    }
    
    func loadSampleData(){
        
        let wire1 = Wire(wireId:1, paymentType:"SWAP", date:"20151004", wireSource:"BNPP", wireDestination:"MSCC", currency:"USD", wireAmount:100.00)
        
        let wire2 = Wire(wireId:2, paymentType:"SWAP", date:"20151004", wireSource:"BNPP", wireDestination:"MSCC", currency:"USD", wireAmount:100.00)
        let wire3 = Wire(wireId:3, paymentType:"SWAP", date:"20151004", wireSource:"BNPP", wireDestination:"MSCC", currency:"USD", wireAmount:100.00)
        
        
        wires.append(wire1)
        wires.append(wire2)
        wires.append(wire3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section:
        Int) -> Int
    {
        return self.wires.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        // Allocates a Table View Cell
        let aCell =
        self.tableView.dequeueReusableCellWithIdentifier("Cell",
            forIndexPath: indexPath) as! TableViewCell
        
        // Sets the text of the Label in the Table View Cell
        aCell.paymentType.text = self.wires[indexPath.row].wireDestination
        aCell.date.text = self.wires[indexPath.row].date
        aCell.amount.text = "\(self.wires[indexPath.row].wireAmount)"
        aCell.destination.text = self.wires[indexPath.row].wireDestination
        aCell.source.text = self.wires[indexPath.row].wireSource
        aCell.currency.text = self.wires[indexPath.row].currency
        
        return aCell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        self.performSegueWithIdentifier("showView", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender:
        AnyObject?)
    {
        if (segue.identifier == "showView")
        {
            // upcoming is set to NewViewController (.swift)
            let upcoming: NewViewController = segue.destinationViewController
                as! NewViewController
            // indexPath is set to the path that was tapped
            let indexPath = self.tableView.indexPathForSelectedRow!
            // titleString is set to the title at the row in the objects array.
            let titleString = self.wires[indexPath.row].wireId
            // the titleStringViaSegue property of NewViewController is set.
            upcoming.titleStringViaSegue = "\(titleString)"
            self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        }
    }

}

