//
//  TravelingSalesPersonTests.swift
//  AlgorithmsTests
//
//  Created by Josephine Humphreys on 11/21/19.
//  Copyright © 2019 Jhoom. All rights reserved.
//


import XCTest
@testable import Algorithms


class TravelingSalesPersonTests: XCTestCase {

    
    func testFindsGoodPath() {
        var graph: [String: [String : Int]]?
        XCTContext.runActivity(named: "GIVEN a graph of cities and distances") { _ in
            graph = createGraph()
        }
        
        var result: (path: [String], cost: Int?)?
        XCTContext.runActivity(named: "WHEN using greedy traveling salesperson ") { _ in
            result = GreedyAlgorithms.greedyTravelingSalesperson(graph: graph!, startNode: "Marin")
        }
        
        XCTContext.runActivity(named: "THEN a good path is found") { _ in
            XCTAssertEqual(result!.path, ["Marin","San Francisco","Berkeley","Freemont", "Palo Alto"])
            XCTAssertEqual(result!.cost, 71)
        }
        
    }
    
    private func createGraph() -> [String: [String : Int]] {
        var graph = [String: [String: Int]]()
        
        graph["Marin"] = ["San Francisco": 10, "Berkeley": 12, "Freemont": 49, "Palo Alto": 48]
        graph["Berkeley"] = ["San Francisco": 16, "Marin": 13, "Freemont": 31, "Palo Alto": 35]
        graph["Palo Alto"] = ["San Francisco": 30, "Berkeley": 35, "Freemont": 17, "Marin": 50]
        graph["Freemont"] = ["San Francisco": 30, "Berkeley": 32, "Marin": 41, "Palo Alto": 16]
        graph["San Francisco"] = ["Marin": 11, "Berkeley": 14, "Freemont": 32, "Palo Alto": 33]
        
        return graph
    }

}
