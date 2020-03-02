//
//  q0053.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 02/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//53. Maximum Subarray
//Easy
//
//6386
//
//279
//
//Add to List
//
//Share
//Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
//
//Example:
//
//Input: [-2,1,-3,4,-1,2,1,-5,4],
//Output: 6
//Explanation: [4,-1,2,1] has the largest sum = 6.
//Follow up:
//
//If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.
//
//Accepted
//785,602
//Submissions
//1,719,350

class q0053Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var result = Int.min
        var sum = 0
        for i in nums {
            if sum < 0 {
                sum = 0
            }
            sum += i
            if sum > result {
                result = sum
            }
        }
        return result
    }
}

func q0053() -> () {
    let solution = q0053Solution()
    let array = [-2,1,-3,4,-1,2,1,-5,4]
    let result = solution.maxSubArray(array)
    print(result)
}
