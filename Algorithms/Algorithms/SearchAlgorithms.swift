//
//  SearchAlgorithms.swift
//  Algorithms
//
//  Created by Josephine Humphreys on 09/08/2018.
//  Copyright © 2018 Jhoom. All rights reserved.
//

public class SearchAlgorithms {
    
    // Chapter 1
    class func binarySearch<T:Comparable>(inputArray:[T], selectedItem:T) -> Int? {
        if !isSorted(inputArray: inputArray) { return -1 }
        
        var low:Int = 0
        var high:Int = inputArray.count - 1
        
        var mid:Int = (high - low)/2 + low
        
        while low != high {
            if inputArray[mid] == selectedItem {
                return mid
            } else if inputArray[mid] > selectedItem {
                high = mid - 1
            } else {
                low = mid + 1
            }
            mid = (high - low)/2 + low
        }
        return inputArray[mid] == selectedItem ? mid : nil
    }
    
    private class func isSorted<T:Comparable>(inputArray:[T]) -> Bool {
        let sortedArray = inputArray.sorted()
        return sortedArray == inputArray
    }
    
    // Chapter 4 Exercise 4
    class func recursiveBinarySearch<T:Comparable>(inputArray:[T], startIndex: Int = 0, selectedItem:T) -> Int? {
        if !isSorted(inputArray: inputArray) { return -1 }
        
        let middle = inputArray.count/2
        let indices = makeIndices(startIndex: startIndex, size: inputArray.count)
        
        if inputArray.count > 1 {  // recursive case
            if inputArray[middle] == selectedItem {
                return indices[middle]
            } else if inputArray[middle] > selectedItem {
                let newArray = Array(inputArray[0..<middle])
                return recursiveBinarySearch(inputArray: newArray, startIndex: indices[0], selectedItem: selectedItem)
            } else {
                let newArray = Array(inputArray[(middle+1)..<inputArray.count])
                return recursiveBinarySearch(inputArray: newArray, startIndex: indices[middle+1], selectedItem: selectedItem)
            }
        } else {              // base case
            if inputArray.first == selectedItem {
                return indices.first
            } else {
                return nil
            }
        }
    }
    
    private class func makeIndices(startIndex: Int, size: Int) -> [Int] {
        var indices = [Int]()
        for i in 0..<size {
            indices.append(startIndex + i)
        }
        return indices
    }
    
}

