//
//  q0137.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 22/06/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//137. Single Number II
//Medium
//
//1578
//
//331
//
//Add to List
//
//Share
//Given a non-empty array of integers, every element appears three times except for one, which appears exactly once. Find that single one.
//
//Note:
//
//Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
//
//Example 1:
//
//Input: [2,2,3,2]
//Output: 3
//Example 2:
//
//Input: [0,1,0,1,0,1,99]
//Output: 99
//Accepted
//219,678
//Submissions
//437,087
class q0137Solution {
    
    func singleNumber(_ nums: [Int]) -> Int {
        var x1 = 0
        var x2 = 0
        var mask = 0
        for num in nums {
            x2 ^= x1 & num
            x1 ^= num
            mask = ~(x1 & x2)
            x2 &= mask
            x1 &= mask
        }
        return x1
    }

    func singleNumber2(_ nums: [Int]) -> Int {
        var dic = [Int:Int]()
        for num in nums {
            dic[num] = (dic[num] ?? 0) + 1
            if dic[num]! == 3 {
                dic.removeValue(forKey: num)
            }
        }
        return dic.keys.first!
    }
}

func q0137(){
    let solu = q0137Solution()
    let nums = [1,1,1, 3]
    let result = solu.singleNumber(nums)
    print(result)
}
