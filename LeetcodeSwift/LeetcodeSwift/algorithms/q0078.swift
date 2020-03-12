//
//  q0078.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 10/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//78. Subsets
//Medium
//
//2959
//
//71
//
//Add to List
//
//Share
//Given a set of distinct integers, nums, return all possible subsets (the power set).
//
//Note: The solution set must not contain duplicate subsets.
//
//Example:
//
//Input: nums = [1,2,3]
//Output:
//[
//  [3],
//  [1],
//  [2],
//  [1,2,3],
//  [1,3],
//  [2,3],
//  [1,2],
//  []
//]
//Accepted
//491,010
//Submissions
//844,844


class q0078Solution {
    func subsets_helper(_ nums: [Int], k: Int, start:Int, path: inout [Int], result:inout [[Int]]) {
        if path.count == k {
            result.append(path)
            return
        }
        if path.count + nums.count - start < k {
            return
        }
        for i in start..<nums.count {
            path.append(nums[i])
            subsets_helper(nums, k: k, start: i + 1, path: &path, result: &result)
            path.removeLast()
        }
    }
    func subsets(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var path = [Int]()
        for i in 0...nums.count {
            subsets_helper(nums,k: i, start: 0, path: &path, result: &result)
        }
        return result
    }
}
func q0078(){
    let solu = q0078Solution()
    let candidates = [1,2,3]
    let result = solu.subsets(candidates)
    print(result)
}
