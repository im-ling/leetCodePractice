//
//  q0073.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 05/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//73. Set Matrix Zeroes
//Medium
//
//1621
//
//271
//
//Add to List
//
//Share
//Given a m x n matrix, if an element is 0, set its entire row and column to 0. Do it in-place.
//
//Example 1:
//
//Input:
//[
//  [1,1,1],
//  [1,0,1],
//  [1,1,1]
//]
//Output:
//[
//  [1,0,1],
//  [0,0,0],
//  [1,0,1]
//]
//Example 2:
//
//Input:
//[
//  [0,1,2,0],
//  [3,4,5,2],
//  [1,3,1,5]
//]
//Output:
//[
//  [0,0,0,0],
//  [0,4,5,0],
//  [0,3,1,0]
//]
//Follow up:
//
//A straight forward solution using O(mn) space is probably a bad idea.
//A simple improvement uses O(m + n) space, but still not the best solution.
//Could you devise a constant space solution?
//Accepted
//275,437
//Submissions
//655,629


class q0073Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        if matrix.count < 1 {
            return
        }
        let matrixWidth = matrix[0].count
        var mArray = [Bool].init(repeating: false, count: matrix.count)
        var nArray = [Bool].init(repeating: false, count: matrixWidth)

        for i in 0..<matrix.count {
            for j in 0..<matrixWidth {
                if matrix[i][j] == 0 {
                    mArray[i] = true
                    nArray[j] = true
                }
            }
        }
        for i in 0..<matrix.count {
            for j in 0..<matrixWidth {
                if mArray[i] || nArray[j] {
                    matrix[i][j] = 0
                }
            }
        }        
    }
}

func q0073(){
    let solution = q0073Solution()
    var matrix = [[0,0,0,5],[4,3,1,4],[0,1,1,4],[1,2,1,3],[0,0,1,1]]
    
    solution.setZeroes(&matrix)
    print(matrix)
}
