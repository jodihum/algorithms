//
//  QueueTests.swift
//  AlgorithmsTests
//
//  Created by Josephine Humphreys on 11/7/19.
//  Copyright © 2019 Jhoom. All rights reserved.
//

import XCTest
@testable import Algorithms

class QueueTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEnqueueAddsItemToEndOfQueue() {
        var myQueue = Queue<String>()
        var stringsToAdd: [String]?
        XCTContext.runActivity(named: "GIVEN a queue and item to add") { _ in
            stringsToAdd = ["One","Two","Three"]
        }
        
        XCTContext.runActivity(named: "WHEN new items are added to the queue") { _ in
            for string in stringsToAdd! {
                myQueue.enqueue(item:string)
            }
        }
        
        XCTContext.runActivity(named: "THEN they are added to the end of the queue") { _ in
            XCTAssertEqual(myQueue.queuedItems[0], "One")
            XCTAssertEqual(myQueue.queuedItems[1], "Two")
            XCTAssertEqual(myQueue.queuedItems[2], "Three")
        }
    }
    
    func testDequeueReturnsFirstItemInQueue() {
        var myQueue = Queue<String>()
        XCTContext.runActivity(named: "GIVEN a queue containing several items") { _ in
            let stringsToAdd = ["One","Two","Three"]
            for string in stringsToAdd {
                myQueue.enqueue(item:string)
            }
        }
        
        var dequeuedString: String?
        XCTContext.runActivity(named: "WHEN item is dequeued") { _ in
            dequeuedString = myQueue.dequeue()
        }
        
        XCTContext.runActivity(named: "THEN it returns the first item in the queue") { _ in
            XCTAssertEqual(dequeuedString, "One")
        }
    }
    
    func testDequeueReturnsNilIfNoItems() {
        var myQueue = Queue<String>()
        XCTContext.runActivity(named: "GIVEN a queue with no items") { _ in
        }
        
        var dequeuedString: String?
        XCTContext.runActivity(named: "WHEN trying to dequeue") { _ in
            dequeuedString = myQueue.dequeue()
        }
        
        XCTContext.runActivity(named: "THEN it returns nil") { _ in
            XCTAssertNil(dequeuedString)
        }
    }
    
    func testDequeueRemovesFirstItemInQueue() {
        var myQueue = Queue<String>()
        XCTContext.runActivity(named: "GIVEN a queue containing several items") { _ in
            let stringsToAdd = ["One","Two","Three"]
            for string in stringsToAdd {
                myQueue.enqueue(item:string)
            }
        }
        
        XCTContext.runActivity(named: "WHEN item is dequeued") { _ in
            _ = myQueue.dequeue()
        }
        
        XCTContext.runActivity(named: "THEN it returns the first item in the queue") { _ in
            XCTAssertEqual(myQueue.queuedItems[0], "Two")
        }
    }
    
    func testEnqueueAddsArrayOfItemsToEndOfQueue() {
        var myQueue = Queue<String>()
        var stringsToAdd: [String]?
        XCTContext.runActivity(named: "GIVEN a queue and item to add") { _ in
            stringsToAdd = ["One","Two","Three"]
        }
        
        XCTContext.runActivity(named: "WHEN new items are added to the queue") { _ in
            myQueue.enqueue(items: stringsToAdd!)
        }
        
        XCTContext.runActivity(named: "THEN they are added to the end of the queue") { _ in
            XCTAssertEqual(myQueue.queuedItems[0], "One")
            XCTAssertEqual(myQueue.queuedItems[1], "Two")
            XCTAssertEqual(myQueue.queuedItems[2], "Three")
        }
    }
    
    func testIsEmptyTrueIfEmpty() {
        var myQueue = Queue<String>()
        var stringsToAdd: [String]?
        XCTContext.runActivity(named: "GIVEN a queue containing items") { _ in
            stringsToAdd = ["One","Two","Three"]
            myQueue.enqueue(items: stringsToAdd!)
        }
        
        var empty = true
        XCTContext.runActivity(named: "WHEN check if empty") { _ in
            empty = myQueue.isEmpty()
        }
        
        XCTContext.runActivity(named: "THEN isEmpty = False") { _ in
            XCTAssertFalse(empty)
        }
    }
    
    func testIsEmptyFalseIfNotEmpty() {
        let myQueue = Queue<String>()
        XCTContext.runActivity(named: "GIVEN a queue not containing items") { _ in
       
        }
        
        var empty = false
        XCTContext.runActivity(named: "WHEN check if empty") { _ in
            empty = myQueue.isEmpty()
        }
        
        XCTContext.runActivity(named: "THEN isEmpty = True") { _ in
            XCTAssertTrue(empty)
        }
    }

}
