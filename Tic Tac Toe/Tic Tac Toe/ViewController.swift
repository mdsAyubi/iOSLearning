//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by ayubi on 15/03/15.
//  Copyright (c) 2015 Gazelle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var goNumber = 1
    var gameState = [0,0,0,0,0,0,0,0,0]
    
    let winningCombination = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var winner = 0
    
    @IBOutlet weak var button0: UIButton!

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var playAgain: UIButton!
    
    @IBAction func playAgainPressed(sender: AnyObject) {
        goNumber = 1
        gameState = [0,0,0,0,0,0,0,0,0]
        winner = 0
        
        label.center = CGPointMake(label.center.x - 400, label.center.y)
        playAgain.alpha = 0
        
        var button:UIButton
        
        for var i=0; i<9 ; i++ {
            button = view.viewWithTag(i) as UIButton
            button.setImage(nil, forState: .Normal)
        }
        
    }
    @IBAction func buttonPressed(sender: AnyObject) {
        
        println(sender.tag)
        
        if gameState[sender.tag] == 0 && winner == 0{
            var imageName = "cross.png"
        
            if (goNumber % 2) == 0{
                imageName = "cross.png"
                gameState[sender.tag] = 2
            }else{
                imageName = "nought.png"
                gameState[sender.tag] = 1
            }
            
            for combination in winningCombination{
                
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                    winner = gameState[combination[0]]
                }
                
            }
            
            if winner != 0 {
                //println("We have a winner...")
                
                if winner == 1 {
                    label.text = "Noughts Win!!!"
                }
                else{
                    label.text = "Crosses Win!!!"
                }
                
                UIView.animateWithDuration(2, animations: {
                    self.label.center = CGPointMake(self.label.center.x + 400, self.label.center.y)
                    self.playAgain.alpha = 1
                })
            }
            
            goNumber++
            //println("Working...")
            var image = UIImage(named: imageName)
            sender.setImage(image, forState: .Normal)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        label.center = CGPointMake(label.center.x - 400, label.center.y)
        playAgain.alpha = 0
    }


}

