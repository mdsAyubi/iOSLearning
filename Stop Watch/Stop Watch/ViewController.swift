//
//  ViewController.swift
//  Stop Watch
//
//  Created by ayubi on 17/01/15.
//  Copyright (c) 2015 Gazelle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var counter = 0
    var timer = NSTimer()
    @IBOutlet weak var count: UILabel!

    @IBAction func play(sender: AnyObject) {
        
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("result"), userInfo:nil, repeats:true)
        
        
    }
    
    @IBAction func reset(sender: AnyObject) {
        timer.invalidate()
        counter = 0
        count.text = "0"
        
        
    }
    @IBAction func pause(sender: AnyObject) {
        timer.invalidate()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    func result(){
        //println("something else")
        counter++
        count.text = String(counter)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

