//
//  Chapter10.swift
//  Algorithms
//
//  Created by Josephine Humphreys on 12/5/19.
//  Copyright © 2019 Jhoom. All rights reserved.
//

import Foundation

enum FruitType {
    case orange
    case grapefruit
}

struct Fruit {
    var category: FruitType?
    var size: Double
    var redness: Double
}

struct MovieFan: Equatable {
    var comedy: Double
    var action: Double
    var drama: Double
    var horror: Double
    var romance: Double
}


public class Chapter10 {
    
    // this just finds the 1 nearest neighbor
    // and only works for fruit
    class func determineType(of fruit:Fruit, from referenceFruit:[Fruit]) -> FruitType? {
        
        var closestFruit = referenceFruit[0]
        var closestDistance = Double.greatestFiniteMagnitude
        for testFruit in referenceFruit {
            let distance: Double = sqrt(pow(fruit.size - testFruit.size,2) + pow(fruit.redness - testFruit.redness,2))
            if distance < closestDistance {
                closestDistance = distance
                closestFruit = testFruit
            }
        }
        
        return closestFruit.category
    }


    class func determineMostSimilarFan(to fan: MovieFan, from referenceFans: [MovieFan]) -> MovieFan {
        
        var closestFan = referenceFans[0]
        var closestDistance = Double.greatestFiniteMagnitude
        for testFan in referenceFans {
            let distance: Double = sqrt(pow(fan.comedy - testFan.comedy,2) +
                                    pow(fan.action - testFan.action,2) +
                                    pow(fan.drama - testFan.drama,2) +
                                    pow(fan.horror - testFan.horror,2) +
                                    pow(fan.romance - testFan.romance,2)
                                    )
            if distance < closestDistance {
                closestDistance = distance
                closestFan = testFan
            }
        }
        
        return closestFan
    }

    
}
