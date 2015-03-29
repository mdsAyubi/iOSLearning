//
//  ViewController.swift
//  ShakesAndSwipes
//
//  Created by ayubi on 25/03/15.
//  Copyright (c) 2015 Gazelle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
            case UISwipeGestureRecognizerDirection.Down:
                println("User swiped down...")

                
            default: println("Left...i guess");break;
                
                
            }
            
        }
        
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        
        if event.subtype == UIEventSubtype.MotionShake {
            
            println("User shakes...")
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

