//
//  q0040.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 12/02/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation

//40. Combination Sum II
//Medium
//
//1311
//
//55
//
//Add to List
//
//Share
//Given a collection of candidate numbers (candidates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.
//
//Each number in candidates may only be used once in the combination.
//
//Note:
//
//All numbers (including target) will be positive integers.
//The solution set must not contain duplicate combinations.
//Example 1:
//
//Input: candidates = [10,1,2,7,6,1,5], target = 8,
//A solution set is:
//[
//  [1, 7],
//  [1, 2, 5],
//  [2, 6],
//  [1, 1, 6]
//]
//Example 2:
//
//Input: candidates = [2,5,2,1,2], target = 5,
//A solution set is:
//[
//  [1,2,2],
//  [5]
//]
//Accepted
//283,101
//Submissions
//623,630

class q0040Solution {
    func combinationSum2_helper(candidates:[Int], path:inout [Int], result: inout [[Int]], target: Int, position: Int){
        if target == 0 {
            result.append(path)
            return
        }
        for i in position..<candidates.count {
            if candidates[i] <= target {
                if i > position , candidates[i] == candidates[i - 1] {
                    continue
                }
                path.append(candidates[i])
                combinationSum2_helper(candidates: candidates, path: &path, result: &result, target: target - candidates[i], position: i + 1)
                path.removeLast()
            }
        }
    }
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        var path = [Int]()
        combinationSum2_helper(candidates: candidates.sorted(), path: &path, result: &result, target: target, position: 0)
        return result
    }
}

func q0040() -> () {
    let solution = q0040Solution()
    let candidates = [10,1,2,7,6,1,5]
    let target = 8
    let result = solution.combinationSum2(candidates, target)
    print(result)
}
