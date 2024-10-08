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
    
    var myStack :StackRPN = StackRPN()
    
    var myCurrentInput :String = ""
    var hasPoint :Bool = false
    let formatter = NumberFormatter()
    
    @IBAction func clicDigit(_ sender: Any) {
        let button :UIButton = sender as! UIButton;
        print("Clique sur la touche \(button.tag)")
        myCurrentInput += "\(button.tag)"
        myInputDisplayLabel.text = myCurrentInput
    }
    
    @IBAction func clicEnter(_ sender: Any) {
        print("Clique sur la touche Enter")
        
        hasPoint = false
        let input :NSNumber = formatter.number(from: myCurrentInput)!
        print(input)
        myStack.push(aNumber: input)
        print(myStack.toString() ?? "0")
        displayStack()
        myInputDisplayLabel.text = ""
        myCurrentInput = ""
    }
    
    @IBAction func clicDrop(_ sender: Any) {
        print("Clique sur la touche Drop")
        myStack.pop()
    }
    
    @IBAction func clicDiv(_ sender: Any) {
        print("Clique sur la touche Division (/)")
        let a :Double? = myStack.pop() as? Double
        let b :Double? = myStack.pop() as? Double
        if ((a != nil) && (b != nil)) {
            if (b != 0) {
                let c :Double = a! / b!
                myStack.push(aNumber: c as NSNumber)
            }
        }
        displayStack()
    }
    
    @IBAction func clicMul(_ sender: Any) {
        print("Clique sur la touche Multiplication (*)")
        let a :Double? = myStack.pop() as? Double
        let b :Double? = myStack.pop() as? Double
        if ((a != nil) && (b != nil)) {
            let c :Double = a! * b!
            myStack.push(aNumber: c as NSNumber)
        }
        displayStack()
    }
    
    @IBAction func clicAdd(_ sender: Any) {
        print("Clique sur la touche Addition (+)")
        let a :Double? = myStack.pop() as? Double
        let b :Double? = myStack.pop() as? Double
        if ((a != nil) && (b != nil)) {
            let c :Double = a! + b!
            myStack.push(aNumber: c as NSNumber)
        }
        displayStack()
        
    }
    
    @IBAction func clicMinus(_ sender: Any) {
        print("Clique sur la touche Soustraction (-)")
        let a :Double? = myStack.pop() as? Double
        let b :Double? = myStack.pop() as? Double
        if ((a != nil) && (b != nil)) {
            let c :Double = a! - b!
            myStack.push(aNumber: c as NSNumber)
        }
        displayStack()
    }
    
    @IBAction func clicPoint(_ sender: Any) {
        print("Clique sur la touche Point (.)")
        if (!hasPoint) {
            myCurrentInput += "."
            myInputDisplayLabel.text = myCurrentInput
            hasPoint = true
        }
    }
    
    func displayStack() {
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
        
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 6
        formatter.decimalSeparator = "."
    }
    
}
