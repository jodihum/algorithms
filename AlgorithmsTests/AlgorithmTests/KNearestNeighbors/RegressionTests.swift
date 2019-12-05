//
//  RegressionTests.swift
//  AlgorithmsTests
//
//  Created by Jodi Humphreys on 04/12/2019.
//  Copyright © 2019 Jhoom. All rights reserved.
//

import XCTest
@testable import Algorithms

class RegressionTests: XCTestCase {


    func testRegressionOnMovies() {
        
        let morpheus = RegressableItem(value: 9, features: [2,5,1,3,1])
        let justin =  RegressableItem(value: 5, features: [4,3,5,1,5])
        let jc = RegressableItem(value: 4, features: [3,4,4,2,4])
        let joey = RegressableItem(value: 4, features: [3,5,4,1,4])
        let lance =  RegressableItem(value: 5, features: [3,4,5,1,4])
        let chris = RegressableItem(value: 3, features: [2,4,4,1,4])

        var referenceFans:[RegressableItem]!
        XCTContext.runActivity(named: "GIVEN some reference movie fans") { _ in
            referenceFans = [morpheus, justin, jc, joey, lance, chris]
        }
        
        var predictedValue: Double!
        XCTContext.runActivity(named: "WHEN i try to determine how the test user will rate the movie") { _ in
            let fanToTest = RegressableItem(value: nil, features: [3,4,4,1,4])
            predictedValue = KNearestNeighbors.regression(item: fanToTest, using: referenceFans, k: 5)
        }
        
        XCTContext.runActivity(named: "THEN I get the average of the 5 nearest neighbors values") { _ in
            XCTAssertEqual(predictedValue, 4.2)
        }
    }
    
    func testRegressionOnBread() {
        let A = RegressableItem(value: 300, features: [5,1,0])
        let B = RegressableItem(value: 225, features: [3,1,1])
        let C = RegressableItem(value: 75, features: [1,1,0])
        let D = RegressableItem(value: 200, features: [4,0,1])
        let E = RegressableItem(value: 150, features: [4,0,0])
        let F = RegressableItem(value: 50, features: [2,0,0])

        var referenceDays:[RegressableItem]!
        XCTContext.runActivity(named: "GIVEN some reference days") { _ in
            referenceDays = [A, B, C, D, E, F]
        }
        
        var predictedValue: Double!
        XCTContext.runActivity(named: "WHEN i try to determine likely number of bread to sell") { _ in
            let dayToEstimate = RegressableItem(value: nil, features: [4,1,0])
            predictedValue = KNearestNeighbors.regression(item: dayToEstimate, using: referenceDays, k: 4)
        }
        
        XCTContext.runActivity(named: "THEN I get the average of the 5 nearest neighbors values") { _ in
            XCTAssertEqual(predictedValue, 218.75)
        }
    }



}
