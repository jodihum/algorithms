//
//  KNearestNeighbors.swift
//  Algorithms
//
//  Created by Josephine Humphreys on 12/3/19.
//  Copyright © 2019 Jhoom. All rights reserved.
//

import Foundation



protocol Measurable {
    var features: [Double] { get set }
}

struct ClassifiableItem: Measurable {
    var category: String?
    var features: [Double]
}

struct RegressableItem: Measurable {
    var value: Double?
    var features: [Double]
}

class KNearestNeighbors {
    
    class func classify(item: ClassifiableItem, using referenceItems: [ClassifiableItem], k: Int) -> String? {
        guard let kNearest = knearest(item: item, referenceItems: referenceItems, k: k) as? [(ClassifiableItem ,Double)] else { return nil}
        
        var categories = [String: Int]()
        for nearest in kNearest  {
            if let category = nearest.0.category {
                if let oldValue = categories[category] {
                    categories[category] = oldValue + 1
                } else {
                    categories[category] = 1
                }
            }
        }
        let sortedCategories = categories.sorted(by: { $0.value > $1.value} )
        
        return sortedCategories.first?.key
    }
    
    class func regression(item: RegressableItem, using referenceItems: [RegressableItem], k: Int) -> Double? {
        guard let kNearest = knearest(item: item, referenceItems: referenceItems, k: k) as? [(RegressableItem ,Double)] else { return nil}
        return kNearest.map({$0.0.value ?? 0}).reduce(0,+)/Double(k)
    }
    
    private class func knearest(item: Measurable, referenceItems: [Measurable], k: Int) -> [(Measurable ,Double)] {
        var distances = [(item:Measurable, distance:Double)]()
        for testItem in referenceItems {
            var sum: Double = 0
            for i in 0..<item.features.count {
                sum = sum + pow((item.features[i] - testItem.features[i]),2)
            }
            let totalDistance = sqrt(sum)
            distances.append((testItem, totalDistance))
        }
        let sortedDistances = distances.sorted(by: { $0.distance < $1.distance } )
        return Array(sortedDistances[0..<k])
    }
    
}

