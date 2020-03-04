//
//  q0062.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 04/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//62. Unique Paths
//Medium
//
//2449
//
//176
//
//Add to List
//
//Share
//A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).
//
//The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).
//
//How many possible unique paths are there?
//
//
//Above is a 7 x 3 grid. How many possible unique paths are there?
//
//Note: m and n will be at most 100.
//
//Example 1:
//
//Input: m = 3, n = 2
//Output: 3
//Explanation:
//From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
//1. Right -> Right -> Down
//2. Right -> Down -> Right
//3. Down -> Right -> Right
//Example 2:
//
//Input: m = 7, n = 3
//Output: 28
//Accepted
//397,840
//Submissions
//774,511
class q0062Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        if m == 1 || n == 1 {
            return 1
        }
        var dp = [[Int]].init(repeating: [Int].init(repeating: 0, count: m), count: n)
        for i in 0..<m {
            dp[n-1][i] = 1
        }
        for i in 0..<n {
            dp[i][m-1] = 1
        }
                
        var i = n - 2
        while i >= 0 {
            var j = m - 2
            while j >= 0 {
                dp[i][j] = dp[i + 1][j] + dp[i][j + 1]
                j -= 1
            }
            i -= 1
        }
        
        return dp[0][0]
    }
}
func q0062(){
    let solution = q0062Solution()
    let result = solution.uniquePaths(7, 3)
    print(result)
}


