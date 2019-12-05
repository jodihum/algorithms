//
//  GreedyAlgorithms.swift
//  Algorithms
//
//  Created by Josephine Humphreys on 11/12/19.
//  Copyright © 2019 Jhoom. All rights reserved.
//

import Foundation

struct Course: Equatable {
    let name: String
    let startTime: String
    let endTime: String
}

struct Station: Equatable, Hashable {
    let name: String
    let states: Set<String>
}

enum GreedyError: Error {
    case someStatesMissing
}


class GreedyAlgorithms {
    class func greedyClassScheduler(potentialClasses: [Course], startTime: String, endTime: String) -> [Course] {
        var scheduledClasses = [Course]()
        var nextOpenSlot = date(from: startTime)
        let endingTime = date(from: endTime)
        
        var classesRemaining = potentialClasses.sorted {(id1, id2) -> Bool in
            return date(from:id1.endTime) < date(from:id2.endTime)
        }
        
        // remove classes that end too late
        classesRemaining = classesRemaining.filter({ date(from: $0.endTime) <= endingTime })
        
        while classesRemaining.count > 0 {
            while classesRemaining.count > 0 && date(from: classesRemaining.first!.startTime) < nextOpenSlot {
                classesRemaining.remove(at: 0)
            }
            if let classToAdd = classesRemaining.first {
                print("adding class \(classToAdd.name)")
                scheduledClasses.append(classToAdd)
                classesRemaining = classesRemaining.filter({$0.name != classToAdd.name})
                nextOpenSlot = date(from: classToAdd.endTime)
            }
        }
        
        return scheduledClasses
    }
    
    private class func date(from time: String) -> Date {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .none

        if let theDate = formatter.date(from: time) {
            return theDate
        } else {
            assertionFailure("Can't form a date from your string")
            return Date()
        }
    }
    
    class func greedyStationSelector(allStations: [Station], allStates: Set<String>) throws -> [String] {
 
        var remainingStations = allStations
        var statesNeeded = allStates
        
        var finalStations = [String]()
        
        while statesNeeded.count > 0 {
            var bestStation: Station? = nil
            var covered: Int = 0
            for station in remainingStations {
                let remainingStationsCovered = station.states.intersection(statesNeeded)
                if remainingStationsCovered.count > covered {
                    covered = remainingStationsCovered.count
                    bestStation = station
                }
            }
            if let bestStation = bestStation {
                finalStations.append(bestStation.name)
                statesNeeded = statesNeeded.subtracting(bestStation.states)
                remainingStations = remainingStations.filter({$0 != bestStation})
            } else {
                // no stations cover the missing states
                throw GreedyError.someStatesMissing
            }
        }
        
        return finalStations
    }
    
    class func greedyTravelingSalesperson<T, U: Numeric & Comparable>(graph:[T: [T : U]] , startNode: T) -> ([T], U?) {
        
        var visitedCities = [startNode : true]
        var citiesLeft = graph.keys.count - 1
        
        var path = [startNode]
        var totalDistance: U = 0
        
        var thisCity = startNode
        
        while citiesLeft > 0 {
            if let distances = graph[thisCity] {
                let sortedDistances = distances.filter({visitedCities[$0.key] != true}).sorted(by: {$0.value < $1.value})
                if let nextCity = sortedDistances.first?.key {
                    print("Adding \(nextCity)")
                    path.append(nextCity)
                    visitedCities[nextCity] = true
                    thisCity = nextCity
                }
                if let distance = sortedDistances.first?.value {
                    print("Adding value \(distance)")
                    totalDistance = totalDistance + distance
                }
            }
            citiesLeft -= 1
        }
        
        return (path, totalDistance)
    }
        
}
