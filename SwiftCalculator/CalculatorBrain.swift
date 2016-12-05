//
//  CalculatorBrain.swift
//  SwiftCalculator
//
//  Created by Austins Work on 11/7/16.
//  Copyright © 2016 AustinWhitleyWork. All rights reserved.
//

import Foundation
enum Optional<T>{
    case None
    case Some(T)
}

func multiply(op1: Double, op2: Double) -> Double{
    return op1 * op2
}
func add(op1: Double, op2: Double) -> Double {
    return op1 + op2
}
func subtract(op1: Double, op2: Double) -> Double {
    return op1 - op2
}
func divide(op1: Double, op2: Double) -> Double {
    return op1/op2
}
class CalculatorBrain{
    
    var accumulator : Double = 0.0
    func setOperand(operand : Double){
        accumulator = operand
    }
    var operations : Dictionary<String,Operation> = [
        "*" : .BinaryOperation(multiply),
        "/" : .BinaryOperation(divide),
        "+" : .BinaryOperation(add),
        "-" : .BinaryOperation(subtract),
        "=" : .Equal,
        "AC" : .AC
    ]
    enum Operation{
        case BinaryOperation((Double,Double) -> Double)
        case Equal
        case AC
    }
    func performOperation(symbol: String){
        if let operation = operations[symbol]{
            switch operation {
            case .BinaryOperation(let function) : binary = BinaryOperation(binaryFunction: function, firstOperand: accumulator)
            case .Equal :
                if binary != nil{
                    accumulator = binary!.binaryFunction(binary!.firstOperand, accumulator)
                    binary = nil
                }
            case .AC :
                accumulator = 0
            }
        }
        
    }
    var binary : BinaryOperation?
    struct BinaryOperation {
        var binaryFunction : (Double, Double) -> Double
        var firstOperand : Double
    }
    var result: Double {
        get{
            return accumulator
        }
    }
}
