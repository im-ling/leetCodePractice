//
//  q0096.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 14/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//96. Unique Binary Search Trees
//Medium
//
//2604
//
//98
//
//Add to List
//
//Share
//Given n, how many structurally unique BST's (binary search trees) that store values 1 ... n?
//
//Example:
//
//Input: 3
//Output: 5
//Explanation:
//Given n = 3, there are a total of 5 unique BST's:
//
//   1         3     3      2      1
//    \       /     /      / \      \
//     3     2     1      1   3      2
//    /     /       \                 \
//   2     1         2                 3
//Accepted
//253,589
//Submissions
//508,931
class q0096Solution {
    func numTrees(_ n: Int) -> Int {
        if n < 2 {
            return 1
        }
        var dp = [Int].init(repeating: 0, count: n + 1)
        dp[0] = 1
        dp[1] = 1
        for i in 2...n {
            for j in 0..<i {
                dp[i] += dp[i - 1 - j] * dp[j]
            }
        }
        return dp[n]
    }
}
func q0096(){
    let solution = q0096Solution()
    let result = solution.numTrees(4)
    print(result)
}
