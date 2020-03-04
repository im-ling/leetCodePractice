//
//  q0064.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 04/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//64. Minimum Path Sum
//Medium
//
//2148
//
//49
//
//Add to List
//
//Share
//Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.
//
//Note: You can only move either down or right at any point in time.
//
//Example:
//
//Input:
//[
//  [1,3,1],
//  [1,5,1],
//  [4,2,1]
//]
//Output: 7
//Explanation: Because the path 1→3→1→1→1 minimizes the sum.
//Accepted
//313,524
//Submissions
//614,992


class q0064Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        if grid.count < 1 {
            return 0
        }
        let m = grid.count
        let n = grid[0].count
        var dp = [[Int]].init(repeating: [Int].init(repeating: 0, count: n), count: m)
        dp[m - 1][n - 1] = grid[m - 1][n - 1]
        
        for i in (0..<m - 1).reversed() {
            dp[i][n - 1] = dp[i + 1][n - 1] + grid[i][n - 1]
        }
        for j in (0..<n-1).reversed() {
            dp[m - 1][j] = dp[m - 1][j + 1] + grid[m - 1][j]
        }
        
        var i = m - 2
        while i >= 0 {
            var j = n - 2
            while j >= 0 {
                dp[i][j] = grid[i][j] + (dp[i + 1][j] < dp[i][j + 1] ? dp[i + 1][j] : dp[i][j + 1])
                j -= 1
            }
            i -= 1
        }

//        printGrid(dp)
        
        return dp[0][0]
    }
}
func q0064(){
    let solution = q0064Solution()
    let grid = [[1,3,1],[1,5,1],[4,2,1]]
    let result = solution.minPathSum(grid)
    print(result)
}
