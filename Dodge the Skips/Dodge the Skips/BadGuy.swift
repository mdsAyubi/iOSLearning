//
//  BadGuy.swift
//  Dodge the Skips
//
//  Created by ayubi on 22/05/16.
//  Copyright © 2016 Athvillar. All rights reserved.
//

import Foundation
import SpriteKit

class BadGuy{
    var speed:Float = 0.0
    var guy:SKSpriteNode
    var currentFrame = 0
    var randomFrame = 0
    var moving = false
    var angle = 0.0
    var range = 2.0
    var yPos = CGFloat()
    
    
    init(speed:Float, guy:SKSpriteNode){
        self.speed = speed
        self.guy = guy
        self.setRandomFrame()
    }
    
    func setRandomFrame(){
        let range = UInt32(50)..<UInt32(200)
        self.randomFrame = Int(range.startIndex + arc4random_uniform(range.endIndex - range.startIndex+1 ))
        
        
    }
}
