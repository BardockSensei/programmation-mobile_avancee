//
//  StackRPN.swift
//  calculatrice-polonaise
//
//  Created by Guillaume Hostache on 01/10/2024.
//

import Foundation

class StackRPN {
    var myArray :[NSNumber] = []
    
    func push(aNumber: NSNumber) {
        self.myArray.append(aNumber)
    }
    
    func pop() -> NSNumber? {
        let lastElement = self.myArray.last
        self.myArray.removeLast()
        return lastElement
    }
    
    
    func clear() {
        myArray.removeAll()
    }
    
    /*func getElementWith(aShift: Int) -> NSNumber {
        return self.myArray.
    }*/
    
}
