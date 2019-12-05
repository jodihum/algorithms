//
//  TopologicalSortTests.swift
//  AlgorithmsTests
//
//  Created by Josephine Humphreys on 11/7/19.
//  Copyright © 2019 Jhoom. All rights reserved.
//

import XCTest
@testable import Algorithms

class TopologicalSortTests: XCTestCase {

    func testDependentItemsEndUpLaterInList() {
        var graph: [String: [String]]?
        XCTContext.runActivity(named: "GIVEN a graph") { _ in
            graph = createGraph()
        }
        
        var sortedItems:[String]?
        XCTContext.runActivity(named: "WHEN a topological sort is performed") { _ in
            sortedItems = SortAlgorithms.topologicalSort(graph: graph!, startNode: "wake_up")
        }
        
        XCTContext.runActivity(named: "THEN dependent items appear after the items they depend on") { _ in
            let indexOfWakeUp = sortedItems?.firstIndex(of: "wake_up")
            let indexOfExercise = sortedItems?.firstIndex(of: "exercise")
            let indexOfShower = sortedItems?.firstIndex(of: "shower")
            let indexOfGetDressed = sortedItems?.firstIndex(of: "get_dressed")
            let indexOfBrushTeeth = sortedItems?.firstIndex(of: "brush_teeth")
            let indexOfEatBreakfast = sortedItems?.firstIndex(of: "eat_breakfast")
            let indexOfPackLunch = sortedItems?.firstIndex(of: "pack_lunch")

            XCTAssertGreaterThan(indexOfGetDressed!, indexOfShower!)
            XCTAssertGreaterThan(indexOfShower!, indexOfExercise!)
            XCTAssertGreaterThan(indexOfExercise!, indexOfWakeUp!)
            XCTAssertGreaterThan(indexOfEatBreakfast!, indexOfBrushTeeth!)
            XCTAssertGreaterThan(indexOfBrushTeeth!, indexOfWakeUp!)
            XCTAssertGreaterThan(indexOfPackLunch!, indexOfWakeUp!)
        }
    }
    
    
    private func createGraph() -> [String: [String]] {
         var graph = [String: [String]]()
         graph["wake_up"] = ["exercise", "brush_teeth", "pack_lunch"]
         graph["exercise"] = ["shower"]
         graph["brush_teeth"] = ["eat_breakfast"]
         graph["pack_lunch"] = []
         graph["shower"] = ["get_dressed"]
         graph["eat_breakfast"] = []
         graph["get_dressed"] = []
         
         return graph
     }

}
