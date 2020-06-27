//
//  q0279.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 27/06/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//279. Perfect Squares
//Medium
//
//2690
//
//181
//
//Add to List
//
//Share
//Given a positive integer n, find the least number of perfect square numbers (for example, 1, 4, 9, 16, ...) which sum to n.
//
//Example 1:
//
//Input: n = 12
//Output: 3
//Explanation: 12 = 4 + 4 + 4.
//Example 2:
//
//Input: n = 13
//Output: 2
//Explanation: 13 = 4 + 9.
//Accepted
//281,664
//Submissions
//612,327
class q0279Solution {
    func numSquares(_ n: Int) -> Int {
        var dp = [Int].init(repeating: Int.max, count: n + 1)
        if n > 3 {
            dp[3] = 3
        }
        var key = 1
        var keys = [Int]()
        for i in 1...n {
            print(dp)
            if i == key * key {
                dp[i] = 1
                keys.append(key * key)
                key += 1
            }else{
                for _key in keys.reversed() {
                    if dp[i] > dp[_key] + dp[i - _key] {
                        dp[i] = dp[_key] + dp[i - _key]
                    }
                    if i >= dp[i] * _key {
                        break
                    }
                }
            }
        }
        return dp[n]
    }
}

func q0279(){
    let solu = q0279Solution()
    let n = 8
    let result = solu.numSquares(n)
    print(result)
}
