//
//  SumTests.swift
//  AlgorithmsTests
//
//  Created by Josephine Humphreys on 13/08/2018.
//  Copyright © 2018 Jhoom. All rights reserved.
//

import XCTest
@testable import Algorithms

class SumTests: XCTestCase {
    

    func testSum() {
        var array:[Int] = []
        XCTContext.runActivity(named: "GIVEN an integer array") { _ in
            array = [1,2,5,6,8]
        }
        
        var sum:Int?
        XCTContext.runActivity(named: "WHEN I sum over the array") { _ in
            sum = Chapter4.sum(array: array)
        }
        
        XCTContext.runActivity(named: "THEN I should get the correct total") { _ in
            XCTAssertEqual(sum!, 22, "Sum of array should be 22")
        }
    }
    
    func testSumForArrayOfSizeOne() {
        var array:[Int] = []
        XCTContext.runActivity(named: "GIVEN an integer array") { _ in
            array = [4]
        }
        
        var sum:Int?
        XCTContext.runActivity(named: "WHEN I sum over the array") { _ in
            sum = Chapter4.sum(array: array)
        }
        
        XCTContext.runActivity(named: "THEN I should get the correct total") { _ in
            XCTAssertEqual(sum!, 4, "Sum of array should be 4")
        }
    }
    
    func testReturnNilForEmptyArray() {
        var array:[Int] = []
        XCTContext.runActivity(named: "GIVEN an integer array") { _ in
            array = []
        }
        
        var sum:Int?
        XCTContext.runActivity(named: "WHEN I sum over the array") { _ in
            sum = Chapter4.sum(array: array)
        }
        
        XCTContext.runActivity(named: "THEN I should get the correct total") { _ in
            XCTAssertNil(sum)
        }
    }
    
    
}
