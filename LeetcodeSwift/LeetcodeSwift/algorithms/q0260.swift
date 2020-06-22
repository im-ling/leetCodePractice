//
//  q0260.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 22/06/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//260. Single Number III
//Medium
//
//1381
//
//97
//
//Add to List
//
//Share
//Given an array of numbers nums, in which exactly two elements appear only once and all the other elements appear exactly twice. Find the two elements that appear only once.
//
//Example:
//
//Input:  [1,2,1,3,2,5]
//Output: [3,5]
//Note:
//
//The order of the result is not important. So in the above example, [5, 3] is also correct.
//Your algorithm should run in linear runtime complexity. Could you implement it using only constant space complexity?
//Accepted
//136,126
//Submissions
//224,045
class q0260Solution {
    func singleNumber(_ nums: [Int]) -> [Int] {
        var result = [Int]()
        var sum = 0
        for num in nums {
            sum ^= num
        }
        var flagNumber = 1
        while flagNumber & sum == 0 {
            flagNumber <<= 1
        }
        var sum2 = 0
        for num in nums {
            if flagNumber & num > 0 {
                sum2 ^= num
            }
        }
        result.append(sum2)
        result.append(sum2 ^ sum)
        return result
    }
}
