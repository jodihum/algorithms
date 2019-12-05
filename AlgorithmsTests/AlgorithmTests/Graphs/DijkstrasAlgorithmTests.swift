//
//  DijkstrasAlgorithmTests.swift
//  AlgorithmsTests
//
//  Created by Josephine Humphreys on 11/8/19.
//  Copyright © 2019 Jhoom. All rights reserved.
//

import XCTest
@testable import Algorithms

class DijkstrasAlgorithmTests: XCTestCase {

    
    func testFindsCheapestPathForGraphOne() {
        var graph: [String: [String : Double]]?
        XCTContext.runActivity(named: "GIVEN a graph") { _ in
            graph = createGraphOne()
        }
        
        var result: (path: [String], cost: Double?)?
        XCTContext.runActivity(named: "WHEN dijkstra's algorithm is used") { _ in
            result = GraphAlgorithms.dijkstrasAlgorithm(graph: graph!, startNode: "start", endNode: "fin")
        }
        
        XCTContext.runActivity(named: "THEN the cheapest path and the cost are returned") { _ in
            XCTAssertEqual(result!.path, ["start","b","a","fin"])
            XCTAssertEqual(result!.cost, 6)
        }
    }
    
    func testFindsCheapestPathForGraphTwo() {
        var graph: [String: [String : Int]]?
        XCTContext.runActivity(named: "GIVEN a graph") { _ in
            graph = createGraphTwo()
        }
        
        var result: (path: [String], cost: Int?)?
        XCTContext.runActivity(named: "WHEN dijkstra's algorithm is used") { _ in
            result = GraphAlgorithms.dijkstrasAlgorithm(graph: graph!, startNode: "start", endNode: "fin")
        }
        
        XCTContext.runActivity(named: "THEN the cheapest path and the cost are returned") { _ in
            XCTAssertEqual(result!.path, ["start","a","d","fin"])
            XCTAssertEqual(result!.cost, 8)
        }
    }
    
    func testFindsCheapestPathForGraphThree() {
        var graph: [String: [String : Int]]?
        XCTContext.runActivity(named: "GIVEN a graph") { _ in
            graph = createGraphThree()
        }
        
        var result: (path: [String], cost: Int?)?
        XCTContext.runActivity(named: "WHEN dijkstra's algorithm is used") { _ in
            result = GraphAlgorithms.dijkstrasAlgorithm(graph: graph!, startNode: "start", endNode: "fin")
        }
        
        XCTContext.runActivity(named: "THEN the cheapest path and the cost are returned") { _ in
            XCTAssertEqual(result!.path, ["start","a","b","fin"])
            XCTAssertEqual(result!.cost, 60)
        }
    }



    // graph used in book Chapter 7
    private func createGraphOne() -> [String: [String : Double]] {
        var graph = [String: [String: Double]]()
        
        graph["start"] = ["a": 6, "b": 2]
        graph["a"] = ["fin": 1]
        graph["b"] = ["a": 3, "fin": 5]
        graph["fin"] = [:]
        
        return graph
    }
    
    // graph from Exercise 7.1 A
    private func createGraphTwo() -> [String: [String : Int]] {
        var graph = [String: [String: Int]]()
        
        graph["start"] = ["a": 5, "b": 2]
        graph["a"] = ["c": 4, "d": 2]
        graph["b"] = ["a": 8, "d": 7]
        graph["c"] = ["d": 6, "fin": 3]
        graph["d"] = ["fin": 1]
        graph["fin"] = [:]
        
        return graph
    }
    
    // graph from Exercise 7.1 B
    private func createGraphThree() -> [String: [String : Int]] {
        var graph = [String: [String: Int]]()
        
        graph["start"] = ["a": 10]
        graph["a"] = ["b": 20]
        graph["b"] = ["c": 1, "fin": 30]
        graph["c"] = ["a": 1]
        graph["fin"] = [:]
        
        return graph
    }
    
    
}
