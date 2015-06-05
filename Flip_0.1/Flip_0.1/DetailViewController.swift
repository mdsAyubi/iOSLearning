//
//  DetailViewController.swift
//  Flip_0.1
//
//  Created by ayubi on 03/06/15.
//  Copyright (c) 2015 Athvillar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    var timer = NSTimer()
    var counter = 1
    
    //Type of coin received
    var cointType:String = "Dollar"
    
    //Rotation accounting variables
    var totalTimesToRotate:Int = 0
    var currentNumberOfRotations:Int = 0
    
    //Final state of the coin, to be determined by this
    var probabilityOfHead:Int = 0
    
    //Variables to account for gesture recongnizers
    var swipeRight:UISwipeGestureRecognizer!,swipeLeft:UISwipeGestureRecognizer!,swipeUp:UISwipeGestureRecognizer!,swipeDown:UISwipeGestureRecognizer!
    
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: AnyObject = self.detailItem {
            
            println("Printing the value in detail")
            println(detail)
            cointType = detail as! String
            
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        println("Type of coin selected is \(cointType)")
        //self.navigationController.interactivePopGestureRecognizer.delegate = self
        
        
        swipeRight = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right;
        
        
        self.view.addGestureRecognizer(swipeRight)
        
        swipeUp = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        
        self.view.addGestureRecognizer(swipeUp)
        
        swipeDown = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        
        self.view.addGestureRecognizer(swipeDown)
        
        swipeLeft = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    
    func disableAllGestures() {
        
        self.swipeUp.enabled = false
        //self.swipeDown.enabled = false
        self.swipeLeft.enabled = false
        self.swipeRight.enabled = false
    }
    
    func enableAllGestures() {
        swipeUp.enabled = true
        //swipeDown.enabled = true
        swipeLeft.enabled = true
        swipeRight.enabled = true
    }
    
    func isGestureEnabled() -> Bool {
        return self.swipeUp.enabled
    }
    
    func swiped(gesture: UIGestureRecognizer){
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            
            switch swipeGesture.direction{
                
            case UISwipeGestureRecognizerDirection.Right:
                println("User swiped right...")
                swipedUpGestureHandler()
            case UISwipeGestureRecognizerDirection.Left:
                println("User swiped left...")
                swipedUpGestureHandler()
                
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
            
            //If coin is not rotating, start rotation
            if isGestureEnabled() == true  {
                println("Starting animation with shake")
                swipedUpGestureHandler()
            }
            
        }
    }
    
    func swipedUpGestureHandler(){
        println("Inside swipted handler")
        
        disableAllGestures()
        
        //Rotate 5-10 times
        totalTimesToRotate = 5 + Int(arc4random_uniform(5))
        
        println("Rotating \(totalTimesToRotate) times")
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("tossItUp"), userInfo:nil, repeats:true)
        
    }
    
    func randomProbabilityOfHead() -> Int {
        var i = Int(arc4random_uniform(10))
        return i
    }
    
    func tossItUp(){
        
        println("Inside...tossitup")
        println("Counter = \(counter)")
        
        counter++
        if counter == 73 {
            counter = 1
            currentNumberOfRotations++
            
            if currentNumberOfRotations == totalTimesToRotate{
               invalidateTimerAndSetFinalImage()
            }
        }else{
            let frame = UIImage(named: "\(counter).png")
            imageView.image = frame
        }
        

    }
    
    func stopToss(){
        invalidateTimerAndSetFinalImage()
    }
    
    func invalidateTimerAndSetFinalImage() {
        println("Invalidating timer")
        timer.invalidate()
        
        currentNumberOfRotations = 0;
        
        var finalImageNum:Int = 1;
        
        probabilityOfHead =  randomProbabilityOfHead()
        println("Probability of Head is \(probabilityOfHead)")
        
        if probabilityOfHead > 4 {
            finalImageNum = 36;
        }
        
        println("Setting \(finalImageNum) as the final image")
        
        let frame = UIImage(named: "\(finalImageNum).png")
        imageView.image = frame
        
        //After setting final result image, enable gestures
        enableAllGestures()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

