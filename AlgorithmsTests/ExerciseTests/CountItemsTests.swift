//
//  CountItemsTests.swift
//  AlgorithmsTests
//
//  Created by Josephine Humphreys on 14/08/2018.
//  Copyright © 2018 Jhoom. All rights reserved.
//

import XCTest
@testable import Algorithms

class CountItemsTests: XCTestCase {

    
    func testCountInts() {
        
        var array:[Int] = []
        XCTContext.runActivity(named:"GIVEN an integer array") { _ in
            array = [2,4,2,6,2,1,4]
        }
        
        var countOfItems:Int?
        XCTContext.runActivity(named:"WHEN I count the number of items") { _ in
            countOfItems = Chapter4.countItems(array:array)
        }
        
        XCTContext.runActivity(named:"THEN the number of items should be correct") { _ in
            XCTAssertEqual(countOfItems!, 7, "Should be 7 items in array")
        }
    }
    
    func testCountStrings() {
        
        var array:[String] = []
        XCTContext.runActivity(named:"GIVEN a string array") { _ in
            array = ["limes","bananas","mangoes","guanabanas"]
        }
        
        var countOfItems:Int?
        XCTContext.runActivity(named:"WHEN I count the number of items") { _ in
            countOfItems = Chapter4.countItems(array:array)
        }
        
        XCTContext.runActivity(named:"THEN the number of items should be correct") { _ in
            XCTAssertEqual(countOfItems!, 4, "Should be 4 items in array")
        }
    }
    
  
    
}
