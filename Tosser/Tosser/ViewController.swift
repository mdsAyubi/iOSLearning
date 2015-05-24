//
//  ViewController.swift
//  Tosser
//
//  Created by ayubi on 17/05/15.
//  Copyright (c) 2015 Athvillar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var timer = NSTimer()
    var counter = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var swipeRight = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right;
        
        self.view.addGestureRecognizer(swipeRight)
        
        var swipeUp = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        
        self.view.addGestureRecognizer(swipeUp)
        
        var swipeDown = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        
        self.view.addGestureRecognizer(swipeDown)
        
        var swipeLeft = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    
    func swiped(gesture: UIGestureRecognizer){
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            
            switch swipeGesture.direction{
                
            case UISwipeGestureRecognizerDirection.Right:
                println("User swiped right...")
            case UISwipeGestureRecognizerDirection.Left:
                println("User swiped left...")
                
            case UISwipeGestureRecognizerDirection.Up:
                println("User swiped up...")
               swipedUpGestureHandler()
                
            case UISwipeGestureRecognizerDirection.Down:
                println("User swiped down...")
                stopToss()
                
                
            default: println("Left...i guess");break;
                
                
            }
            
        }
        
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        
        if event.subtype == UIEventSubtype.MotionShake {
            println("User shakes...")
            
        }
    }
    
    func swipedUpGestureHandler(){
        println("Inside swipted handler")
        timer = NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: Selector("tossItUp"), userInfo:nil, repeats:true)
    }
    
    func tossItUp(){
        
        //println("Inside...tossitup")
        
        counter++
        if counter == 36{
            counter = 1
        }
        
        let frame = UIImage(named: "\(counter).png")
        imageView.image = frame
 
        
    }
    
    func stopToss(){
        timer.invalidate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

