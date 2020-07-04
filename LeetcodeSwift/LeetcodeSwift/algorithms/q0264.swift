//
//  q0264.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 05/07/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//264. Ugly Number II
//Medium
//
//1726
//
//105
//
//Add to List
//
//Share
//Write a program to find the n-th ugly number.
//
//Ugly numbers are positive numbers whose prime factors only include 2, 3, 5.
//
//Example:
//
//Input: n = 10
//Output: 12
//Explanation: 1, 2, 3, 4, 5, 6, 8, 9, 10, 12 is the sequence of the first 10 ugly numbers.
//Note:
//
//1 is typically treated as an ugly number.
//n does not exceed 1690.
//Accepted
//155,171
//Submissions
//383,083
fileprivate var dp = [Int]()
class q0264Solution {
    func nthUglyNumber(_ n: Int) -> Int {
        if dp.count == 0 {
            let size = 1690
            let factors = [2, 3, 5]
            dp = [Int].init(repeating: Int.max, count: size + 1)
            dp[0] = 0
            dp[1] = 1
            var factorCounts = [1, 1, 1]
            for i in 2...size {
                for j in 0..<factors.count {
                    dp[i] = min(dp[i], dp[factorCounts[j]] * factors[j])
                }
                for j in 0..<factors.count {
                    if dp[i] == dp[factorCounts[j]] * factors[j] {
                        factorCounts[j] += 1
                    }
                }
            }
        }
        return dp[n]
    }
    func nthUglyNumber2(_ n: Int) -> Int {
        if dp.count == 0 {
            let size = 1690
            let factors = [2, 3, 5]
            dp = [Int].init(repeating: Int.max, count: size + 1)
            dp[0] = 0
            dp[1] = 1
            var start = 1
            var end = 1
            for i in 2...size {
                while dp[start] * 5 <= dp[end] {
                    start += 1
                }
                for j in start...end {
                    if dp[i] < dp[j] * 2{
                        break
                    }
                    for factor in factors {
                        let temp = min(dp[j] * factor, dp[i])
                        if temp > dp[i - 1] {
                            dp[i] = temp
                        }
                    }
                }
                end = i
            }
        }
        return dp[n]
    }
}

func q0264(){
    let solu = q0264Solution()
    let n = 42
    let result = solu.nthUglyNumber(n)
    print(result)
}
