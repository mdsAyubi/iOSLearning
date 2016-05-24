//
//  GameScene.swift
//  Dodge the Skips
//
//  Created by ayubi on 22/05/16.
//  Copyright (c) 2016 Athvillar. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    var hero:Hero!
    var touchLocation = CGFloat()
    var gameOver = false
    var badGuys = [BadGuy]()
    var endOfScreenRight:CGFloat!
    var endOfScreenLeft:CGFloat!
    
    var refresh = SKSpriteNode(imageNamed: "refresh")
    
    var scoreLabel:SKLabelNode!
    var score = 0
    
    var timer = NSTimer()
    var countDownText = SKLabelNode(text: "5")
    var countDown = 5
    
    enum ColliderType:UInt32{
        case Hero = 1
        case BadGuy = 2
    }
    
    
    override func didMoveToView(view: SKView) {
        self.physicsWorld.contactDelegate = self
        endOfScreenLeft = self.size.width/2 * CGFloat(-1)
        endOfScreenRight = self.size.width/2
        
        addBG()
        //addJeff()
        addBadGuys()
        addJeff()
        
        scoreLabel = SKLabelNode(text: "0")
        scoreLabel.position.y = self.size.height/4
        scoreLabel.zPosition = 2
        addChild(scoreLabel)
        addChild(refresh)
        addChild(countDownText)
        countDownText.hidden = true
        countDownText.zPosition = 4
        refresh.name = "refresh"
        refresh.zPosition = 3
        refresh.hidden = true

    }
    
    func reloadGame(){
        countDownText.hidden = false
        hero.guy.position.y = 0
        hero.guy.position.x = 0
        score = 0
        scoreLabel.text = "0"
        refresh.hidden = true
        
        for badGuy in badGuys {
            resetBadGuy(badGuy.guy, yPos: badGuy.yPos)
        }
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(GameScene.updateTimer), userInfo: nil, repeats: true)
        
    }
    
    func updateTimer(){
        if countDown > 0 {
            countDown -= 1
            countDownText.text = String(countDown)
        } else{
            countDown = 5
            countDownText.text = String(countDown)
            countDownText.hidden = true
            gameOver = false
            timer.invalidate()
        }
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        hero.emit = true
        gameOver = true
        print("Game over....")
        refresh.hidden = false
    }
    
    func addBG(){
        let bg = SKSpriteNode(imageNamed: "bg")
        bg.zPosition = 0;
        addChild(bg)
        
    }
    
    func addJeff(){
        let jeff = SKSpriteNode(imageNamed: "jeff")
        jeff.zPosition = 1;
        jeff.physicsBody = SKPhysicsBody(circleOfRadius: jeff.size.width/2)
        jeff.physicsBody?.affectedByGravity = false
        jeff.physicsBody?.categoryBitMask = ColliderType.Hero.rawValue
        jeff.physicsBody?.contactTestBitMask = ColliderType.BadGuy.rawValue
        jeff.physicsBody?.collisionBitMask = ColliderType.BadGuy.rawValue
        
        let heroParticle = SKEmitterNode(fileNamed: "HitParticle.sks")
        heroParticle?.hidden = true
        
        hero = Hero(guy: jeff,particles: heroParticle!)
        jeff.addChild(heroParticle!)
        addChild(jeff)
        
    }
    
    func addBadGuys(){
        
        addBadGuy("natasha", speed: 1.0, yPos: CGFloat(self.size.height/4))
        addBadGuy("boris", speed: 2.0, yPos: CGFloat(0))
        addBadGuy("paul", speed: 3.0, yPos: CGFloat(-self.size.height/4))
        
    }
    
    func addBadGuy(named:String, speed:Float,yPos:CGFloat){
        let badGuyNode = SKSpriteNode(imageNamed: named)
        let badGuy = BadGuy(speed: speed, guy: badGuyNode)
        
        badGuyNode.physicsBody = SKPhysicsBody(circleOfRadius: badGuyNode.size.width/2)
        badGuyNode.physicsBody?.affectedByGravity = false
        badGuyNode.physicsBody?.categoryBitMask = ColliderType.BadGuy.rawValue
        badGuyNode.physicsBody?.contactTestBitMask = ColliderType.Hero.rawValue
        badGuyNode.physicsBody?.collisionBitMask = ColliderType.Hero.rawValue
        
        badGuyNode.zPosition = 1
        badGuys.append(badGuy)
        resetBadGuy(badGuyNode,yPos: yPos)
        badGuy.yPos = badGuyNode.position.y
        addChild(badGuyNode)
        
    }
    
    func resetBadGuy(badGuyNode:SKSpriteNode, yPos:CGFloat){
        badGuyNode.position.x = endOfScreenRight;
        badGuyNode.position.y = yPos
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            if(!gameOver){
                touchLocation = (touch.locationInView(self.view!).y * -1)+self.size.height/2;
            } else {
                let location = touch.locationInNode(self)
                let sprites = nodesAtPoint(location)
                for sprite in sprites {
                    if sprite is SKSpriteNode {
                        if sprite.name == "refresh" {
                            reloadGame()
                        }
                    }
                }
                
            }
            
        }
        
        let moveAction = SKAction.moveToY(touchLocation, duration: 0.5)
        moveAction.timingMode = SKActionTimingMode.EaseOut
        
        hero.guy.runAction(moveAction){
            //nothing...
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        if(!gameOver){
            updateBadGuysPosition()
        }
        updateHeroEmitter()
    }
    
    func updateHeroEmitter() {
        if hero.emit && hero.emitFrameCount<hero.maxEmitFrameCount {
            hero.emitFrameCount += 1
            hero.particles.hidden = false
        }else{
            hero.emit = false
            hero.particles.hidden = true
            hero.emitFrameCount = 0
            
        }
    }
    
    func updateBadGuysPosition() {
        for badGuy in badGuys {
            if !badGuy.moving {
                badGuy.currentFrame += 1
                if badGuy.currentFrame > badGuy.randomFrame {
                    badGuy.moving = true
                }
            } else {
                badGuy.guy.position.y = CGFloat(Double(badGuy.guy.position.y) + sin(badGuy.angle) * badGuy.range)
                badGuy.angle += hero.speed
                if badGuy.guy.position.x > endOfScreenLeft {
                    badGuy.guy.position.x -= CGFloat(badGuy.speed)
                } else {
                    badGuy.guy.position.x = endOfScreenRight
                    badGuy.currentFrame = 0
                    badGuy.setRandomFrame()
                    badGuy.moving = false
                    badGuy.range += 0.1
                    updateScore()
                }
            }
        }
    }
    
    func updateScore(){
        score += 1
        scoreLabel.text = String(score)
    }

}
