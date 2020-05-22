//
//  q0123.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 01/05/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//123. Best Time to Buy and Sell Stock III
//Hard
//
//1820
//
//70
//
//Add to List
//
//Share
//Say you have an array for which the ith element is the price of a given stock on day i.
//
//Design an algorithm to find the maximum profit. You may complete at most two transactions.
//
//Note: You may not engage in multiple transactions at the same time (i.e., you must sell the stock before you buy again).
//
//Example 1:
//
//Input: [3,3,5,0,0,3,1,4]
//Output: 6
//Explanation: Buy on day 4 (price = 0) and sell on day 6 (price = 3), profit = 3-0 = 3.
//             Then buy on day 7 (price = 1) and sell on day 8 (price = 4), profit = 4-1 = 3.
//Example 2:
//
//Input: [1,2,3,4,5]
//Output: 4
//Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
//             Note that you cannot buy on day 1, buy on day 2 and sell them later, as you are
//             engaging multiple transactions at the same time. You must sell before buying again.
//Example 3:
//
//Input: [7,6,4,3,1]
//Output: 0
//Explanation: In this case, no transaction is done, i.e. max profit = 0.
//Accepted
//198,585
//Submissions
//543,985

class q0123Solution {
    // dp solution
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else {
            return 0
        }
        var prices = prices
        var i = 2
        while i < prices.count {
            if (prices[i] - prices[i - 1]) * (prices[i - 1] - prices[i - 2]) >= 0 {
                prices.remove(at: i - 1)
                i -= 1
            }
            i += 1
        }
//        dp[k, i] = max(dp[k, i-1], prices[i] - prices[j] + dp[k-1, j-1]), j=[0..i-1]
        let times = 2
        let len = prices.count
        var dp = [[Int]].init(repeating: [Int].init(repeating: 0, count: len), count: times + 1)
        for k in 1...times {
            for i in 1..<len {
                var temp = prices[i] - prices[0]
                for j in 1..<i {
                    temp = max(temp, dp[k - 1][j - 1] + prices[i] - prices[j])
                }
                dp[k][i] = max(dp[k][i - 1], temp)
            }
        }
        return dp[times][len - 1]
    }
}

func q0123() {
    let nums =
//        [1,2,4,2,5,7,2,4,9,0]
    [2, 1, 4]
    let solution = q0123Solution()
    let result = solution.maxProfit(nums)
    print(result)
}
