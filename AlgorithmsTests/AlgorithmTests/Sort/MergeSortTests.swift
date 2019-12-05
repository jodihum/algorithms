//
//  MergeSortTests.swift
//  AlgorithmsTests
//
//  Created by Josephine Humphreys on 11/21/19.
//  Copyright © 2019 Jhoom. All rights reserved.
//

import XCTest
@testable import Algorithms

class MergeSortTests: XCTestCase {

        func testSortsIntegerArray() {
        
        var array:[Int] = []
        
        XCTContext.runActivity(named: "GIVEN an array of integers") { _ in
            array = [5,3,8,2,9,63,42,1,0]
        }
        
        var sortedArray:[Int] = []
        XCTContext.runActivity(named: "WHEN i run selected search") { _ in
            sortedArray = SortAlgorithms.mergeSort(array:array)
        }
        
        XCTContext.runActivity(named: "THEN array should be sorted") { _ in
            XCTAssertEqual(sortedArray, [0,1,2,3,5,8,9,42,63], "array should be sorted")
        }
    }
    
    func testSortsIntegerArrayWithDuplicates() {
        var array:[Int] = []
        
        XCTContext.runActivity(named: "GIVEN an array of integers with some duplicates") { _ in
            array = [5,3,5,2,5,63,42,3,0]
        }
        
        var sortedArray:[Int] = []
        XCTContext.runActivity(named: "WHEN i run selected search") { _ in
            sortedArray = SortAlgorithms.mergeSort(array:array)
        }
        
        XCTContext.runActivity(named: "THEN array should be sorted") { _ in
            XCTAssertEqual(sortedArray, [0,2,3,3,5,5,5,42,63], "array should be sorted")
        }
    }
    
    func testHandlesArrayOfSize1() {
        var array:[Int] = []
        
        XCTContext.runActivity(named: "GIVEN an array of only one integer") { _ in
            array = [5]
        }
        
        var sortedArray:[Int] = []
        XCTContext.runActivity(named: "WHEN i run selected search") { _ in
            sortedArray = SortAlgorithms.mergeSort(array:array)
        }
        
        XCTContext.runActivity(named: "THEN array should be sorted") { _ in
            XCTAssertEqual(sortedArray, [5], "array should be sorted")
        }
    }
    
    func testSortsStringArray() {
        var array:[String] = []
        
        XCTContext.runActivity(named: "GIVEN an array of strings") { _ in
            array = ["Kunal","Jodi","Ricardo","Kerstin",]
        }
        
        var sortedArray:[String] = []
        XCTContext.runActivity(named: "WHEN i run selected search") { _ in
            sortedArray = SortAlgorithms.mergeSort(array:array)
        }
        
        XCTContext.runActivity(named: "THEN array should be sorted") { _ in
            XCTAssertEqual(sortedArray, ["Jodi","Kerstin","Kunal","Ricardo"], "array should be sorted")
        }
    }
    
    func testSortsFloatArray() {
        
        var array:[Float] = []
        
        XCTContext.runActivity(named: "GIVEN an array of floats ") { _ in
            array = [5.2,3.5,5.6,5.9,3.7,0]
        }
        
        var sortedArray:[Float] = []
        XCTContext.runActivity(named: "WHEN i run selected search") { _ in
            sortedArray = SortAlgorithms.mergeSort(array:array)
        }
        
        XCTContext.runActivity(named: "THEN array should be sorted") { _ in
            XCTAssertEqual(sortedArray, [0,3.5,3.7,5.2,5.6,5.9], "array should be sorted")
        }
        
    }

}
