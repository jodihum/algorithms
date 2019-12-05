//
//  ClassificationTests.swift
//  AlgorithmsTests
//
//  Created by Josephine Humphreys on 12/3/19.
//  Copyright © 2019 Jhoom. All rights reserved.
//

import XCTest
@testable import Algorithms

class ClassificationTests: XCTestCase {

    func testClassificationWithKGreaterThanOne() {
        let fruitA = ClassifiableItem(category: "orange", features: [2, 1])
        let fruitB = ClassifiableItem(category: "orange", features: [3, 2])
        let fruitC = ClassifiableItem(category: "orange", features: [1, 2])
        let fruitD = ClassifiableItem(category: "tangerine", features: [2, 2])
        let fruitE = ClassifiableItem(category: "orange", features: [2, 3])
        let fruitF = ClassifiableItem(category: "grapefruit", features: [5, 5])
        let fruitG = ClassifiableItem(category: "grapefruit", features: [5, 2])
        let fruitH = ClassifiableItem(category: "grapefruit", features: [4, 3])
        let fruitI = ClassifiableItem(category: "grapefruit", features: [4, 4])
        let fruitJ = ClassifiableItem(category: "grapefruit", features: [4, 5])
        var referenceFruit:[ClassifiableItem]!
        XCTContext.runActivity(named: "GIVEN some reference fruit") { _ in
            referenceFruit = [fruitA, fruitB, fruitC, fruitD, fruitE, fruitF, fruitG, fruitH, fruitI, fruitJ]
        }
        
        var nearestFruit: String!
        XCTContext.runActivity(named: "WHEN i try to determine type of new fruit") { _ in
            let fruitToTest = ClassifiableItem(category: nil, features: [2, 2])
            nearestFruit = KNearestNeighbors.classify(item: fruitToTest, using: referenceFruit, k: 3)
        }
        
        XCTContext.runActivity(named: "THEN I get the closet choice") { _ in
            XCTAssertEqual(nearestFruit, "orange")
        }
    }
    
    func testClassificationWithKEqualOne() {
        let fruitA = ClassifiableItem(category: "orange", features: [2, 1])
        let fruitB = ClassifiableItem(category: "orange", features: [3, 2])
        let fruitC = ClassifiableItem(category: "orange", features: [1, 2])
        let fruitD = ClassifiableItem(category: "tangerine", features: [2, 2])
        let fruitE = ClassifiableItem(category: "orange", features: [2, 3])
        let fruitF = ClassifiableItem(category: "grapefruit", features: [5, 5])
        let fruitG = ClassifiableItem(category: "grapefruit", features: [5, 2])
        let fruitH = ClassifiableItem(category: "grapefruit", features: [4, 3])
        let fruitI = ClassifiableItem(category: "grapefruit", features: [4, 4])
        let fruitJ = ClassifiableItem(category: "grapefruit", features: [4, 5])
        var referenceFruit:[ClassifiableItem]!
        XCTContext.runActivity(named: "GIVEN some reference fruit") { _ in
            referenceFruit = [fruitA, fruitB, fruitC, fruitD, fruitE, fruitF, fruitG, fruitH, fruitI, fruitJ]
        }
        
        var nearestFruit: String!
        XCTContext.runActivity(named: "WHEN i try to determine type of new fruit") { _ in
            let fruitToTest = ClassifiableItem(category: nil, features: [2, 2])
            nearestFruit = KNearestNeighbors.classify(item: fruitToTest, using: referenceFruit, k: 1)
        }
        
        XCTContext.runActivity(named: "THEN I get the closet choice") { _ in
            XCTAssertEqual(nearestFruit, "tangerine")
        }
    }
    
    func testClassificationWithLargeK() {
        let fruitA = ClassifiableItem(category: "orange", features: [2, 1])
        let fruitB = ClassifiableItem(category: "orange", features: [3, 2])
        let fruitC = ClassifiableItem(category: "orange", features: [1, 2])
        let fruitD = ClassifiableItem(category: "orange", features: [2, 2])
        let fruitE = ClassifiableItem(category: "orange", features: [2, 3])
        let fruitF = ClassifiableItem(category: "grapefruit", features: [5, 5])
        let fruitG = ClassifiableItem(category: "grapefruit", features: [5, 2])
        let fruitH = ClassifiableItem(category: "grapefruit", features: [4, 3])
        let fruitI = ClassifiableItem(category: "grapefruit", features: [4, 4])
        let fruitJ = ClassifiableItem(category: "grapefruit", features: [4, 5])
        var referenceFruit:[ClassifiableItem]!
        XCTContext.runActivity(named: "GIVEN some reference fruit") { _ in
            referenceFruit = [fruitA, fruitB, fruitC, fruitD, fruitE, fruitF, fruitG, fruitH, fruitI, fruitJ]
        }
        
        var nearestFruit: String!
        XCTContext.runActivity(named: "WHEN i try to determine type of new fruit") { _ in
            let fruitToTest = ClassifiableItem(category: nil, features: [2, 2])
            nearestFruit = KNearestNeighbors.classify(item: fruitToTest, using: referenceFruit, k: 9)
        }
        
        XCTContext.runActivity(named: "THEN I get the closet choice") { _ in
            XCTAssertEqual(nearestFruit, "orange")
        }
    }

}
