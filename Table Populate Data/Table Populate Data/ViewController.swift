//
//  ViewController.swift
//  Table Populate Data
//
//  Created by ayubi on 18/01/15.
//  Copyright (c) 2015 Gazelle. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    let array = ["Nazia", "Shazia", "Bubbles" , "Viky"]
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 4;
        
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell(style:UITableViewCellStyle.Default, reuseIdentifier: "cell")
        cell.textLabel?.text = array[indexPath.row]
        return cell
        
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

