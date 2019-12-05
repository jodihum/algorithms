//
//  GraphAlogorithms.swift
//  Algorithms
//
//  Created by Josephine Humphreys on 11/8/19.
//  Copyright © 2019 Jhoom. All rights reserved.
//

import Foundation

public class GraphAlgorithms {
    
    // Chapter 6

    /// BreadthFirstSearch
    /// - Parameter graph: The entire graph to search as a dictionary.  The key is the node and the value are the neighbors.
    /// - Parameter startNode: The node to begin the search with.
    /// - Parameter seletionCriteria: The selection criteria to determine if you have found what you are searching for
    /// - Returns the first item in the graph that matches the selectionCriteria
    class func breadthFirstSearch<T:Comparable>(graph:[T: [T]], startNode: T, seletionCriteria:(T) -> Bool) -> T? {
        var queue = Queue<T>()
        guard let itemsToEnqueue = graph[startNode]  else { return nil }
        queue.enqueue(items: itemsToEnqueue)
        
        var checkedItems = [T: Bool]()
        
        while !queue.isEmpty() {
            if let itemToCheck = queue.dequeue() {
                if checkedItems[itemToCheck] == nil {
                    print("checking \(itemToCheck)")
                    if seletionCriteria(itemToCheck) {
                        return itemToCheck
                    } else {
                        if let itemsToAdd = graph[itemToCheck] {
                            queue.enqueue(items: itemsToAdd)
                        }
                    }
                    checkedItems[itemToCheck] = true
                } else {
                    print("not checking \(itemToCheck) because already checked before")
                }
            }
        }
        
        return nil
    }
    
    
    // Chapter 7
    
    /// DijkstrasAlgorithm
    /// - Parameter graph: The entire weighted graph to search
    /// - Parameter startNode: The node the path will begin at
    /// - Parameter endNode: The node at the end of the path
    /// - Returns a tuple containing the lowest cost path and the cost
    class func dijkstrasAlgorithm<T, U: Numeric & Comparable>(graph:[T: [T : U]] , startNode: T, endNode: T) -> ([T], U?) {
        
        var costs = [T : U]()
        var parents = [T: T]()
        
        var processedNodes = [T: Bool]()
        
        // initial population of costs
        guard let startingNodes = graph[startNode] else { return ([], nil) }
        
        for node in startingNodes {
            costs[node.key] = node.value
            parents[node.key] = startNode
        }
        
        while (graph.keys.count - processedNodes.count) > 1 {
            
            // find lowest cost unprocessed node
            if let lowestCostNode = findLowestCostNode(costs: costs, processedNodes: processedNodes) {
               
                // get cost and neighbors of that node
                if let neighbors = graph[lowestCostNode], let cost = costs[lowestCostNode] {
                    
                    // loop through neighbors
                    for neighbor in neighbors {
                        let newNeighborCost = cost + neighbor.value
                        
                        // compare costs
                        if costs[neighbor.key] == nil ||
                            costs[neighbor.key]! > newNeighborCost {
                                costs[neighbor.key] = newNeighborCost
                                parents[neighbor.key] = lowestCostNode
                        }
                    }
                }
                
                processedNodes[lowestCostNode] = true
            }
        }
        
        let endCost = costs[endNode] ?? 0
        let path = createPath(parents: parents, startNode: startNode, endNode: endNode)
        return (path, endCost)
    }
    
    private class func findLowestCostNode<T, U: Comparable>(costs:[T : U], processedNodes:[T: Bool]) -> T? {
        let unprocessedNodeCosts = costs.filter( { processedNodes[$0.key] == nil })
        let minCost = unprocessedNodeCosts.values.min()
        return unprocessedNodeCosts.filter({ $0.value == minCost}).first?.key
    }
    
    private class func createPath<T>(parents: [T: T], startNode: T, endNode: T) -> [T] {
        var path = [endNode]
        var currentParent = parents[endNode]
        while currentParent != startNode  {
            print("current parent = \(String(describing: currentParent))")
            if let thisParent = currentParent {
                path.insert(thisParent, at: 0)
                if let nextParent = parents[thisParent] {
                    currentParent = nextParent
                }
            }
        }
        path.insert(startNode, at: 0)
        return path
    }
}


