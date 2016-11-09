//
//  ViewController.swift
//  SwiftCalculator
//
//  Created by Austins Work on 11/5/16.
//  Copyright © 2016 AustinWhitleyWork. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var displayLabel: UILabel!
    

    var inputingNumber : Bool = false
    var firstNumber : Int = 0
    var secondNumber : Int = 0
    var brain = CalculatorBrain()
    @IBAction func touchDigit(_ sender: AnyObject) {
        let digit = sender.currentTitle!
        if inputingNumber{
            let textDisplay = displayLabel!.text
            displayLabel!.text = textDisplay! + digit!
        }else{
            displayLabel!.text = digit
        }
        inputingNumber = true
    }
    var displayValue : Double {
        get{
            return Double(displayLabel.text!)!
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    @IBAction func preformOperation(_ sender: AnyObject) {
        if inputingNumber{
            brain.setOperand(operand: displayValue)
            inputingNumber = false

        }
        if let mathematicalSymbol = sender.currentTitle{
            brain.performOperation(symbol: mathematicalSymbol!)
        }
        displayValue = brain.result
    }

    


}
