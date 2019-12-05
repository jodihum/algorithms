//
//  BreadthFirstSearchTests.swift
//  AlgorithmsTests
//
//  Created by Josephine Humphreys on 11/7/19.
//  Copyright © 2019 Jhoom. All rights reserved.
//

import XCTest
@testable import Algorithms

class BreadthFirstSearchTests: XCTestCase {


    func testFindsFirstMangoSeller() {
        var graph: [String: [String]]?
        XCTContext.runActivity(named: "GIVEN a graph") { _ in
            graph = createGraph()
        }
        
        var mangoSeller: String?
        XCTContext.runActivity(named: "WHEN a breadthFirstSearch is performed") { _ in
            mangoSeller = GraphAlgorithms.breadthFirstSearch(graph: graph!, startNode: "you", seletionCriteria: { item in
                return item.last == "m"
            })
        }
        
        XCTContext.runActivity(named: "THEN the first mango seller is found") { _ in
            XCTAssertEqual(mangoSeller, "thom")
        }
    }
    
    func testFindsFirstMangoSellerIfStartingElsewhere() {
        var graph: [String: [String]]?
        XCTContext.runActivity(named: "GIVEN a graph") { _ in
            graph = createGraph()
        }
        
        var mangoSeller: String?
        XCTContext.runActivity(named: "WHEN a breadthFirstSearch is performed") { _ in
            mangoSeller = GraphAlgorithms.breadthFirstSearch(graph: graph!, startNode: "bob", seletionCriteria: { item in
                return item.last == "m"
            })
        }
        
        XCTContext.runActivity(named: "THEN the first mango seller is found") { _ in
            XCTAssertEqual(mangoSeller, "jim")
        }
    }
    
    func testReturnsNilIfNoMatch() {
        var graph: [String: [String]]?
        XCTContext.runActivity(named: "GIVEN a graph") { _ in
            graph = createGraph()
        }
        
        var mangoSeller: String?
        XCTContext.runActivity(named: "WHEN a breadthFirstSearch is performed with no matching items") { _ in
            mangoSeller = GraphAlgorithms.breadthFirstSearch(graph: graph!, startNode: "you", seletionCriteria: { item in
                return item.last == "q"
            })
        }
        
        XCTContext.runActivity(named: "THEN nil is returned") { _ in
            XCTAssertNil(mangoSeller)
        }
    }
    
    func testDoesNotCreateInfiniteLoop() {
        var graph: [String: [String]]?
        XCTContext.runActivity(named: "GIVEN graph with circular neigbhors") { _ in
            graph = createGraph2()
        }
        
        var mangoSeller: String?
        XCTContext.runActivity(named: "WHEN a breadthFirstSearch is performed") { _ in
            mangoSeller = GraphAlgorithms.breadthFirstSearch(graph: graph!, startNode: "you", seletionCriteria: { item in
                return item.last == "m"
            })
        }
        
        XCTContext.runActivity(named: "THEN the search stops") { _ in
            XCTAssertNil(mangoSeller)
        }
    }

    private func createGraph() -> [String: [String]] {
        var graph = [String: [String]]()
        graph["you"] = ["alice", "bob", "claire"]
        graph["bob"] = ["anuj", "peggy"]
        graph["alice"] = ["peggy"]
        graph["claire"] = ["thom", "jonny"]
        graph["anuj"] = ["jim"]
        graph["peggy"] = []
        graph["thom"] = []
        graph["jonny"] = []
        
        return graph
    }
    
    private func createGraph2() -> [String: [String]] {
        var graph = [String: [String]]()
        graph["you"] = ["peggy"]
        graph["peggy"] = ["you"]
        
        return graph
    }
    

}
