//
//  q0221.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 28/04/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//221. Maximal Square
//Medium
//
//2499
//
//63
//
//Add to List
//
//Share
//Given a 2D binary matrix filled with 0's and 1's, find the largest square containing only 1's and return its area.
//
//Example:
//
//Input:
//
//1 0 1 0 0
//1 0 1 1 1
//1 1 1 1 1
//1 0 0 1 0
//
//Output: 4
//Accepted
//213,693
//Submissions
//590,123

class q0221Solution {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        guard matrix.count > 1 && matrix[0].count > 1 else {
            for i in matrix {
                for j in i {
                    if j == "1" {
                        return 1
                    }
                }
            }
            return 0
        }
        let rowsCount = matrix.count
        let linesCount = matrix[0].count
        var dp = [[Int]].init(repeating: [Int].init(repeating: 0, count: linesCount), count: rowsCount)
        var maxLen = 0
        for i in 0..<rowsCount {
            if matrix[i][0] == "1" {
                dp[i][0] = 1
                if maxLen < 1 {
                    maxLen = 1
                }
            }
        }
        for i in 0..<linesCount {
            if matrix[0][i] == "1" {
                dp[0][i] = 1
                if maxLen < 1 {
                    maxLen = 1
                }
            }
        }
        
        var tempMin = 0
        for i in 1..<rowsCount{
            for j in 1..<linesCount{
                if matrix[i][j] == "1" {
                    tempMin = min(dp[i][j - 1], dp[i - 1][j])
                    tempMin = min(tempMin, dp[i - 1][j - 1])
                    dp[i][j] = tempMin + 1
                    if dp[i][j] > maxLen {
                        maxLen = dp[i][j]
                    }
                }
            }
        }

        return maxLen * maxLen
    }
}

func q0221() -> () {
    var matrix = [[Character]]()
    matrix.append([Character].init("10100"))
    matrix.append([Character].init("10111"))
    matrix.append([Character].init("11111"))
    matrix.append([Character].init("10010"))
    let result = q0221Solution().maximalSquare(matrix)
    print(result)
}
