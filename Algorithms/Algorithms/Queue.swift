//
//  Queue.swift
//  Algorithms
//
//  Created by Josephine Humphreys on 11/7/19.
//  Copyright © 2019 Jhoom. All rights reserved.
//

import Foundation

struct Queue<T> {
    
    var queuedItems: [T]  = []
    
    mutating func enqueue(item: T) {
        queuedItems.append(item)
    }
    
    mutating func enqueue(items: [T]) {
        for item in items {
           queuedItems.append(item)
        }
    }
    
    mutating func dequeue() -> T? {
        if let item = queuedItems.first {
            queuedItems.remove(at: 0)
            return item
        }
        return nil
    }
    
    func isEmpty() -> Bool {
        return queuedItems.count == 0
    }
}
