//
//  SortPerformanceTests.swift
//  AlgorithmsTests
//
//  Created by Josephine Humphreys on 15/08/2018.
//  Copyright © 2018 Jhoom. All rights reserved.
//

import XCTest
@testable import Algorithms

class SortPerformanceTests: XCTestCase {
    
    
    func testSelectionSort100Items() {
        let array:[Double] = randomDoubleArray(size: 100, min: 0, max: 10000)
            
        self.measure {
            _ = SortAlgorithms.selectionSort(array: array)
        }
    }
    
    func testSelectionSort1000Items() {
        let array:[Double] = randomDoubleArray(size: 1000, min: 0, max: 10000)
        
        self.measure {
            _ = SortAlgorithms.selectionSort(array: array)
        }
    }
    
    func testSelectionSort5000Items() {
        let array:[Double] = randomDoubleArray(size: 5000, min: 0, max: 10000)
        
        self.measure {
            _ = SortAlgorithms.selectionSort(array: array)
        }
    }
    
    func testQuickSort100Items() {
        let array:[Double] = randomDoubleArray(size: 100, min: 0, max: 10000)
        
        self.measure {
            _ = SortAlgorithms.quickSort(array: array)
        }
    }
    
    func testQuickSort1000Items() {
        let array:[Double] = randomDoubleArray(size: 1000, min: 0, max: 10000)
        
        self.measure {
            _ = SortAlgorithms.quickSort(array: array)
        }
    }
    
    func testQuickSort5000Items() {
        let array:[Double] = randomDoubleArray(size: 5000, min: 0, max: 10000)
        
        self.measure {
            _ = SortAlgorithms.quickSort(array: array)
        }
    }
    
    func testMergeSort100Items() {
        let array:[Double] = randomDoubleArray(size: 100, min: 0, max: 10000)
            
        self.measure {
            _ = SortAlgorithms.mergeSort(array: array)
        }
    }
    
    func testMergeSort1000Items() {
        let array:[Double] = randomDoubleArray(size: 1000, min: 0, max: 10000)
        
        self.measure {
            _ = SortAlgorithms.mergeSort(array: array)
        }
    }
    
    func testMergeSort5000Items() {
        let array:[Double] = randomDoubleArray(size: 5000, min: 0, max: 10000)
        
        self.measure {
            _ = SortAlgorithms.mergeSort(array: array)
        }
    }
    
    
    private func random(min: Double, max: Double, seed:Int) -> Double {
        srand48(seed)
        return min + drand48()*(max - min)
    }
    
    private func randomDoubleArray(size:Int,min: Double, max: Double ) -> [Double] {
        var array:[Double] = []
        for index:Int in 0..<size {
            array.append(random(min:min, max:max, seed:index ))
        }
        return array
    }

    
}
