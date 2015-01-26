//
//  ViewController.swift
//  ImageDemo
//
//  Created by ayubi on 25/01/15.
//  Copyright (c) 2015 Gazelle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var counter = 1
    @IBOutlet weak var image: UIImageView!
    
    @IBAction func imageChanged(sender: AnyObject) {
        
        
        
        counter++
        if (counter == 6) {
            counter = 1
        }
        
        let frame2 = UIImage(named: "frame\(counter).png")
        image.image = frame2
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        
        image.center = CGPointMake(image.center.x - 400, image.center.y)
        
    }
    override func viewDidAppear(animated: Bool) {
        
        UIView.animateWithDuration(1, animations: {
            
            self.image.center = CGPointMake(self.image.center.x + 400, self.image.center.y)
            
        })
    }


}

