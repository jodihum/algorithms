//
//  ClassroomSchedulingTests.swift
//  AlgorithmsTests
//
//  Created by Josephine Humphreys on 11/12/19.
//  Copyright © 2019 Jhoom. All rights reserved.
//

import XCTest
@testable import Algorithms

class ClassroomSchedulingTests: XCTestCase {

    func testLargestNumberOfClassesScheduled() {
        var courses = [Course]()
        XCTContext.runActivity(named: "GIVEN a list of classes with start and end times" ) { _ in
            courses = makeClassList()
        }
        
        var scheduledClasses = [Course]()
        XCTContext.runActivity(named: "WHEN classes are scheduled" ) { _ in
            scheduledClasses = GreedyAlgorithms.greedyClassScheduler(potentialClasses: courses, startTime: "9:00 AM", endTime: "12:00 PM")
        }
        
        XCTContext.runActivity(named: "THEN the maximum number of classes are scheduled" ) { _ in
            XCTAssertEqual(scheduledClasses,  expectedClasses())
        }
    }
    
    func testDoesNotIncludeClassesThatRunTooLate() {
        var courses = [Course]()
        XCTContext.runActivity(named: "GIVEN a list of classes with start and end times" ) { _ in
            courses = makeClassList2()
        }
        
        var scheduledClasses = [Course]()
        XCTContext.runActivity(named: "WHEN classes are scheduled" ) { _ in
            scheduledClasses = GreedyAlgorithms.greedyClassScheduler(potentialClasses: courses, startTime: "9:00 AM", endTime: "12:00 PM")
        }
        
        XCTContext.runActivity(named: "THEN classes ending after end time are not scheduled" ) { _ in
            XCTAssertEqual(scheduledClasses,  expectedClasses2())
        }
    }
    
    func testPicksClassThatEndsEarliestNotStartsEarliest() {
        var courses = [Course]()
        XCTContext.runActivity(named: "GIVEN a list of classes with start and end times" ) { _ in
            courses = makeClassList3()
        }
        
        var scheduledClasses = [Course]()
        XCTContext.runActivity(named: "WHEN classes are scheduled" ) { _ in
            scheduledClasses = GreedyAlgorithms.greedyClassScheduler(potentialClasses: courses, startTime: "9:00 AM", endTime: "12:00 PM")
        }
        
        XCTContext.runActivity(named: "THEN the classes are chosen based on earliest end time" ) { _ in
            XCTAssertEqual(scheduledClasses,  expectedClasses3())
        }
    }
    
    func testIgnoresClassesThatStartTooEarly() {
        var courses = [Course]()
        XCTContext.runActivity(named: "GIVEN a list of classes with start and end times" ) { _ in
            courses = makeClassList4()
        }
        
        var scheduledClasses = [Course]()
        XCTContext.runActivity(named: "WHEN classes are scheduled" ) { _ in
            scheduledClasses = GreedyAlgorithms.greedyClassScheduler(potentialClasses: courses, startTime: "9:00 AM", endTime: "12:00 PM")
        }
        
        XCTContext.runActivity(named: "THEN the classes that start too early are ignored" ) { _ in
            XCTAssertEqual(scheduledClasses,  expectedClasses4())
        }
    }

    
    private func makeClassList() -> [Course] {
        return [Course(name: "Art", startTime: "9:00 AM", endTime: "10:00 AM"),
                Course(name: "English", startTime: "9:30 AM", endTime: "10:30 AM"),
                Course(name: "Math", startTime: "10:00 AM", endTime: "11:00 AM"),
                Course(name: "CS", startTime: "10:30 AM", endTime: "11:30 AM"),
                Course(name: "Music", startTime: "11:00 AM", endTime: "12:00 PM")
            ]
    }
    
    private func makeClassList2() -> [Course] {
        return [Course(name: "Art", startTime: "9:00 AM", endTime: "10:00 AM"),
                Course(name: "English", startTime: "9:30 AM", endTime: "10:30 AM"),
                Course(name: "Math", startTime: "10:00 AM", endTime: "11:00 AM"),
                Course(name: "CS", startTime: "10:30 AM", endTime: "11:30 AM"),
                Course(name: "Music", startTime: "11:00 AM", endTime: "12:30 PM")
            ]
    }
    
    private func makeClassList3() -> [Course] {
        return [Course(name: "Art", startTime: "9:45 AM", endTime: "10:00 AM"),
                Course(name: "English", startTime: "9:00 AM", endTime: "10:30 AM"),
                Course(name: "Math", startTime: "10:30 AM", endTime: "11:00 AM"),
                Course(name: "CS", startTime: "10:15 AM", endTime: "11:30 AM"),
                Course(name: "Music", startTime: "11:00 AM", endTime: "12:00 PM")
            ]
    }
    
    private func makeClassList4() -> [Course] {
           return [Course(name: "Art", startTime: "8:59 AM", endTime: "10:00 AM"),
                   Course(name: "English", startTime: "9:30 AM", endTime: "10:30 AM"),
                   Course(name: "Math", startTime: "10:00 AM", endTime: "11:00 AM"),
                   Course(name: "CS", startTime: "10:30 AM", endTime: "11:30 AM"),
                   Course(name: "Music", startTime: "11:00 AM", endTime: "12:00 PM")
               ]
       }
    
    private func expectedClasses() -> [Course] {
        return [Course(name: "Art", startTime: "9:00 AM", endTime: "10:00 AM"),
                Course(name: "Math", startTime: "10:00 AM", endTime: "11:00 AM"),
                Course(name: "Music", startTime: "11:00 AM", endTime: "12:00 PM")
            ]
    }
    
    private func expectedClasses2() -> [Course] {
        return [Course(name: "Art", startTime: "9:00 AM", endTime: "10:00 AM"),
                Course(name: "Math", startTime: "10:00 AM", endTime: "11:00 AM")
            ]
    }
    
    private func expectedClasses3() -> [Course] {
           return [Course(name: "Art", startTime: "9:45 AM", endTime: "10:00 AM"),
                   Course(name: "Math", startTime: "10:30 AM", endTime: "11:00 AM"),
                   Course(name: "Music", startTime: "11:00 AM", endTime: "12:00 PM")
               ]
       }
    
    private func expectedClasses4() -> [Course] {
        return [Course(name: "English", startTime: "9:30 AM", endTime: "10:30 AM"),
                Course(name: "CS", startTime: "10:30 AM", endTime: "11:30 AM")
            ]
    }
    
}
