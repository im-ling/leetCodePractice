//
//  q0033.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 10/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//33. Search in Rotated Sorted Array
//Medium
//
//3861
//
//405
//
//Add to List
//
//Share
//Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
//
//(i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).
//
//You are given a target value to search. If found in the array return its index, otherwise return -1.
//
//You may assume no duplicate exists in the array.
//
//Your algorithm's runtime complexity must be in the order of O(log n).
//
//Example 1:
//
//Input: nums = [4,5,6,7,0,1,2], target = 0
//Output: 4
//Example 2:
//
//Input: nums = [4,5,6,7,0,1,2], target = 3
//Output: -1
//Accepted
//586,432
//Submissions
//1,743,259
class q0033Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = (left + right) / 2
//            print(left,right,mid)
            if nums[mid] == target {
                return mid
            }else if nums[mid] > target{
                if nums[left] <= nums[mid] && nums[left] > target {
                    left = mid + 1
                }else{
                    right = mid - 1
                }
            }else{
                if nums[left] > nums[mid] && nums[left] <= target {
                    right = mid - 1
                }else{
                    left = mid + 1
                }
            }
        }
        return -1
    }
}

func q0033() -> () {
    let solution = q0033Solution()
    let candidates = [4,5,6,7,0,1,2]
    let target = 0
    let result = solution.search(candidates, target)
    print(result)
}
