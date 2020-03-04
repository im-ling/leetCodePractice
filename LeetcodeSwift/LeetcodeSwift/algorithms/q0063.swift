//
//  q0063.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 04/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//63. Unique Paths II
//Medium
//
//1304
//
//213
//
//Add to List
//
//Share
//A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).
//
//The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).
//
//Now consider if some obstacles are added to the grids. How many unique paths would there be?
//
//
//
//An obstacle and empty space is marked as 1 and 0 respectively in the grid.
//
//Note: m and n will be at most 100.
//
//Example 1:
//
//Input:
//[
//  [0,0,0],
//  [0,1,0],
//  [0,0,0]
//]
//Output: 2
//Explanation:
//There is one obstacle in the middle of the 3x3 grid above.
//There are two ways to reach the bottom-right corner:
//1. Right -> Right -> Down -> Down
//2. Down -> Down -> Right -> Right
//Accepted
//259,894
//Submissions
//765,837


class q0063Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        if obstacleGrid.count <= 1 || obstacleGrid[0].count <= 1 {
            for i in 0..<obstacleGrid.count {
                for j in 0..<obstacleGrid[i].count {
                    if obstacleGrid[i][j] == 1 {
                        return 0
                    }
                }
            }
            return 1
        }
        let m = obstacleGrid[0].count
        let n = obstacleGrid.count
        var dp = obstacleGrid
        
        if dp[n - 1][m - 1] == 0 {
            dp[n - 1][m - 1] = 1
        }else{
            dp[n - 1][m - 1] = 0
        }
        
        for i in (0..<m - 1).reversed() {
            if dp[n - 1][i] == 0 {
                dp[n - 1][i] = dp[n - 1][i + 1]
            }else{
                dp[n - 1][i] = 0
            }
        }
        for i in (0..<n - 1).reversed(){
            if dp[i][m - 1] == 0 {
                dp[i][m - 1] = dp[i + 1][m - 1]
            }else{
                dp[i][m - 1] = 0
            }
        }
                
        var i = n - 2
        while i >= 0 {
            var j = m - 2
            while j >= 0 {
                if dp[i][j] == 0 {
                    dp[i][j] = dp[i + 1][j] + dp[i][j + 1]
                }else{
                    dp[i][j] = 0
                }
                j -= 1
            }
            i -= 1
        }
        
        return dp[0][0]
    }
}

func q0063(){
    let solution = q0063Solution()
    let obstacleGrid = [[0,0,0],[0,1,0],[0,0,0]]
    let result = solution.uniquePathsWithObstacles(obstacleGrid)
    print(result)
}
