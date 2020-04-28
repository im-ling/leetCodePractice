//
//  day28.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 28/04/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//You have a queue of integers, you need to retrieve the first unique integer in the queue.
//
//Implement the FirstUnique class:
//
//FirstUnique(int[] nums) Initializes the object with the numbers in the queue.
//int showFirstUnique() returns the value of the first unique integer of the queue, and returns -1 if there is no such integer.
//void add(int value) insert value to the queue.
//
//
//Example 1:
//
//Input:
//["FirstUnique","showFirstUnique","add","showFirstUnique","add","showFirstUnique","add","showFirstUnique"]
//[[[2,3,5]],[],[5],[],[2],[],[3],[]]
//Output:
//[null,2,null,2,null,3,null,-1]
//
//Explanation:
//FirstUnique firstUnique = new FirstUnique([2,3,5]);
//firstUnique.showFirstUnique(); // return 2
//firstUnique.add(5);            // the queue is now [2,3,5,5]
//firstUnique.showFirstUnique(); // return 2
//firstUnique.add(2);            // the queue is now [2,3,5,5,2]
//firstUnique.showFirstUnique(); // return 3
//firstUnique.add(3);            // the queue is now [2,3,5,5,2,3]
//firstUnique.showFirstUnique(); // return -1
//
//Example 2:
//
//Input:
//["FirstUnique","showFirstUnique","add","add","add","add","add","showFirstUnique"]
//[[[7,7,7,7,7,7]],[],[7],[3],[3],[7],[17],[]]
//Output:
//[null,-1,null,null,null,null,null,17]
//
//Explanation:
//FirstUnique firstUnique = new FirstUnique([7,7,7,7,7,7]);
//firstUnique.showFirstUnique(); // return -1
//firstUnique.add(7);            // the queue is now [7,7,7,7,7,7,7]
//firstUnique.add(3);            // the queue is now [7,7,7,7,7,7,7,3]
//firstUnique.add(3);            // the queue is now [7,7,7,7,7,7,7,3,3]
//firstUnique.add(7);            // the queue is now [7,7,7,7,7,7,7,3,3,7]
//firstUnique.add(17);           // the queue is now [7,7,7,7,7,7,7,3,3,7,17]
//firstUnique.showFirstUnique(); // return 17
//
//Example 3:
//
//Input:
//["FirstUnique","showFirstUnique","add","showFirstUnique"]
//[[[809]],[],[809],[]]
//Output:
//[null,809,null,-1]
//
//Explanation:
//FirstUnique firstUnique = new FirstUnique([809]);
//firstUnique.showFirstUnique(); // return 809
//firstUnique.add(809);          // the queue is now [809,809]
//firstUnique.showFirstUnique(); // return -1
//
//
//
//Constraints:
//
//1 <= nums.length <= 10^5
//1 <= nums[i] <= 10^8
//1 <= value <= 10^8
//At most 50000 calls will be made to showFirstUnique and add.

class FirstUnique {
    
    var _nums = [Int]()
    var dic = [Int:Int]()

    init(_ nums: [Int]) {
        _nums = nums
        for i in nums {
            dic[i] = (dic[i] ?? 0) + 1
        }
        
        for i in (0..<_nums.count).reversed() {
            let value = _nums[i]
            if dic[value]! > 1 {
                _nums.remove(at: i)
            }
        }
    }
    
    func showFirstUnique() -> Int {
        if _nums.count > 0 {
            return _nums[0]
        }else{
            return -1
        }
    }
    
    func add(_ value: Int) {
        dic[value] = (dic[value] ?? 0) + 1
        if dic[value] == 1 {
            _nums.append(value)
        }else{
            while _nums.count > 0 && dic[_nums[0]]! > 1 {
                _nums.removeFirst()
            }
        }
    }
}

class FirstUnique2 {
    
    var _nums = [Int]()
    var dic1 = [Int:Int]()
    var dic2 = [Int:Int]()

    init(_ nums: [Int]) {
        _nums = nums
        for i in (0..<nums.count).reversed() {
            let value = _nums[i]
            if dic2[value] != nil {
            }else if dic1[value] != nil{
                dic2[value] = 2
                dic1.removeValue(forKey: value)
                _nums.remove(at: i)
            }else{
                dic1[value] = 1
            }
        }
        
        for i in (0..<_nums.count).reversed() {
            let value = _nums[i]
            if dic2[value] != nil {
                _nums.remove(at: i)
            }
        }
    }
    
    func showFirstUnique() -> Int {
        if _nums.count > 0 {
            return _nums[0]
        }else{
            return -1
        }
    }
    
    func add(_ value: Int) {
        if dic2[value] != nil {
        }else if dic1[value] != nil{
            dic2[value] = 2
            dic1.removeValue(forKey: value)
            if value == _nums[0] {
                while _nums.count > 0 && dic2[_nums[0]] != nil {
                    _nums.removeFirst()
                }
            }
        }else{
            dic1[value] = 1
            _nums.append(value)
        }
    }
}

/**
 * Your FirstUnique object will be instantiated and called as such:
 * let obj = FirstUnique(nums)
 * let ret_1: Int = obj.showFirstUnique()
 * obj.add(value)
 */

func day28(){
    let nums = [2,3,5]
    let obj = FirstUnique(nums)
    print(obj.showFirstUnique())
    print(obj.add(5))
    print(obj.showFirstUnique())
    print(obj.add(2))
    print(obj.showFirstUnique())
    print(obj.add(3))
    print(obj.showFirstUnique())
    
}
