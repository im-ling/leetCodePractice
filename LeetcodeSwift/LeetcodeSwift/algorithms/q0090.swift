//
//  q0090.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 13/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//90. Subsets II
//Medium
//
//1365
//
//59
//
//Add to List
//
//Share
//Given a collection of integers that might contain duplicates, nums, return all possible subsets (the power set).
//
//Note: The solution set must not contain duplicate subsets.
//
//Example:
//
//Input: [1,2,2]
//Output:
//[
//  [2],
//  [1],
//  [1,2,2],
//  [2,2],
//  [1,2],
//  []
//]
//Accepted
//252,659
//Submissions
//556,556
class q0090Solution {
    func subsetsWithDup_helper2(_ nums: [Int], path:inout [Int], start: Int, end:Int, result: inout [[Int]]){
        result.append(path)
        for i in start..<end {
            if i > start && nums[i] == nums[i - 1] {
                continue
            }
            path.append(nums[i])
            subsetsWithDup_helper2(nums, path: &path, start: i + 1, end: end, result: &result)
            path.removeLast()
        }
    }
    func subsetsWithDup_helper(_ nums: [Int], path:inout [Int], start: Int, end:Int, k:Int, result: inout [[Int]]){
        if path.count == k {
            result.append(path)
            return
        }
        if path.count + end - start < k {
            return
        }
        for i in start..<end {
            if i > start && nums[i] == nums[i - 1] {
                continue
            }
            path.append(nums[i])
            subsetsWithDup_helper(nums, path: &path, start: i + 1, end: end, k: k, result: &result)
            path.removeLast()
        }
    }
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var path = [Int]()
//        for i in 0...nums.count {
//            subsetsWithDup_helper(nums.sorted(), path: &path, start: 0, end: nums.count, k: i, result: &result)
//        }
        subsetsWithDup_helper2(nums.sorted(), path: &path, start: 0, end: nums.count, result: &result)
        return result
    }
}


func q0090(){
    let solution = q0090Solution()
    let nums = [1,2,2]
    let result = solution.subsetsWithDup(nums)
    print(result)
}
