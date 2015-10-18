//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by ayubi on 10/09/15.
//  Copyright (c) 2015 Athvillar. All rights reserved.
//

import Foundation


class CalculatorBrain {
    private var opStack = [Op]()
    private var knownOp = [String:Op]()
    
    private enum Op:Printable {
        case Operand(Double)
        case UnaryOperator(String,(Double -> Double))
        case BinaryOperator(String,(Double,Double) -> Double)
        
        var description:String{
            get{
                switch self{
                case .Operand(let operand): return "\(operand)"
                case .UnaryOperator(let symbol, _): return symbol
                    
                
                case .BinaryOperator(let symbol,_): return symbol
                }
            }
        }
    }
    
    init(){
        knownOp["✖️"] = Op.BinaryOperator("✖️",*)
        knownOp["➗"] = Op.BinaryOperator("➗"){$1 / $0}
        knownOp["➕"] = Op.BinaryOperator("➕",+)
        knownOp["➖"] = Op.BinaryOperator("➖"){$1 - $0}
        knownOp["✔️"] = Op.UnaryOperator("✔️",sqrt)
        
    }
    
    typealias PropertyList = AnyObject
    
    var program:PropertyList { //guranteed to be a PropertyList
        get{
            return opStack.map{$0.description}
        }
        set{
            if let opSymbols = newValue as? Array<String>{
                var newOPsStack = [Op]()
                for opSymbol in opSymbols {
                    if let op = knownOp[opSymbol] {
                        newOPsStack.append(op)
                    }else if let operand = NSNumberFormatter().numberFromString(opSymbol)?.doubleValue {
                        newOPsStack.append(.Operand(operand))
                    }
                }
                opStack = newOPsStack
            }
            
        }
    }
    
    private func evaluate(ops:[Op]) ->(result:Double?, remainingOps:[Op]) {
        
        if(!ops.isEmpty){
            var remainingOps = ops
            let op = remainingOps.removeLast()
            
            switch op {
            case .Operand(let operand): return (operand,remainingOps)
            case .UnaryOperator(_, let operation):
                let operandEvaluation = evaluate(remainingOps)
                if let operand = operandEvaluation.result{
                    return (operation(operand),remainingOps)
                }
            case .BinaryOperator(_, let operation):
                let firstOperandEvaluation = evaluate(remainingOps)
                if let op1 = firstOperandEvaluation.result {
                    let secondOperandEvaluation = evaluate(firstOperandEvaluation.remainingOps)
                    if let op2 = secondOperandEvaluation.result{
                        return (operation(op1,op2),secondOperandEvaluation.remainingOps)
                    }
                }
                
            }
            
        }
        return (nil,ops)
    }
    
    func evaluate() ->Double? {
        let (result,remainder) = evaluate(opStack)
        println("\(opStack) = \(result) with remainder \(remainder)")
        return result
    }
    
    func pushOperand(operand:Double) ->Double?{
        opStack.append(Op.Operand(operand))
        return evaluate()
    }
    
    func performOperation(symbol:String)->Double?{
        
        if let operation = knownOp[symbol]{
            opStack.append(operation) 
        }
        return evaluate()
        
    }
}