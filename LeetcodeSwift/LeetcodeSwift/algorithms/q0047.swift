//
//  q0047.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 17/02/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation

//47. Permutations II
//Medium
//
//1541
//
//56
//
//Add to List
//
//Share
//Given a collection of numbers that might contain duplicates, return all possible unique permutations.
//
//Example:
//
//Input: [1,1,2]
//Output:
//[
//  [1,1,2],
//  [1,2,1],
//  [2,1,1]
//]
//Accepted
//309,224
//Submissions
//701,513
class q0047Solution {
    func permuteUnique_helper(nums:[Int], result: inout [[Int]], taken: inout [Bool], path: inout [Int], index: Int){
        if index == nums.count {
            result.append(path)
            return
        }
        for i in 0..<nums.count {
            if taken[i] {
                continue
            }
            if i > 0 && nums[i] == nums[i - 1] && !taken[i - 1] {
                continue
            }
            taken[i] = true
            path.append(nums[i])
            permuteUnique_helper(nums: nums, result: &result, taken: &taken, path: &path, index: index + 1)
            path.removeLast()
            taken[i] = false
        }
    }
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        let candidates = nums.sorted()
        var taken = [Bool]()
        for _ in nums {
            taken.append(false)
        }
        var path = [Int]()
        permuteUnique_helper(nums: candidates, result: &result, taken: &taken, path: &path, index: 0)
        return result
    }
}
func q0047() -> () {
    let solution = q0047Solution()
    let candidates = [1,1,2]
    let result = solution.permuteUnique(candidates)
    print(result)
}
