//
//  OptimizingChoiceTests.swift
//  AlgorithmsTests
//
//  Created by Josephine Humphreys on 11/26/19.
//  Copyright © 2019 Jhoom. All rights reserved.
//

import XCTest
@testable import Algorithms

class OptimizingChoiceTests: XCTestCase {

    // Chapter 9 first example
    func testFindMostValueFor3Items() {
        var items =  [PossibleChoice]()
        XCTContext.runActivity(named: "GIVEN a knapsack of a given size and some items") { _ in
            items = createItems()
        }
        
        var bestOption = GridElement()
        XCTContext.runActivity(named: "WHEN i fill the knapsack") { _ in
            bestOption = DynamicProgramming.optimizeChoices(from: items, maxCost: 4, spacing: 1)
        }
        
        XCTContext.runActivity(named: "THEN i get the highest value into the knapsack") { _ in
            XCTAssertEqual(bestOption, expectedBestOption())
        }
    }
    
    func testFindMostValueFor4Items() {
        var items =  [PossibleChoice]()
        XCTContext.runActivity(named: "GIVEN a knapsack of a given size and some items") { _ in
            items = createItems()
            items.append(PossibleChoice(name: "iphone", cost: 1, value: 2000))
        }
        
        var bestOption = GridElement()
        XCTContext.runActivity(named: "WHEN i fill the knapsack") { _ in
            bestOption = DynamicProgramming.optimizeChoices(from: items, maxCost: 4, spacing: 1)
        }
        
        XCTContext.runActivity(named: "THEN i get the highest value into the knapsack") { _ in
            XCTAssertEqual(bestOption, expectedBestOption2())
        }
    }
    
    func testExercise9_1() {
        var items =  [PossibleChoice]()
        XCTContext.runActivity(named: "GIVEN a knapsack of a given size and some items") { _ in
            items = createItems()
            items.append(PossibleChoice(name: "iphone", cost: 1, value: 2000))
            items.append(PossibleChoice(name: "mp3", cost: 1, value: 1000))
        }
        
        var bestOption = GridElement()
        XCTContext.runActivity(named: "WHEN i fill the knapsack") { _ in
            bestOption = DynamicProgramming.optimizeChoices(from: items, maxCost: 4, spacing: 1)
        }
        
        XCTContext.runActivity(named: "THEN i get the highest value into the knapsack") { _ in
            XCTAssertEqual(bestOption, expectedBestOption3())
        }
    }
    
    func testOrderOfRowsDoesNotChangeResult() {
        var items =  [PossibleChoice]()
        XCTContext.runActivity(named: "GIVEN a knapsack of a given size and some items") { _ in
            items = createItemsDifferentOrder()
        }
        
        var bestOption = GridElement()
        XCTContext.runActivity(named: "WHEN i fill the knapsack") { _ in
            bestOption = DynamicProgramming.optimizeChoices(from: items, maxCost: 4, spacing: 1)
        }
        
        XCTContext.runActivity(named: "THEN i get the highest value into the knapsack") { _ in
            XCTAssertEqual(bestOption, expectedBestOptionDifferentOrder())
        }
    }
    
    func testWorksWithFractionalCosts() {
        var items =  [PossibleChoice]()
        XCTContext.runActivity(named: "GIVEN a knapsack of a given size and some items") { _ in
            items = createItems()
            items.append(PossibleChoice(name: "necklace", cost: 0.5, value: 2000))
        }
        
        var bestOption = GridElement()
        XCTContext.runActivity(named: "WHEN i fill the knapsack") { _ in
            bestOption = DynamicProgramming.optimizeChoices(from: items, maxCost: 4, spacing: 0.5)
        }
        
        XCTContext.runActivity(named: "THEN i get the highest value into the knapsack") { _ in
            XCTAssertEqual(bestOption, expectedBestOptionWithHalfWeights())
        }
    }
    
    func testWorksWhenBestOptionDoesNotFillAllSpace() {
        var items =  [PossibleChoice]()
        XCTContext.runActivity(named: "GIVEN a knapsack of a given size and some items") { _ in
            items = createItems()
            items.append(PossibleChoice(name: "necklace", cost: 0.5, value: 2000))
        }
        
        var bestOption = GridElement()
        XCTContext.runActivity(named: "WHEN i fill the knapsack") { _ in
            bestOption = DynamicProgramming.optimizeChoices(from: items, maxCost: 4, spacing: 0.5)
        }
        
        XCTContext.runActivity(named: "THEN the total weight of the knapsack can be less than the max") { _ in
            XCTAssertEqual(bestOption.totalCost(), 3.5)
        }
    }
    
    func testWorksForTravelItinerary() {
        var items =  [PossibleChoice]()
        XCTContext.runActivity(named: "GIVEN a trip of a given number of days and some things to do") { _ in
            items = createTravelItems()
        }
        
        var bestOption = GridElement()
        XCTContext.runActivity(named: "WHEN optimize choices") { _ in
            bestOption = DynamicProgramming.optimizeChoices(from: items, maxCost: 2, spacing: 0.5)
        }
        
        XCTContext.runActivity(named: "THEN i get the best travel options") { _ in
            XCTAssertEqual(bestOption, expectedBestTravelOption())
        }
    }
    
