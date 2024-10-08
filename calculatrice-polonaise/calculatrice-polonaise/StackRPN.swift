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
    
    func getElementWith(aShift: Int) -> NSNumber? {
        if (aShift < self.myArray.count) {
            return self.myArray[self.myArray.count - 1 - aShift]
        } else {
            return nil
        }
    }
    
    func toString() -> String! {
        var result :String = "StackRPN: "
        
        if (self.myArray.count != 0) {
            for i in (0...self.myArray.count-1){
                result.append("[i:\(i) - \(self.myArray[i])]")
            }
        }
        
        return result
    }
    
    
}