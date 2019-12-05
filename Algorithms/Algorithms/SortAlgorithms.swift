//
//  SortAlgorithms.swift
//  Algorithms
//
//  Created by Josephine Humphreys on 13/08/2018.
//  Copyright © 2018 Jhoom. All rights reserved.
//

public class SortAlgorithms {
    
    // Chapter 2
    class func selectionSort<T:Comparable>(array:[T]) -> [T] {
        var inputArray = array
        var sortedArray:[T] = []
        while inputArray.count > 0 {
            print("selection sort: \(inputArray.count)")
            let indexOfMin = findMinimum(array: inputArray)
            sortedArray.append(inputArray[indexOfMin])
            inputArray.remove(at: indexOfMin)
        }
        return sortedArray
    }
    
    private class func findMinimum<T:Comparable>(array:[T]) -> Int {
        var indexOfMinValue:Int = 0
        var minValue:T = array[0]
        for index in 1..<array.count {
            if array[index] < minValue {
                minValue = array[index]
                indexOfMinValue = index
            }
        }
        return indexOfMinValue
    }
    
    // Chapter 4
    class func quickSort<T:Comparable>(array:[T]) -> [T] {
        if array.count < 2 {
            return array
        }
        print("quicksort: \(array.count)")
        let pivotIndex = array.count/2
        let pivot = array[pivotIndex]
        var newArray = array
        newArray.remove(at: pivotIndex)
        
        var smaller:[T] = []
        var larger:[T] = []
        
        for index in 0..<newArray.count {
            if newArray[index] <= pivot  {
                smaller.append(newArray[index])
            } else {
                larger.append(newArray[index])
            }
        }
        
        return quickSort(array:smaller) + [pivot] + quickSort(array:larger)
    }
    
    // Mentioned in Chapter 4
    class func mergeSort<T:Comparable>(array:[T]) -> [T] {
        //print("merge sort on \(array)")
        if array.count < 2 {
            return array
        }
        let pivotIndex = array.count/2
        //print("pivot Index = \(pivotIndex)")
        var left = Array(array[0..<pivotIndex])
        var right = Array(array[pivotIndex..<array.count])
        var combined = array
        
        left = mergeSort(array: left)
        right = mergeSort(array: right)
        //print("left = \(left)")
        //print("right = \(right)")
        
        var leftIndex = 0
        var rightIndex = 0
        var combinedIndex = 0
        
        while leftIndex < left.count && rightIndex < right.count {
            if left[leftIndex] < right[rightIndex] {
                //print("adding \(left[leftIndex]) to array")
                combined[combinedIndex] = left[leftIndex]
                leftIndex += 1
            } else {
                //print("adding \(right[rightIndex]) to array")
                combined[combinedIndex] = right[rightIndex]
                rightIndex += 1
            }
            combinedIndex += 1
        }
        //print("combined 1 = \(combined)")
        
        while leftIndex < left.count {
            print("adding left over \(left[leftIndex]) to array")
            combined[combinedIndex] = left[leftIndex]
            leftIndex += 1
            combinedIndex += 1
        }
        //print("combined 2 = \(combined)")
        
        while rightIndex < right.count {
            //print("adding left over \(right[rightIndex]) to array")
            combined[combinedIndex] = right[rightIndex]
            rightIndex += 1
            combinedIndex += 1
        }
        //print("combined 3 = \(combined)")
        
        return combined
    }
    
    // Chapter 6
    class func topologicalSort<T:Comparable>(graph:[T: [T]], startNode: T) -> [T] {
        var queue = Queue<T>()
        guard let firstItems = graph[startNode] else { return [] }
        queue.enqueue(items: firstItems)
        
        var sortedArray:[T] = [startNode]
        
        while !queue.isEmpty() {
            if let dequeuedItem = queue.dequeue() {
                sortedArray.append(dequeuedItem)
                
                if let nextItems = graph[dequeuedItem] {
                  queue.enqueue(items: nextItems)
                }
            }
        }
        
        print("sorted array: \(sortedArray)")
        return sortedArray
    }
}
