//
//  Chapter4.swift
//  Algorithms
//
//  Created by Josephine Humphreys on 13/08/2018.
//  Copyright © 2018 Jhoom. All rights reserved.
//
//  These are examples of recursion

public class Chapter4 {
    
    // Exercise 1
    class func sum(array:[Int]) -> Int? {
        if array.count > 1 {  // recursive case
            let newArray = Array(array[1..<array.count])
            let total: Int = (array.first ?? 0) + (sum(array: newArray) ?? 0)
            return total
        } else {              // base case
            return array.first
        }
    }
    
    // Exercise 2
    class func countItems<T>(array:[T]) -> Int {
        var countOfItems = 0
        
        if (!array.isEmpty) {
            let remainingArray = Array(array[1..<array.count])
            countOfItems = 1 + countItems(array:remainingArray)
        } else {
            return 0
        }
        return countOfItems
    }
    
    // Exercise 3
    class func maxValue<T:Comparable>(array:[T]) -> T? {
        guard var maxVal = array.first else { return nil }
        
        if (!array.isEmpty) {
            let remainingArray = Array(array[1..<array.count])
            if !remainingArray.isEmpty {
                guard let remainingMaxValue = maxValue(array:remainingArray) else { return maxVal }
                maxVal = (maxVal > remainingMaxValue) ? maxVal : remainingMaxValue
            }
        }
        
        return maxVal
    }
    
    
}
