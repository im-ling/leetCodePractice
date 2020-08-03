//
//  q0039.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 12/02/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation

//39. Combination Sum
//Medium
//
//2955
//
//93
//
//Add to List
//
//Share
//Given a set of candidate numbers (candidates) (without duplicates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.
//
//The same repeated number may be chosen from candidates unlimited number of times.
//
//Note:
//
//All numbers (including target) will be positive integers.
//The solution set must not contain duplicate combinations.
//Example 1:
//
//Input: candidates = [2,3,6,7], target = 7,
//A solution set is:
//[
//  [7],
//  [2,2,3]
//]
//Example 2:
//
//Input: candidates = [2,3,5], target = 8,
//A solution set is:
//[
//  [2,2,2,2],
//  [2,3,3],
//  [3,5]
//]
//Accepted
//458,141
//Submissions
//863,836

class q0039Solution {
    func tryANumber(candidates:[Int], target: Int,  index: Int,currentArray: inout [Int], resultArray: inout [[Int]]) {
        if target < 0 {
            return
        }
        if target == 0 {
            resultArray.append(currentArray)
            return
        }
        for i in index..<candidates.count {
            if candidates[i] <= target {
                currentArray.append(candidates[i])
                tryANumber(candidates: candidates, target: target - candidates[i], index: i, currentArray: &currentArray, resultArray: &resultArray);
                currentArray.removeLast()
            }
        }
    }

    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var currentArray = [Int]()
        var resultArray = [[Int]]()
        tryANumber(candidates: candidates, target: target,index: 0, currentArray: &currentArray, resultArray: &resultArray)
        return resultArray
    }
}

func q0039() -> () {
    let solution = q0039Solution()
    let candidates = [2,3,6,7]
    let target = 7
    let result = solution.combinationSum(candidates, target)
    print(result)
}



