//
//  FruitAndMovieTests.swift
//  AlgorithmsTests
//
//  Created by Josephine Humphreys on 12/3/19.
//  Copyright © 2019 Jhoom. All rights reserved.
//

import XCTest
@testable import Algorithms

class FruitAndMovieTests: XCTestCase {

    func testFindsNearestFruit() {
        var referenceFruit:[Fruit]!
        XCTContext.runActivity(named: "GIVEN some reference fruit") { _ in
            referenceFruit = createReferenceFruit()
        }
        
        var nearestFruit: FruitType!
        XCTContext.runActivity(named: "WHEN i try to determine type of new fruit") { _ in
            let fruitToTest = Fruit(category: nil, size: 2, redness: 2)
            nearestFruit = Chapter10.determineType(of: fruitToTest, from: referenceFruit)
        }
        
        XCTContext.runActivity(named: "THEN I get the closet choice") { _ in
            XCTAssertEqual(nearestFruit, .orange)
        }
    }

    
    private func createReferenceFruit() -> [Fruit] {
        let fruitB = Fruit(category: .orange, size: 2, redness: 1)
        let fruitC = Fruit(category: .grapefruit, size: 4, redness: 5)
        
        return [fruitB, fruitC]
    }
    
    func testFindsNearestMovieFan() {
        let justin = MovieFan(comedy: 4, action: 3, drama: 5, horror: 1, romance: 5)
        let morpheus = MovieFan(comedy: 2, action: 5, drama: 1, horror: 3, romance: 1)
        var referenceFans:[MovieFan]!
        XCTContext.runActivity(named: "GIVEN some reference movie fans") { _ in
            referenceFans = [justin, morpheus]
        }
        
        var nearestFan: MovieFan!
        XCTContext.runActivity(named: "WHEN i try to determine the person with the most similar taste to the test user") { _ in
            let fanToTest = MovieFan(comedy: 3, action: 4, drama: 4, horror: 1, romance: 4)
            nearestFan = Chapter10.determineMostSimilarFan(to: fanToTest, from: referenceFans)
        }
        
        XCTContext.runActivity(named: "THEN I get the person with most similar tastes") { _ in
            XCTAssertEqual(nearestFan, justin)
        }
    }
    
}
