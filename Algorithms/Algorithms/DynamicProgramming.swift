//
//  DynamicProgramming.swift
//  Algorithms
//
//  Created by Josephine Humphreys on 11/26/19.
//  Copyright © 2019 Jhoom. All rights reserved.
//

import Foundation

struct PossibleChoice: Equatable {
    var name: String
    var cost: Double
    var value: Int
}

struct GridElement: Equatable {

    var items: [PossibleChoice] = []
    
    func totalCost() -> Double {
        return items.map({$0.cost}).reduce(0, +)
    }
    
    func totalValue() -> Int {
        return items.map({$0.value}).reduce(0, +)
    }

}

// modified from swift.org https://docs.swift.org/swift-book/LanguageGuide/Subscripts.html
struct Matrix<T> {
    let rows: Int, columns: Int
    var grid: [T]
    
    init(rows: Int, columns: Int, defaultValue:T) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: defaultValue, count: rows * columns)
    }
    
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> T {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

/* To make strings indexable - from StackOverflow https://stackoverflow.com/questions/24092884/get-nth-character-of-a-string-in-swift-programming-language
 */
extension StringProtocol {
    subscript(_ offset: Int)                     -> Element     { self[index(startIndex, offsetBy: offset)] }
    subscript(_ range: Range<Int>)               -> SubSequence { prefix(range.lowerBound+range.count).suffix(range.count) }
    subscript(_ range: ClosedRange<Int>)         -> SubSequence { prefix(range.lowerBound+range.count).suffix(range.count) }
    subscript(_ range: PartialRangeThrough<Int>) -> SubSequence { prefix(range.upperBound.advanced(by: 1)) }
    subscript(_ range: PartialRangeUpTo<Int>)    -> SubSequence { prefix(range.upperBound) }
    subscript(_ range: PartialRangeFrom<Int>)    -> SubSequence { suffix(Swift.max(0, count-range.lowerBound)) }
}

extension LosslessStringConvertible {
    var string: String { .init(self) }
}

extension BidirectionalCollection {
    subscript(safe offset: Int) -> Element? {
        guard !isEmpty, let i = index(startIndex, offsetBy: offset, limitedBy: index(before: endIndex)) else { return nil }
        return self[i]
    }
}

// Chapter 9
class DynamicProgramming {
    class func optimizeChoices(from allItems: [PossibleChoice], maxCost: Double, spacing: Double) -> GridElement {
        var grid = Matrix(rows: allItems.count, columns: Int(maxCost/spacing), defaultValue: GridElement())
      
        for row in 0..<allItems.count {
            let thisItem = allItems[row]
            
            for column in 0..<Int(maxCost/spacing) {
                let columnCost = spacing + (Double(column) * spacing)
                if row == 0 {
                    if thisItem.cost <= columnCost {
                        grid[0,column] = GridElement(items: [thisItem])
                    }
                } else {
                    let gridElementAbove = grid[row-1, column]
                    if thisItem.cost > columnCost {
                        grid[row,column] = grid[row-1, column]
                    } else if thisItem.cost + gridElementAbove.totalCost() <= columnCost {
                        var newItems = gridElementAbove.items
                        newItems.append(thisItem)
                        grid[row,column] = GridElement(items: newItems)
                    } else {
                        let oldMax = grid[row-1, column].totalValue()
                        
                        var newAmount = thisItem.value
                        var newCost = thisItem.cost
                        var newItems = [thisItem]
                        
                        if thisItem.cost < columnCost {
                            let amountToGoBack = Int(thisItem.cost/spacing) // TODO Test this
                            let gridToAddFrom = grid[row - 1, column - amountToGoBack]
                            newCost += gridToAddFrom.totalCost()
                            newAmount += gridToAddFrom.totalValue()
                            newItems = gridToAddFrom.items
                            newItems.append(thisItem)
                        }
                        
                        if oldMax > newAmount {
                            grid[row,column] = grid[row-1, column]
                        } else {
                            grid[row,column] = GridElement(items: newItems)
                        }
                    }
                }
            }
        }
        
        return grid[allItems.count - 1, Int(maxCost/spacing - spacing)]
    }
    
    class func longestSubstring(firstWord: String, secondWord: String) -> String {
        var grid = Matrix(rows: firstWord.count, columns: secondWord.count, defaultValue: 0)
        var maxValue = 0
        var maxRow = 0
        var maxColumn = 0
        
        // fill grid
        for row in 0..<firstWord.count {
            let rowLetter = firstWord[row]
            
            for column in 0..<secondWord.count {
                let columnLetter = secondWord[column]
                
                if rowLetter == columnLetter {
                    if row == 0 || column == 0 {
                        grid[row, column] = 1
                        if maxValue == 0 {
                            maxValue = 1
                            maxRow = row
                            maxColumn = column
                        }
                    } else {
                        let newValue = 1 + grid[row - 1, column - 1]
                        grid[row, column] = newValue
                        if newValue > maxValue {
                            maxValue = newValue
                            maxRow = row
                            maxColumn = column
                        }
                    }
                }
            }
        }
        
        // retrieve substring
        var substring = String(firstWord[maxRow])
        
        var thisRow = maxRow
        var thisColumn = maxColumn
        while thisRow > 0 && thisColumn > 0 && grid[thisRow, thisColumn] > 1 {
            let newCharacter = firstWord[thisRow - 1]
            substring = String(newCharacter) + substring
            thisRow -= 1
            thisColumn -= 1
        }
        
        return substring
    }
    
    
    class func longestSubsequence(firstWord: String, secondWord: String) -> String {
        var grid = Matrix(rows: firstWord.count, columns: secondWord.count, defaultValue: 0)
        var maxValue = 0
        var maxRow = 0
        var maxColumn = 0
        
        // fill grid
        for row in 0..<firstWord.count {
            let rowLetter = firstWord[row]
            
            for column in 0..<secondWord.count {
                let columnLetter = secondWord[column]
                
                if rowLetter == columnLetter {
                    if row == 0 || column == 0 {
                        grid[row, column] = 1
                        if maxValue == 0 {
                            maxValue = 1
                            maxRow = row
                            maxColumn = column
                        }
                    } else {
                        let newValue = 1 + grid[row - 1, column - 1]
                        grid[row, column] = newValue
                        if newValue > maxValue {
                            maxValue = newValue
                            maxRow = row
                            maxColumn = column
                        }
                    }
                } else {
                    var oldRowValue = 0
                    var oldColumnValue = 0
                    if row > 0 {
                        oldRowValue = grid[row - 1, column]
                    }
                    if column > 0 {
                        oldColumnValue = grid[row, column - 1]
                    }
                    grid[row, column] = max(oldRowValue, oldColumnValue)
                }
            }
        }
        
        
        // retrieve substring
        var substring = ""
        
        var thisRow = maxRow
        var thisColumn = maxColumn
        while thisRow > 0 && thisColumn > 0 && grid[thisRow, thisColumn] > 0 {
            let newCharacter = firstWord[thisRow]
            let thisValue = grid[thisRow, thisColumn]
            let nextValue = grid[thisRow - 1, thisColumn - 1]
            if nextValue != thisValue {
                substring = String(newCharacter) + substring
            }
            thisRow -= 1
            thisColumn -= 1
        }
        if grid[thisRow, thisColumn] == 1 {
            substring = String(firstWord[0]) + substring
        }
               
        return substring
    }
}
