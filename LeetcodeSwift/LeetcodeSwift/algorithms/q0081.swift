//
//  q0081.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 10/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//81. Search in Rotated Sorted Array II
//Medium
//
//996
//
//416
//
//Add to List
//
//Share
//Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
//
//(i.e., [0,0,1,2,2,5,6] might become [2,5,6,0,0,1,2]).
//
//You are given a target value to search. If found in the array return true, otherwise return false.
//
//Example 1:
//
//Input: nums = [2,5,6,0,0,1,2], target = 0
//Output: true
//Example 2:
//
//Input: nums = [2,5,6,0,0,1,2], target = 3
//Output: false
//Follow up:
//
//This is a follow up problem to Search in Rotated Sorted Array, where nums may contain duplicates.
//Would this affect the run-time complexity? How and why?
//Accepted
//213,538
//Submissions
//648,423
class q0081Solution {    
    func search_helper(_ nums: [Int], _ target: Int, start: Int, end:Int) -> Bool {
        var left = start
        var right = end
        while left <= right {
            let mid = (right + left) / 2
            if nums[mid] == target {
                return true
            }else if nums[mid] == nums[left]{
                return search_helper(nums, target, start: left, end: mid - 1) || search_helper(nums, target, start: mid + 1, end: right)
            }else if nums[mid] > target{
                if nums[left] <= nums[mid] && nums[left] > target {
                    left = mid + 1
                }else{
                    right = mid - 1
                }
            }else{
                if nums[left] > nums[mid] && nums[left] <= target{
                    right = mid - 1
                }else{
                    left = mid + 1
                }
            }
        }
        return false
    }
    func search(_ nums: [Int], _ target: Int) -> Bool {
        return search_helper(nums, target, start: 0, end: nums.count - 1)
    }
}
func q0081(){
    let solution = q0081Solution()
    let candidates = [1,3,1,1,1]
    let target = 3
    let result = solution.search(candidates, target)
    print(result)
}
