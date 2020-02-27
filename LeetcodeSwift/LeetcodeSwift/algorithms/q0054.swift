//
//  q0054.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 27/02/2020.
//  Copyright © 2020 DL. All rights reserved.
//


//54. Spiral Matrix
//Medium
//
//1786
//
//496
//
//Add to List
//
//Share
//Given a matrix of m x n elements (m rows, n columns), return all elements of the matrix in spiral order.
//
//Example 1:
//
//Input:
//[
// [ 1, 2, 3 ],
// [ 4, 5, 6 ],
// [ 7, 8, 9 ]
//]
//Output: [1,2,3,6,9,8,7,4,5]
//Example 2:
//
//Input:
//[
//  [1, 2, 3, 4],
//  [5, 6, 7, 8],
//  [9,10,11,12]
//]
//Output: [1,2,3,4,8,12,11,10,9,5,6,7]
//Accepted
//316,677
//Submissions
//967,616

import Foundation
class q0054Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var result = [Int]()
        let row = matrix.count
        if row <= 0 {
            return result
        }
        let col = matrix[0].count
        let min = row < col ? row : col
        let laps = min / 2
        for i in 0..<laps {
            for j in 0..<(col - i * 2) {
                result.append(matrix[i][j + i])
            }
            for j in 1..<(row - i * 2){
                result.append(matrix[i + j][col - i - 1])
            }
            for j in (0..<(col - i * 2 - 1)).reversed(){
                result.append(matrix[row - 1 - i][j + i])
            }
            for j in (1..<(row - i * 2 - 1)).reversed(){
                result.append(matrix[j + i][i])
            }
        }
        if min % 2 == 1 {
            if col >= row {
                for i in laps..<(col - laps) {
                    result.append(matrix[laps][i])
                }
            }else{
                for i in laps..<(row - laps) {
                    result.append(matrix[i][laps])
                }
            }
        }
        return result
    }
    
    
    func spiralOrder2(_ matrix: [[Int]]) -> [Int] {
        var result = [Int]()
        var rowBegin = 0
        var colBegin = 0
        var rowEnd = matrix.count - 1
        if rowEnd < 0 {
            return result
        }
        var colEnd = matrix[0].count - 1
        var i = 0
        while rowBegin <= rowEnd && colBegin <= colEnd {
            i = colBegin
            while i <= colEnd {
                result.append(matrix[rowBegin][i])
                i += 1
            }
            rowBegin += 1
            
            i = rowBegin
            while i <= rowEnd {
                result.append(matrix[i][colEnd])
                i += 1
            }
            colEnd -= 1

            if rowBegin <= rowEnd && colBegin <= colEnd{
                i = colEnd
                while i >= colBegin {
                    result.append(matrix[rowEnd][i])
                    i -= 1
                }
                rowEnd -= 1
            }
                
            if rowBegin <= rowEnd && colBegin <= colEnd {
                i = rowEnd
                while i >= rowBegin {
                    result.append(matrix[i][colBegin])
                    i -= 1
                }
                colBegin += 1
            }
        }
        return result
    }
}
func q0054() -> () {
    let solution = q0054Solution()
    var array = [[Int]]()
    array.append([1,2,3,33])
    array.append([4,5,6,66])
    array.append([7,8,9,99])
//    array.append([ 5, 1, 9,11])
//    array.append([ 2, 4, 8,10])
//    array.append([13, 3, 6, 7])
//    array.append([15,14,12,16])
    let result = solution.spiralOrder2(array)
    print(result)
}
