//
//  q1277.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 21/05/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//1277. Count Square Submatrices with All Ones
//Medium
//
//579
//
//16
//
//Add to List
//
//Share
//Given a m * n matrix of ones and zeros, return how many square submatrices have all ones.
//
//
//
//Example 1:
//
//Input: matrix =
//[
//  [0,1,1,1],
//  [1,1,1,1],
//  [0,1,1,1]
//]
//Output: 15
//Explanation:
//There are 10 squares of side 1.
//There are 4 squares of side 2.
//There is  1 square of side 3.
//Total number of squares = 10 + 4 + 1 = 15.
//Example 2:
//
//Input: matrix =
//[
//  [1,0,1],
//  [1,1,0],
//  [1,1,0]
//]
//Output: 7
//Explanation:
//There are 6 squares of side 1.
//There is 1 square of side 2.
//Total number of squares = 6 + 1 = 7.
//
//
//Constraints:
//
//1 <= arr.length <= 300
//1 <= arr[0].length <= 300
//0 <= arr[i][j] <= 1
//Accepted
//28,656
//Submissions
//40,301
class q1277Solution {
    func countSquares(_ matrix: [[Int]]) -> Int {
        guard matrix.count > 0 && matrix[0].count > 0 else {
            return 0
        }
        var newMatrix = matrix
        var count = 0
        for i in 0..<newMatrix[0].count {
            count += newMatrix[0][i]
        }
        for i in 1..<newMatrix.count {
            count += newMatrix[i][0]
        }
        var temp = 0
        for i in 1..<newMatrix.count {
            for j in 1..<newMatrix[0].count {
                temp = min(newMatrix[i - 1][j], newMatrix[i][j - 1])
                temp = min(temp, newMatrix[i - 1][j - 1])
                if newMatrix[i][j] == 1 {
                    newMatrix[i][j] += temp
                    count += newMatrix[i][j]
                }
            }
        }
        return count
    }
}

func q1277(){
    let matrix = [[0,0,0],[0,1,0],[0,1,0],[1,1,1],[1,1,0]]
    let solu = q1277Solution()
    let result = solu.countSquares(matrix)
    print(result)
}
