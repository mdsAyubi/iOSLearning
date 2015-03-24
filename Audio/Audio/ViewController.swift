//
//  ViewController.swift
//  Audio
//
//  Created by ayubi on 23/03/15.
//  Copyright (c) 2015 Gazelle. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player:AVAudioPlayer = AVAudioPlayer()

    @IBAction func play(sender: AnyObject) {
        
        var audioPath = NSBundle.mainBundle().pathForResource("bach1", ofType: "mp3")!
        var error:NSError? =nil
        
        player = AVAudioPlayer(contentsOfURL: NSURL(string: audioPath), error: &error)
        
        if error == nil {
            player.play()
        }else{
            println(error)
        }
        
    }
    @IBAction func pause(sender: AnyObject) {
        
        player.pause()
    }
    
    
    @IBOutlet weak var slder: UISlider!
    
    @IBAction func sliderMoved(sender: AnyObject) {
        
        player.volume = slder.value;
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

