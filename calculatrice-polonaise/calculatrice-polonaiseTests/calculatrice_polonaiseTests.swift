//
//  calculatrice_polonaiseTests.swift
//  calculatrice-polonaiseTests
//
//  Created by Guillaume Hostache on 01/10/2024.
//

import XCTest
@testable import calculatrice_polonaise

final class calculatrice_polonaiseTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        let stackRPNtest = StackRPN()
        stackRPNtest.push(aNumber: 62)
        stackRPNtest.push(aNumber: 45)
        print(stackRPNtest.toString() ?? "1")
        stackRPNtest.clear()
        XCTAssert(stackRPNtest.myArray.count == 0)
        
        stackRPNtest.push(aNumber: 12)
        stackRPNtest.push(aNumber: 24)
        print(stackRPNtest.toString() ?? "3")
        print(stackRPNtest.pop() ?? 85)
        print(stackRPNtest.toString() ?? "4")
        stackRPNtest.push(aNumber: 34)
        stackRPNtest.push(aNumber: 42)
        stackRPNtest.push(aNumber: 51)
        var result : NSNumber? = stackRPNtest.getElementWith(aShift: 0)
        print(stackRPNtest.toString() ?? "5")
        print("décalage de 0 : \(result!)")
        result = stackRPNtest.getElementWith(aShift: 2)
        print(stackRPNtest.toString() ?? "6")
        print("décalage de 2 : \(result!)")
    
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}