//
//  LongestSubstringTests.swift
//  AlgorithmsTests
//
//  Created by Josephine Humphreys on 11/28/19.
//  Copyright © 2019 Jhoom. All rights reserved.
//

import XCTest
@testable import Algorithms



class LongestSubstringTests: XCTestCase {

    func testLongestSubstringReturnsTheLongestSubstring() {
        var firstWord: String!
        var secondWord: String!
        XCTContext.runActivity(named: "GIVEN two strings") { _ in
            firstWord = "hish"
            secondWord = "fish"
        }
        
        var commonSubstring: String!
        XCTContext.runActivity(named: "WHEN I search for longestCommonSubstring") { _ in
            commonSubstring = DynamicProgramming.longestSubstring(firstWord: firstWord, secondWord: secondWord)
        }
        
        XCTContext.runActivity(named: "THEN I get the longest substring") { _ in
            XCTAssertEqual(commonSubstring, "ish")
        }
    }
    
    func testLongestSubstringReturnsTheLongestSubstringAgain() {
        var firstWord: String!
        var secondWord: String!
        XCTContext.runActivity(named: "GIVEN two strings") { _ in
            firstWord = "hish"
            secondWord = "vista"
        }
        
        var commonSubstring: String!
        XCTContext.runActivity(named: "WHEN I search for longestCommonSubstring") { _ in
            commonSubstring = DynamicProgramming.longestSubstring(firstWord: firstWord, secondWord: secondWord)
        }
        
        XCTContext.runActivity(named: "THEN I get the longest substring") { _ in
            XCTAssertEqual(commonSubstring, "is")
        }
    }
    
    func testExercise9_3() {
        var firstWord: String!
        var secondWord: String!
        XCTContext.runActivity(named: "GIVEN two strings") { _ in
            firstWord = "blue"
            secondWord = "clues"
        }
        
        var commonSubstring: String!
        XCTContext.runActivity(named: "WHEN I search for longestCommonSubstring") { _ in
            commonSubstring = DynamicProgramming.longestSubstring(firstWord: firstWord, secondWord: secondWord)
        }
        
        XCTContext.runActivity(named: "THEN I get the longest substring") { _ in
            XCTAssertEqual(commonSubstring, "lue")
        }
    }

  

}
