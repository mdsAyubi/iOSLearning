//
//  WireViewController.swift
//  Wires POC
//
//  Created by ayubi on 06/10/15.
//  Copyright (c) 2015 Athvillar. All rights reserved.
//

import UIKit

var wires = [Wire]()
class WireViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var wireTableView: UITableView!
    
    
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        println("Wires count is \(wires.count)")
        return wires.count
        
    }
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        println("Numbe rof sections is 1")
        return 1
    }
    
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell:WireTableViewCell = self.wireTableView.dequeueReusableCellWithIdentifier("WireCell") as! WireTableViewCell
        cell.paymentTypeLabel.text = wires[indexPath.row].paymentType
        cell.wireDateLabel.text = wires[indexPath.row].date
        cell.wireActualSourceNameLabel.text = wires[indexPath.row].wireSource
        cell.wireActualDestinationLabel.text = wires[indexPath.row].wireDestination
        cell.wireCurrencyLabel.text = wires[indexPath.row].currency
        cell.wireAmountLabel.text = "\(wires[indexPath.row].wireAmount)"
        
        println(cell)
        
        return cell
        
        
    }
    
     func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        
    }
    
    func loadSampleWires() {
        
        let wire1 = Wire(paymentType:"SWAP", date:"20151004", wireSource:"BNPP", wireDestination:"MSCC", currency:"USD", wireAmount:100.00)
        
        let wire2 = Wire(paymentType:"SWAP", date:"20151004", wireSource:"BNPP", wireDestination:"MSCC", currency:"USD", wireAmount:100.00)
        let wire3 = Wire(paymentType:"SWAP", date:"20151004", wireSource:"BNPP", wireDestination:"MSCC", currency:"USD", wireAmount:100.00)
        
        
        wires.append(wire1)
        wires.append(wire2)
        wires.append(wire3)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.wireTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "WireCell")
        
        
        self.wireTableView.delegate = self
        self.wireTableView.dataSource = self
    }
    
    override func viewWillAppear(animated: Bool) {
        wireTableView.reloadData()
    }

    
    

}