    func testExercise9_2() {
        var items =  [PossibleChoice]()
        XCTContext.runActivity(named: "GIVEN a knapsack of a given size and some items") { _ in
            items = createCampingItems()
        }
        
        var bestOption = GridElement()
        XCTContext.runActivity(named: "WHEN i fill the knapsack") { _ in
            bestOption = DynamicProgramming.optimizeChoices(from: items, maxCost: 6, spacing: 1)
        }
        
        XCTContext.runActivity(named: "THEN i get the highest value into the knapsack") { _ in
            XCTAssertEqual(bestOption, expectedBestCampingOption())
        }
    }
    
}

extension OptimizingChoiceTests {

    
    private func createItems() -> [PossibleChoice]{
        let guitar = PossibleChoice(name: "guitar", cost: 1, value: 1500)
        let stereo = PossibleChoice(name: "stereo", cost: 4, value: 3000)
        let laptop = PossibleChoice(name: "laptop", cost: 3, value: 2000)
        
        return [guitar, stereo, laptop]
    }
    
    private func createItemsDifferentOrder() -> [PossibleChoice] {
        let guitar = PossibleChoice(name: "guitar", cost: 1, value: 1500)
        let stereo = PossibleChoice(name: "stereo", cost: 4, value: 3000)
        let laptop = PossibleChoice(name: "laptop", cost: 3, value: 2000)
        
        return [stereo, laptop, guitar]
    }
    
    private func createCampingItems() -> [PossibleChoice] {
        let water = PossibleChoice(name: "water", cost: 3, value: 10)
        let book = PossibleChoice(name: "book", cost: 1, value: 3)
        let food = PossibleChoice(name: "food", cost: 2, value: 9)
        let jacket = PossibleChoice(name: "jacket", cost: 2, value: 5)
        let camera = PossibleChoice(name: "camera", cost: 1, value: 6)
        
        return [water, book, food, jacket, camera]
    }
    
    private func createTravelItems() -> [PossibleChoice] {
        let westminster = PossibleChoice(name: "westminster", cost: 0.5, value: 7)
        let globe = PossibleChoice(name: "globe", cost: 0.5, value: 6)
        let national = PossibleChoice(name: "national", cost: 1, value: 9)
        let british = PossibleChoice(name: "british", cost: 2, value: 9)
        let paul = PossibleChoice(name: "paul", cost: 0.5, value: 8)
        
        return [westminster, globe, national, british, paul]
    }
    
    private func expectedBestOption() -> GridElement {
        let guitar = PossibleChoice(name: "guitar", cost: 1, value: 1500)
        let laptop = PossibleChoice(name: "laptop", cost: 3, value: 2000)
        
        let items = [guitar, laptop]
        return GridElement(items: items)
    }
    
    private func expectedBestOptionWithHalfWeights() -> GridElement {
        let laptop = PossibleChoice(name: "laptop", cost: 3, value: 2000)
        let necklace = PossibleChoice(name: "necklace", cost: 0.5, value: 2000)
        
        let items = [laptop, necklace]
        return GridElement(items: items)
    }
    
    private func expectedBestOptionDifferentOrder() -> GridElement {
        let guitar = PossibleChoice(name: "guitar", cost: 1, value: 1500)
        let laptop = PossibleChoice(name: "laptop", cost: 3, value: 2000)
        
        let items = [laptop, guitar]
        return GridElement(items: items)
    }
    
    private func expectedBestOption2() -> GridElement {
        let laptop = PossibleChoice(name: "laptop", cost: 3, value: 2000)
        let iphone = PossibleChoice(name: "iphone", cost: 1, value: 2000)
        
        let items = [laptop, iphone]
        return GridElement(items: items)
    }
    
    private func expectedBestOption3() -> GridElement {
        let guitar = PossibleChoice(name: "guitar", cost: 1, value: 1500)
        let iphone = PossibleChoice(name: "iphone", cost: 1, value: 2000)
        let mp3 = PossibleChoice(name: "mp3", cost: 1, value: 1000)
        
        let items = [guitar, iphone, mp3]
        return GridElement(items: items)
    }
    
    private func expectedBestCampingOption() -> GridElement {
        let water = PossibleChoice(name: "water", cost: 3, value: 10)
        let food = PossibleChoice(name: "food", cost: 2, value: 9)
        let camera = PossibleChoice(name: "camera", cost: 1, value: 6)
        
        let items = [water, food,  camera]
        return GridElement(items: items)
    }
    
    private func expectedBestTravelOption() -> GridElement {
        let westminster = PossibleChoice(name: "westminster", cost: 0.5, value: 7)
        let national = PossibleChoice(name: "national", cost: 1, value: 9)
        let paul = PossibleChoice(name: "paul", cost: 0.5, value: 8)
        
        let items =  [westminster, national, paul]
        return GridElement(items: items)
    }

}
