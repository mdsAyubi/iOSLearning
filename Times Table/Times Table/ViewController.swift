//
//  ViewController.swift
//  Times Table
//
//  Created by ayubi on 15/03/15.
//  Copyright (c) 2015 Gazelle. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var table: UITableView!
    @IBAction func sliderMoved(sender: AnyObject) {
        //println(slider.value)
        table.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 20
    }
    

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell(style:UITableViewCellStyle.Default, reuseIdentifier:"Cell")
        let timesTable = Int(slider.value*20)
        cell.textLabel?.text = String(timesTable*(indexPath.row+1))
        
        
        return cell
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

