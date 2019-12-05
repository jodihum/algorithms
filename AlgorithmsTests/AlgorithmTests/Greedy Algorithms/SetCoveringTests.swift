//
//  SetCoveringTests.swift
//  AlgorithmsTests
//
//  Created by Josephine Humphreys on 11/14/19.
//  Copyright © 2019 Jhoom. All rights reserved.
//

import XCTest
@testable import Algorithms

class SetCoveringTests: XCTestCase {

    func testSmallestNumberOfSetsSelected() {
        var allStations = [Station]()
        XCTContext.runActivity(named: "GIVEN a list of radio stations with states covered" ) { _ in
            allStations = makeStationList()
        }
        
        var selectedStations = [String]()
        XCTContext.runActivity(named: "WHEN stations are selected" ) { _ in
            selectedStations = try! GreedyAlgorithms.greedyStationSelector(allStations: allStations, allStates: allStates())
        }
        
        XCTContext.runActivity(named: "THEN the minimum number of stations covering all states are selected" ) { _ in
            XCTAssertTrue(selectedStations == ["kOne", "kTwo", "kThree", "kFive"] || selectedStations == ["kFour", "kTwo", "kThree", "kFive"] )
        }
    }
    
    func testHandlesError() {
        var allStations = [Station]()
        XCTContext.runActivity(named: "GIVEN a list of radio stations with states covered" ) { _ in
            allStations = makeStationList()
        }
        
        var greedyError: GreedyError?
        XCTContext.runActivity(named: "WHEN stations are selected" ) { _ in
            do {
                let _ = try GreedyAlgorithms.greedyStationSelector(allStations: allStations, allStates: evenMoreStates())
            } catch {
                greedyError = error as? GreedyError
            }
        }
        
        XCTContext.runActivity(named: "THEN the minimum number of stations covering all states are selected" ) { _ in
            XCTAssertEqual(greedyError, GreedyError.someStatesMissing)
        }
    }
    
    private func makeStationList() -> [Station] {
           return [Station(name: "kOne", states: ["ID","NV","UT"]),
                   Station(name: "kTwo", states: ["WA","ID","MT"]),
                   Station(name: "kThree", states: ["OR","NV","CA"]),
                   Station(name: "kFour", states: ["NV","UT"]),
                   Station(name: "kFive", states: ["CA","AZ"])
               ]
       }
    
    private func allStates() -> Set<String>{
        return Set(["ID","NV","UT","WA","MT","OR","AZ","CA"])
    }
    
    private func evenMoreStates() -> Set<String>{
        return Set(["ID","NV","UT","WA","MT","OR","AZ","CA","MD"])
    }

}
