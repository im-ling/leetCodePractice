//
//  q0416.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 26/02/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation

//416. Partition Equal Subset Sum
//Medium
//
//1931
//
//56
//
//Add to List
//
//Share
//Given a non-empty array containing only positive integers, find if the array can be partitioned into two subsets such that the sum of elements in both subsets is equal.
//
//Note:
//
//Each of the array element will not exceed 100.
//The array size will not exceed 200.
// 
//
//Example 1:
//
//Input: [1, 5, 11, 5]
//
//Output: true
//
//Explanation: The array can be partitioned as [1, 5, 5] and [11].
// 
//
//Example 2:
//
//Input: [1, 2, 3, 5]
//
//Output: false
//
//Explanation: The array cannot be partitioned into equal sum subsets.
// 
//
//Accepted
//137,748
//Submissions
//325,551

class q0416Solution {
    
    func canPartition_helper(_ nums: [Int], position: Int, target: Int) -> Bool {
        if target == 0 {
            return true
        }else if target < 0 || position >= nums.count{
            return false
        }
        if canPartition_helper(nums, position: position + 1, target: target - nums[position]) || canPartition_helper(nums, position: position + 1, target: target){
            return true
        }
        return false
    }

    func canPartition(_ nums: [Int]) -> Bool {
        var sum = 0
        var max = nums[0]
        for i in nums {
            sum += i
            if max < i{
                max = i
            }
        }
        if sum % 2 == 0 && max <= sum / 2{
            return canPartition_helper(nums.sorted().reversed(), position: 0, target: sum / 2)
        }
        return false
    }

//    dp solution
    func canPartition2(_ nums: [Int]) -> Bool {
        var sum = 0
        var max = nums[0]
        for i in nums {
            sum += i
            if max < i{
                max = i
            }
        }
        let volumn = sum / 2
        if sum % 2 == 0 && max <= volumn{
            var boolArray = [Bool].init(repeating: false, count: volumn + 1)
            boolArray[0] = true
            for i in nums {
                for j in (i...volumn).reversed(){
                    boolArray[j] = boolArray[j] || boolArray[j - i]
                }
            }
            return boolArray[volumn]
        }
        return false
    }
}

func q0416() -> () {
//    let nums = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,100]
    let nums = [2,2,3,5]
    let result = q0416Solution().canPartition2(nums)
    print(result)
}
