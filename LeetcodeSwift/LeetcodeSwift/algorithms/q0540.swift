//
//  q0540.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 12/05/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//540. Single Element in a Sorted Array
//Medium
//
//1244
//
//76
//
//Add to List
//
//Share
//You are given a sorted array consisting of only integers where every element appears exactly twice, except for one element which appears exactly once. Find this single element that appears only once.
//
//
//
//Example 1:
//
//Input: [1,1,2,3,3,4,4,8,8]
//Output: 2
//Example 2:
//
//Input: [3,3,7,7,10,11,11]
//Output: 10
//
//
//Note: Your solution should run in O(log n) time and O(1) space.
class q0540Solution {
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        var resultIndex = nums.count - 1
        var left = 0
        var right = nums.count / 2 - 1

        while left <= right {
            let mid = (left + right) / 2
            let trueIndex = mid * 2
            if nums[trueIndex] == nums[trueIndex + 1] {
                left = mid + 1
            }else{
                resultIndex = trueIndex
                right = mid - 1
            }
        }
        return nums[resultIndex]
    }
}


func q0540(){
    let nums = [3]
    let result = q0540Solution().singleNonDuplicate(nums)
    print(result)
}
