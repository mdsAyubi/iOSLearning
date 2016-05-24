//
//  Hero.swift
//  Dodge the Skips
//
//  Created by ayubi on 22/05/16.
//  Copyright © 2016 Athvillar. All rights reserved.
//

import Foundation
import SpriteKit

class Hero {
    var guy:SKSpriteNode
    var speed = 0.1
    var emit = false
    var emitFrameCount = 0
    var maxEmitFrameCount = 30
    var particles:SKEmitterNode
    
    init(guy:SKSpriteNode, particles:SKEmitterNode){
        self.guy = guy
        self.particles = particles
    }
}