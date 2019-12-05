//
//  MaxValueTests.swift
//  AlgorithmsTests
//
//  Created by Josephine Humphreys on 14/08/2018.
//  Copyright © 2018 Jhoom. All rights reserved.
//

import XCTest
@testable import Algorithms

class MaxValueTests: XCTestCase {
    
    
    func testMaxInteger() {
        
        var array:[Int] = []
        XCTContext.runActivity(named: "GIVEN an array of integers") { _ in
             array = [5,3,8,2,9,63,42,1,0]
        }
        
        var maxValue:Int?
        XCTContext.runActivity(named: "WHEN I search for the maximum value") { _ in
            maxValue = Chapter4.maxValue(array:array)
        }
        
        XCTContext.runActivity(named: "THEN i find the largest integer") { _ in
            XCTAssertEqual(maxValue, 63, "The maximum value should be 63")
        }
    }
    
    func testReturnsNilForEmptyArray() {
        
        var array:[Int] = []
        XCTContext.runActivity(named: "GIVEN an empty array") { _ in
            array = []
        }
        
        var maxValue:Int?
        XCTContext.runActivity(named: "WHEN I search for the maximum value") { _ in
            maxValue = Chapter4.maxValue(array:array)
        }
        
        XCTContext.runActivity(named: "THEN i get nil") { _ in
            XCTAssertNil(maxValue)
        }
    }
    
    func testMaxString() {
        
        var array:[String] = []
        XCTContext.runActivity(named: "GIVEN and array of strings") { _ in
            array = ["turtle", "llama", "turtles"]
        }
        
        var maxValue:String?
        XCTContext.runActivity(named: "WHEN I search for the maximum value") { _ in
            maxValue = Chapter4.maxValue(array:array)
        }
        
        XCTContext.runActivity(named: "THEN i find the last string alphabetically") { _ in
            XCTAssertTrue(maxValue == "turtles")
        }
    }

    
}
