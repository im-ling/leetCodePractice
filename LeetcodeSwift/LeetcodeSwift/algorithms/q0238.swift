//
//  q0238.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 15/04/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//238. Product of Array Except Self
//Medium
//
//3979
//
//339
//
//Add to List
//
//Share
//Given an array nums of n integers where n > 1,  return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].
//
//Example:
//
//Input:  [1,2,3,4]
//Output: [24,12,8,6]
//Constraint: It's guaranteed that the product of the elements of any prefix or suffix of the array (including the whole array) fits in a 32 bit integer.
//
//Note: Please solve it without division and in O(n).
//
//Follow up:
//Could you solve it with constant space complexity? (The output array does not count as extra space for the purpose of space complexity analysis.)
//
//Accepted
//422,873
//Submissions
//715,110
class q0238Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var result = [Int].init(repeating: 1, count: nums.count)
        for i in 1..<nums.count {
            result[i] = result[i - 1] * nums[i - 1]
        }
        var temp = 1
        for i in (0..<nums.count - 1).reversed() {
            temp *= nums[i + 1]
            result[i] *= temp
        }
        return result
    }
}

func q0238(){
    let nums = [1,2,3,4]
    let result = q0238Solution().productExceptSelf(nums)
    print(result)
}
