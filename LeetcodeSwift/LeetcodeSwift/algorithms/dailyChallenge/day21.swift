//
//  day21.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 21/04/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//Leftmost Column with at Least a One
//(This problem is an interactive problem.)
//
//A binary matrix means that all elements are 0 or 1. For each individual row of the matrix, this row is sorted in non-decreasing order.
//
//Given a row-sorted binary matrix binaryMatrix, return leftmost column index(0-indexed) with at least a 1 in it. If such index doesn't exist, return -1.
//
//You can't access the Binary Matrix directly.  You may only access the matrix using a BinaryMatrix interface:
//
//BinaryMatrix.get(x, y) returns the element of the matrix at index (x, y) (0-indexed).
//BinaryMatrix.dimensions() returns a list of 2 elements [n, m], which means the matrix is n * m.
//Submissions making more than 1000 calls to BinaryMatrix.get will be judged Wrong Answer.  Also, any solutions that attempt to circumvent the judge will result in disqualification.
//
//For custom testing purposes you're given the binary matrix mat as input in the following four examples. You will not have access the binary matrix directly.
//
//
//
//Example 1:
//
//
//
//Input: mat = [[0,0],[1,1]]
//Output: 0
//Example 2:
//
//
//
//Input: mat = [[0,0],[0,1]]
//Output: 1
//Example 3:
//
//
//
//Input: mat = [[0,0],[0,0]]
//Output: -1
//Example 4:
//
//
//
//Input: mat = [[0,0,0,1],[0,0,1,1],[0,1,1,1]]
//Output: 1
//
//
//Constraints:
//
//1 <= mat.length, mat[i].length <= 100
//mat[i][j] is either 0 or 1.
//mat[i] is sorted in a non-decreasing way.


/**
 * // This is the BinaryMatrix's API interface.
 * // You should not implement it, or speculate about its implementation
 * public class BinaryMatrix {
 *     public func get(_ x: Int, _ y: Int) -> Int {}
 *     public func dimensions() -> [Int] {}
 * };
 */

public class BinaryMatrix {
    var matrix = [[Int]]()
    public func get(_ x: Int, _ y: Int) -> Int {
        if matrix.count > 0 && x >= 0 && x < matrix.count && y >= 0 && y < matrix[0].count{
            return matrix[x][y]
        }
        return -1
    }
    public func dimensions() -> [Int] {
        if matrix.count > 0 {
            return [matrix.count, matrix[0].count]
        }
        return [0, 0]
    }
};

class Day21Solution {
    func leftMostColumnWithOne(_ binaryMatrix: BinaryMatrix) -> Int {
        var result = -1
        let dimensions = binaryMatrix.dimensions()
        let rows = dimensions[0]
        let lines = dimensions[1]
        var left = 0
        var right = lines - 1
        var startLine = 0
        let endLine = rows - 1
        while left <= right {
            let mid = (left + right) / 2
//            print("\(left) \(mid) \(right) \(startLine) \(endLine)")
            var notFound = true
            for i in startLine...endLine {
                if binaryMatrix.get(i, mid) == 1{
                    startLine = i
                    result = mid
                    right = mid - 1
                    notFound = false
                    break
                }
            }
            if notFound {
                left = mid + 1
            }
        }
        return result
    }
}


func day21(){
    let matrix = [[1,1,1,1,1],[0,0,0,1,1],[0,0,1,1,1],[0,0,0,0,1],[0,0,0,0,0]]
    let binaryMatrix = BinaryMatrix()
    binaryMatrix.matrix = matrix
    let result = Day21Solution().leftMostColumnWithOne(binaryMatrix)
    print(result)
}
