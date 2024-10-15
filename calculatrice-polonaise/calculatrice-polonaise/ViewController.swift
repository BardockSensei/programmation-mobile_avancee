//
//  ViewController.swift
//  calculatrice-polonaise
//
//  Created by Guillaume Hostache on 01/10/2024.
//

import UIKit

class ViewController: UIViewController 
{
    @IBOutlet var myInputDisplayLabel: UILabel!
    
    @IBOutlet var firstLine: UILabel!
    
    @IBOutlet var secondLine: UILabel!
    
    @IBOutlet var thirdLine: UILabel!
    
    @IBOutlet var fourthLine: UILabel!
    
    @IBOutlet var fifthLine: UILabel!
    
    @IBOutlet var ErrorDisplayLabel: UILabel!
    
    var myStack :StackRPN = StackRPN()
    
    var myCurrentInput :String = ""
    var hasPoint :Bool = false

    @IBAction func clicSwap(_ sender: Any) {
        print("DEBUG - clicSwap")
        if (myStack.myArray.count >= 2) {
            myStack.myArray.swapAt(0, 1)
        } else {
            ErrorDisplayLabel.text = "swap impossible"
        }
        displayStack()
    }
    
    @IBAction func clicDigit(_ sender: Any) {
        print("DEBUG - clicDigit")
        ErrorDisplayLabel.text = ""
        let button :UIButton = sender as! UIButton;
        myCurrentInput += "\(button.tag)"
        myInputDisplayLabel.text = myCurrentInput
    }
    
    @IBAction func clicEnter(_ sender: Any) {
        print("DEBUG - clicEnter")
        ErrorDisplayLabel.text = ""
        
        hasPoint = false
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 3
        formatter.decimalSeparator = "."
        
        let input :NSNumber? = formatter.number(from: myCurrentInput)
        if (input != nil) {
            myStack.push(aNumber: input!)
        }
        
        displayStack()
        myInputDisplayLabel.text = ""
        myCurrentInput = ""
    }
    
    @IBAction func clicDrop(_ sender: Any) {
        print("DEBUG - clicDrop")
        ErrorDisplayLabel.text = ""
        let _ :NSNumber? = myStack.pop()
        displayStack()
    }
    
    @IBAction func clicDiv(_ sender: Any) {
        print("DEBUG - clicDiv")
        ErrorDisplayLabel.text = ""
        let a :Double? = myStack.pop() as? Double
        let b :Double? = myStack.pop() as? Double
        if ((a != nil) && (b != nil)) {
            if (b != 0) {
                let c :Double = a! / b!
                myStack.push(aNumber: c as NSNumber)
            } else {
                ErrorDisplayLabel.text = "Division par 0 impossible"
            }
        } else {
            ErrorDisplayLabel.text = "Division impossible sans opérateurs"
        }
        displayStack()
    }
    
    @IBAction func clicMul(_ sender: Any) {
        print("DEBUG - clicMul")
        let a :Double? = myStack.pop() as? Double
        let b :Double? = myStack.pop() as? Double
        if ((a != nil) && (b != nil)) {
            let c :Double = a! * b!
            myStack.push(aNumber: c as NSNumber)
        } else {
            ErrorDisplayLabel.text = "Impossible de faire la multiplication"
        }
        displayStack()
    }
    
    @IBAction func clicAdd(_ sender: Any) {
        print("DEBUG - clicAdd")
        let a :Double? = myStack.pop() as? Double
        let b :Double? = myStack.pop() as? Double
        if ((a != nil) && (b != nil)) {
            let c :Double = a! + b!
            myStack.push(aNumber: c as NSNumber)
        } else {
            ErrorDisplayLabel.text = "Impossible de faire l'addition"
        }
        displayStack()
        
    }
    
    @IBAction func clicMinus(_ sender: Any) {
        print("DEBUG - clicMinus")
        let a :Double? = myStack.pop() as? Double
        let b :Double? = myStack.pop() as? Double
        if ((a != nil) && (b != nil)) {
            let c :Double = a! - b!
            myStack.push(aNumber: c as NSNumber)
        } else {
            ErrorDisplayLabel.text = "Impossible de faire la soustraction"
        }
        displayStack()
    }
    
    @IBAction func clicPoint(_ sender: Any) {
        print("DEBUG - clicPoint")
        ErrorDisplayLabel.text = ""
        if (!hasPoint) {
            myCurrentInput += "."
            myInputDisplayLabel.text = myCurrentInput
            hasPoint = true
        }
    }
    
    func displayStack() {
        print("DEBUG - displayStack")
        let first :NSNumber? = myStack.getElementWith(aShift: 0)
        let second :NSNumber? = myStack.getElementWith(aShift: 1)
        let third :NSNumber? = myStack.getElementWith(aShift: 2)
        let fourth :NSNumber? = myStack.getElementWith(aShift: 3)
        let fifth :NSNumber? = myStack.getElementWith(aShift: 4)
        
        let tab1 :[NSNumber?] = [first, second, third, fourth, fifth]
        let tab2 :[UILabel?] = [firstLine, secondLine, thirdLine, fourthLine, fifthLine]
        
        for i in 0..<5 {
            if (tab1[i] != nil) {
                tab2[i]?.text = "\(tab1[i]!)"
            } else {
                tab2[i]?.text = ""
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
