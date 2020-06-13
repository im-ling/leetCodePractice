//
//  q0368.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 13/06/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//368. Largest Divisible Subset
//Medium
//
//1045
//
//51
//
//Add to List
//
//Share
//Given a set of distinct positive integers, find the largest subset such that every pair (Si, Sj) of elements in this subset satisfies:
//
//Si % Sj = 0 or Sj % Si = 0.
//
//If there are multiple solutions, return any subset is fine.
//
//Example 1:
//
//Input: [1,2,3]
//Output: [1,2] (of course, [1,3] will also be ok)
//Example 2:
//
//Input: [1,2,4,8]
//Output: [1,2,4,8]
//Accepted
//68,092
//Submissions
//187,154
class q0368Solution {
    func largestDivisibleSubset(_ nums: [Int]) -> [Int] {
        guard nums.count > 0 else {
            return [Int]()
        }
        var result = [Int]()
        let _nums = nums.sorted()
        let len = nums.count
        var preIndex = [Int].init(repeating: -1, count: len)
        var dp = [Int].init(repeating: 1, count: len)
        var maxIndex = 0
        for i in 1..<len {
            for j in (0..<i).reversed() {
                if _nums[i] % _nums[j] == 0 && 1 + dp[j] > dp[i]{
                    print("\(i) -- \(j)")
                    dp[i] = dp[j] + 1
                    preIndex[i] = j
                }
            }
            if dp[i] > dp[maxIndex] {
                maxIndex = i
            }
        }
        while maxIndex > -1 {
            result.insert(_nums[maxIndex], at: 0)
            maxIndex = preIndex[maxIndex]
        }
        return result
    }
}

func q0368(){
    let nums = [1, 2, 4, 8]
    let solu = q0368Solution()
    let result = solu.largestDivisibleSubset(nums)
    print(result)
}
