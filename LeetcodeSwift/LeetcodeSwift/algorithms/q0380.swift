//
//  q0380.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 12/06/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//380. Insert Delete GetRandom O(1)
//Medium
//
//2190
//
//139
//
//Add to List
//
//Share
//Design a data structure that supports all following operations in average O(1) time.
//
//insert(val): Inserts an item val to the set if not already present.
//remove(val): Removes an item val from the set if present.
//getRandom: Returns a random element from current set of elements. Each element must have the same probability of being returned.
//Example:
//
//// Init an empty set.
//RandomizedSet randomSet = new RandomizedSet();
//
//// Inserts 1 to the set. Returns true as 1 was inserted successfully.
//randomSet.insert(1);
//
//// Returns false as 2 does not exist in the set.
//randomSet.remove(2);
//
//// Inserts 2 to the set, returns true. Set now contains [1,2].
//randomSet.insert(2);
//
//// getRandom should return either 1 or 2 randomly.
//randomSet.getRandom();
//
//// Removes 1 from the set, returns true. Set now contains [2].
//randomSet.remove(1);
//
//// 2 was already in the set, so return false.
//randomSet.insert(2);
//
//// Since 2 is the only number in the set, getRandom always return 2.
//randomSet.getRandom();
//Accepted
//205,571
//Submissions
//441,327


class RandomizedSet {
    var set = Set<Int>.init()
    /** Initialize your data structure here. */
    init() {
        set.removeAll()
    }
    
    /** Inserts a value to the set. Returns true if the set did not already contain the specified element. */
    func insert(_ val: Int) -> Bool {
        if set.contains(val) {
            return false
        }else{
            set.insert(val)
        }
        return true
    }
    
    /** Removes a value from the set. Returns true if the set contained the specified element. */
    func remove(_ val: Int) -> Bool {
        if set.contains(val) {
            set.remove(val)
            return true
        }
        return false
    }
    
    /** Get a random element from the set. */
    func getRandom() -> Int {
        if set.count > 0 {
            return set.randomElement()!
        }
        return -1
    }
}

/**
 * Your RandomizedSet object will be instantiated and called as such:
 * let obj = RandomizedSet()
 * let ret_1: Bool = obj.insert(val)
 * let ret_2: Bool = obj.remove(val)
 * let ret_3: Int = obj.getRandom()
 */
