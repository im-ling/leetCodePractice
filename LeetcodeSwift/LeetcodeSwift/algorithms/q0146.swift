//
//  q0146.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 24/04/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//146. LRU Cache
//Medium
//
//5052
//
//227
//
//Add to List
//
//Share
//Design and implement a data structure for Least Recently Used (LRU) cache. It should support the following operations: get and put.
//
//get(key) - Get the value (will always be positive) of the key if the key exists in the cache, otherwise return -1.
//put(key, value) - Set or insert the value if the key is not already present. When the cache reached its capacity, it should invalidate the least recently used item before inserting a new item.
//
//The cache is initialized with a positive capacity.
//
//Follow up:
//Could you do both operations in O(1) time complexity?
//
//Example:
//
//LRUCache cache = new LRUCache( 2 /* capacity */ );
//
//cache.put(1, 1);
//cache.put(2, 2);
//cache.get(1);       // returns 1
//cache.put(3, 3);    // evicts key 2
//cache.get(2);       // returns -1 (not found)
//cache.put(4, 4);    // evicts key 1
//cache.get(1);       // returns -1 (not found)
//cache.get(3);       // returns 3
//cache.get(4);       // returns 4
//
//
//Accepted
//476,364
//Submissions
//1,539,139

class LRUCache {
    var dic = [Int:Int]()
    var dicCount = [Int:Int]()
    var stack1 = [Int]()
    var capacity = 0

    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        if dic[key] != nil {
            stack1.append(key)
            dicCount[key]! += 1
            return dic[key]!
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        if dic[key] == nil && dic.count >= capacity{
            while dicCount[stack1.first!]! > 1 {
                dicCount[stack1.first!]! -= 1
                stack1.removeFirst()
            }
            dicCount.removeValue(forKey: stack1.first!)
            dic.removeValue(forKey: stack1.first!)
            stack1.removeFirst()
        }
        stack1.append(key)
        dic[key] = value
        dicCount[key] = (dicCount[key] ?? 0) + 1
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
func q0146() {
    let cache = LRUCache.init(2)
    cache.put(2, 1)
    cache.put(3, 2)
    print(cache.get(3))
    print(cache.get(2))
    cache.put(4, 3)
    print(cache.get(2))
    print(cache.get(3))
    print(cache.get(4))
}
