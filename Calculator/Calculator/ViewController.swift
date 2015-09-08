//
//  ViewController.swift
//  Calculator
//
//  Created by ayubi on 08/09/15.
//  Copyright (c) 2015 Athvillar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var display: UILabel! //Implicitly unwrapped optional, set very early and remains set
    
    var userIsInTheMiddleOfTypingANumber:Bool = false
    

    @IBAction func appendDigit(sender: UIButton) {
        
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTypingANumber == true {
        display.text = display.text! + digit
        }else{
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
        
        
    }

    @IBAction func operate(sender: UIButton) {
        
        let operation = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            enter()
        }
        switch operation {
        case "✖️":performOperation {$0 * $1}
            
        case "➗": performOperation {$1 / $0}
        case "➕": performOperation {$0 + $1}
        case "➖": performOperation {$1 - $0}
        case "✔️": performSingleOperation { sqrt($0) }
            
        default: break
        }
    }
    
    func performOperation(operation:(Double,Double)->Double){
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(),operandStack.removeLast())
            enter()
        }
    }
    
    func performSingleOperation(operation:Double->Double){
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }

    func multiply(op1:Double,op2:Double)->Double{
        return op1*op2;
    }

    
    var operandStack = Array<Double>()
    @IBAction func enter() {
        
        userIsInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
        println("operandStack = \(operandStack)")
        
        
    }
    
    var displayValue:Double{
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }

}

