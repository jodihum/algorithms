//
//  BinarySearchTests.swift
//  AlgorithmsTests
//
//  Created by Josephine Humphreys on 09/08/2018.
//  Copyright © 2018 Jhoom. All rights reserved.
//

import XCTest
@testable import Algorithms

class BinarySearchTests: XCTestCase {
    
    //MARK: integers
    
    func testBinarySearchFindsInteger() {
        var integerArray:[Int] = []
        var selectedItem:Int?
        XCTContext.runActivity(named: "GIVEN an array of integers and a selected item") { _ in
            integerArray = [1,2,4,5,6,8,23,67,455,555,556]
            selectedItem = 67
        }
        
        var returnedIndex:Int?
        XCTContext.runActivity(named: "WHEN i use binary search to find the item") { _ in
            returnedIndex = SearchAlgorithms.binarySearch(inputArray: integerArray, selectedItem: selectedItem!)
        }
        
        XCTContext.runActivity(named: "THEN the correct index is returned") { _ in
            XCTAssertEqual(returnedIndex!, 7, "Expected index 7, not /(returnedIndex!)")
        }
    }
    
    func testBinarySearchFindsIntegerAtStartOfArray() {
        var integerArray:[Int] = []
        var selectedItem:Int?
        XCTContext.runActivity(named: "GIVEN an array of integers and a selected item") { _ in
            integerArray = [1,2,4,5,6,8,23,67,455,555,556]
            selectedItem = 1
        }
        
        var returnedIndex:Int?
        XCTContext.runActivity(named: "WHEN i use binary search to find the item") { _ in
            returnedIndex = SearchAlgorithms.binarySearch(inputArray: integerArray, selectedItem: selectedItem!)
        }
        
        XCTContext.runActivity(named: "THEN the correct index is returned") { _ in
            XCTAssertEqual(returnedIndex!, 0, "Expected index 0, not /(returnedIndex!)")
        }
    }
    
    func testBinarySearchFindsIntegerAtEndOfArray() {
        var integerArray:[Int] = []
        var selectedItem:Int?
        XCTContext.runActivity(named: "GIVEN an array of integers and a selected item") { _ in
            integerArray = [1,2,4,5,6,8,23,67,455,555,556]
            selectedItem = 556
        }
        
        var returnedIndex:Int?
        XCTContext.runActivity(named: "WHEN i use binary search to find the item") { _ in
            returnedIndex = SearchAlgorithms.binarySearch(inputArray: integerArray, selectedItem: selectedItem!)
        }
        
        XCTContext.runActivity(named: "THEN the correct index is returned") { _ in
            XCTAssertEqual(returnedIndex!, 10, "Expected index 10, not /(returnedIndex!)")
        }
    }
    
    func testBinaryDoesNotFindValueThatIsNotInArray() {
        var integerArray:[Int] = []
        var selectedItem:Int?
        XCTContext.runActivity(named: "GIVEN an array of integers and a selected item") { _ in
            integerArray = [1,2,4,5,6,8,23,67,455,555,556]
            selectedItem = 66
        }
        
        var returnedIndex:Int?
        XCTContext.runActivity(named: "WHEN i use binary search to find the item") { _ in
            returnedIndex = SearchAlgorithms.binarySearch(inputArray: integerArray, selectedItem: selectedItem!)
        }
        
        XCTContext.runActivity(named: "THEN the correct index is returned") { _ in
            XCTAssertNil(returnedIndex, "Expected nil, not /(returnedIndex!)")
        }
    }
    
    func testBinarySearchReturnsMinusOneIfUnsortedArray() {
        var integerArray:[Int] = []
        var selectedItem:Int?
        XCTContext.runActivity(named: "GIVEN an array of integers and a selected item") { _ in
            integerArray = [1,2,5,4,6,8,23,67,455,555,556]
            selectedItem = 67
        }
        
        var returnedIndex:Int?
        XCTContext.runActivity(named: "WHEN i use binary search to find the item") { _ in
            returnedIndex = SearchAlgorithms.binarySearch(inputArray: integerArray, selectedItem: selectedItem!)
        }
        
        XCTContext.runActivity(named: "THEN the correct index is returned") { _ in
             XCTAssertEqual(returnedIndex!, -1, "Expected index -1, not /(returnedIndex!)")
        }
    }
    
    //MARK: strings
    func testBinarySearchFindsString() {
        var stringArray:[String] = []
        var selectedItem:String?
        XCTContext.runActivity(named: "GIVEN an array of integers and a selected item") { _ in
            stringArray = ["Ann", "Bob", "Carmen","Helen", "Jodi", "Kunal", "Zoe"]
            selectedItem = "Kunal"
        }
        
        var returnedIndex:Int?
        XCTContext.runActivity(named: "WHEN i use binary search to find the item") { _ in
            returnedIndex = SearchAlgorithms.binarySearch(inputArray: stringArray, selectedItem: selectedItem!)
        }
        
        XCTContext.runActivity(named: "THEN the correct index is returned") { _ in
            XCTAssertEqual(returnedIndex!, 5, "Expected index 5, not /(returnedIndex!)")
        }
    }
    
    //MARK: Doubles
    func testBinarySearchFindsDouble() {
        var doubleArray:[Double] = []
        var selectedItem:Double?
        XCTContext.runActivity(named: "GIVEN an array of integers and a selected item") { _ in
            doubleArray = [1.3,2.343,4.32,5.542,6.42,8.442,23.322,67.43,455.16,555.84,556.653]
            selectedItem = 67.43
        }
        
        var returnedIndex:Int?
        XCTContext.runActivity(named: "WHEN i use binary search to find the item") { _ in
            returnedIndex = SearchAlgorithms.binarySearch(inputArray: doubleArray, selectedItem: selectedItem!)
        }
        
        XCTContext.runActivity(named: "THEN the correct index is returned") { _ in
            XCTAssertEqual(returnedIndex!, 7, "Expected index 7, not /(returnedIndex!)")
        }
    }
    
}
