//
//  q0518.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 08/06/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//518. Coin Change 2
//Medium
//
//1725
//
//59
//
//Add to List
//
//Share
//You are given coins of different denominations and a total amount of money. Write a function to compute the number of combinations that make up that amount. You may assume that you have infinite number of each kind of coin.
//
//
//
//Example 1:
//
//Input: amount = 5, coins = [1, 2, 5]
//Output: 4
//Explanation: there are four ways to make up the amount:
//5=5
//5=2+2+1
//5=2+1+1+1
//5=1+1+1+1+1
//Example 2:
//
//Input: amount = 3, coins = [2]
//Output: 0
//Explanation: the amount of 3 cannot be made up just with coins of 2.
//Example 3:
//
//Input: amount = 10, coins = [10]
//Output: 1
//
//
//Note:
//
//You can assume that
//
//0 <= amount <= 5000
//1 <= coin <= 5000
//the number of coins is less than 500
//the answer is guaranteed to fit into signed 32-bit integer
//Accepted
//109,972
//Submissions
//225,330
class q0518Solution {
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        var dp = [Int].init(repeating: 0, count: amount + 1)
        dp[0] = 1
        for coin in coins {
            if coin > amount {
                break
            }
            for i in coin...amount {
                dp[i] += dp[i - coin]
            }
        }
        return dp[amount]
    }

    func change2(_ amount: Int, _ coins: [Int]) -> Int {
        if amount < 1 {
            return 1
        }
        if coins.count < 1 {
            return 0
        }
        let M = coins.count
        let N = amount
        var dp = [[Int]].init(repeating: [Int].init(repeating: 0, count: M + 1), count: N + 1)
//        print(dp)
        for i in 1...M {
            for j in 1...N {
                dp[j][i] = dp[j][i - 1] + (j - coins[i - 1] > 0 ? dp[j - coins[i - 1]][i] : 0) + (j == coins[i - 1] ? 1 : 0)
            }
        }
//        print(dp)
        return dp[N][M]
    }
}

func q0518(){
    let solu = q0518Solution()
    let amount = 5
    let coins = [1, 2, 5]
    let result = solu.change(amount, coins)
    print(result)
}
