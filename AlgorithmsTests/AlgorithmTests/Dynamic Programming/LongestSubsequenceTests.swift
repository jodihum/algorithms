//
//  LongestSubsequenceTests.swift
//  AlgorithmsTests
//
//  Created by Josephine Humphreys on 11/28/19.
//  Copyright © 2019 Jhoom. All rights reserved.
//

import XCTest
@testable import Algorithms

class LongestSubsequenceTests: XCTestCase {

    func testLongestSubsequenceReturnsTheLongestSubsequece() {
        var firstWord: String!
        var secondWord: String!
        XCTContext.runActivity(named: "GIVEN two strings") { _ in
            firstWord = "fosh"
            secondWord = "fort"
        }
        
        var commonSubsequence: String!
        XCTContext.runActivity(named: "WHEN I search for longestCommonSubstring") { _ in
            commonSubsequence = DynamicProgramming.longestSubsequence(firstWord: firstWord, secondWord: secondWord)
        }
        
        XCTContext.runActivity(named: "THEN I get the longest subsequence") { _ in
            XCTAssertEqual(commonSubsequence, "fo")
        }
    }
    
    func testLongestSubsequenceReturnsTheLongestSubsequeceAgain() {
        var firstWord: String!
        var secondWord: String!
        XCTContext.runActivity(named: "GIVEN two strings") { _ in
            firstWord = "fosh"
            secondWord = "fish"
        }
        
        var commonSubsequence: String!
        XCTContext.runActivity(named: "WHEN I search for longestCommonSubstring") { _ in
            commonSubsequence = DynamicProgramming.longestSubsequence(firstWord: firstWord, secondWord: secondWord)
        }
        
        XCTContext.runActivity(named: "THEN I get the longest subsequence") { _ in
            XCTAssertEqual(commonSubsequence, "fsh")
        }
    }
    
    func testLongestSubsequenceReturnsTheLongestSubsequeceIfFirstLettersDoNotMatch() {
        var firstWord: String!
        var secondWord: String!
        XCTContext.runActivity(named: "GIVEN two strings") { _ in
            firstWord = "ThisOneIsALongString"
            secondWord = "ButThisIsAlsoALongString"
        }
        
        var commonSubsequence: String!
        XCTContext.runActivity(named: "WHEN I search for longestCommonSubstring") { _ in
            commonSubsequence = DynamicProgramming.longestSubsequence(firstWord: firstWord, secondWord: secondWord)
        }
        
        XCTContext.runActivity(named: "THEN I get the longest subsequence") { _ in
            XCTAssertEqual(commonSubsequence, "ThisIsALongString")
        }
    }

}
