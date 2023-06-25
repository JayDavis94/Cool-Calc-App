//
//  ViewController.swift
//  CoolCalc
//
//  Created by JaDarius Davis on 6/9/23.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var resultsLbl: UILabel!
    
    private var currentNumber: String = "0"
    private var previousNumber: Double = 0
    private var performingMath = false
    private var operation = 0
    private var decimalUsed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultsLbl.text = currentNumber
    }
    
    func addNumberToInput(number: Int) {
        if currentNumber == "0" && number != 0 {
            currentNumber = String(number)
        } else if currentNumber != "0" || decimalUsed {
            currentNumber += String(number)
        }
        resultsLbl.text = currentNumber
    }
    
    func addDecimalPoint() {
        if !decimalUsed {
            currentNumber += "."
            decimalUsed = true
        }
        resultsLbl.text = currentNumber
    }
    
    @IBAction func zeroBtn(_ sender: Any) {
        addNumberToInput(number: 0)
    }
    @IBAction func oneBtn(_ sender: Any) {
        addNumberToInput(number: 1)
    }
    @IBAction func twoBtn(_ sender: Any) {
        addNumberToInput(number: 2)
    }
    @IBAction func threeBtn(_ sender: Any) {
        addNumberToInput(number: 3)
    }
    @IBAction func fourBtn(_ sender: Any) {
        addNumberToInput(number: 4)
    }
    @IBAction func fiveBtn(_ sender: Any) {
        addNumberToInput(number: 5)
    }
    @IBAction func sixBtn(_ sender: Any) {
        addNumberToInput(number: 6)
    }
    @IBAction func sevenBtn(_ sender: Any) {
        addNumberToInput(number: 7)
    }
    @IBAction func eightBtn(_ sender: Any) {
        addNumberToInput(number: 8)
    }
    @IBAction func nineBtn(_ sender: Any) {
        addNumberToInput(number: 9)
    }
    @IBAction func decimalBtn(_ sender: Any) {
        addDecimalPoint()
    }
    @IBAction func allClear(_ sender: Any) {
        currentNumber = "0"
        previousNumber = 0
        operation = 0
        performingMath = false
        decimalUsed = false
        resultsLbl.text = currentNumber
    }
    @IBAction func negbtn(_ sender: Any) {
        if let number = Double(currentNumber) {
            currentNumber = String(number * -1)
            resultsLbl.text = currentNumber
        }
    }
    @IBAction func percentBtn(_ sender: Any) {
        if let number = Double(currentNumber) {
            currentNumber = String(number / 100)
            if currentNumber.hasSuffix(".0") {
                currentNumber = String(currentNumber.dropLast(2))
            }
            resultsLbl.text = currentNumber
        }
    }
    @IBAction func divideBtn(_ sender: Any) {
        previousNumber = Double(currentNumber)!
        currentNumber = "0"
        operation = 1
        performingMath = true
        decimalUsed = false
    }
    @IBAction func multiplyBtn(_ sender: Any) {
        previousNumber = Double(currentNumber)!
        currentNumber = "0"
        operation = 2
        performingMath = true
        decimalUsed = false
    }
    @IBAction func minusBtn(_ sender: Any) {
        previousNumber = Double(currentNumber)!
        currentNumber = "0"
        operation = 3
        performingMath = true
        decimalUsed = false
    }
    @IBAction func addBtn(_ sender: Any) {
        previousNumber = Double(currentNumber)!
        currentNumber = "0"
        operation = 4
        performingMath = true
        decimalUsed = false
    }
    @IBAction func equalBtn(_ sender: Any) {
        if operation == 1 {
            currentNumber = String(previousNumber / Double(currentNumber)!)
        } else if operation == 2 {
            currentNumber = String(previousNumber * Double(currentNumber)!)
        } else if operation == 3 {
            currentNumber = String(previousNumber - Double(currentNumber)!)
        } else if operation == 4 {
            currentNumber = String(previousNumber + Double(currentNumber)!)
        }
        // remove trailing .0
        if currentNumber.hasSuffix(".0") {
            currentNumber = String(currentNumber.dropLast(2))
        }
        resultsLbl.text = currentNumber
        operation = 0
        performingMath = false
        decimalUsed = false
    }
}



