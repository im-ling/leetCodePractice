//
//  q0048.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 17/02/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//48. Rotate Image
//Medium
//
//2356
//
//198
//
//Add to List
//
//Share
//You are given an n x n 2D matrix representing an image.
//
//Rotate the image by 90 degrees (clockwise).
//
//Note:
//
//You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. DO NOT allocate another 2D matrix and do the rotation.
//
//Example 1:
//
//Given input matrix =
//[
//  [1,2,3],
//  [4,5,6],
//  [7,8,9]
//],
//
//rotate the input matrix in-place such that it becomes:
//[
//  [7,4,1],
//  [8,5,2],
//  [9,6,3]
//]
//Example 2:
//
//Given input matrix =
//[
//  [ 5, 1, 9,11],
//  [ 2, 4, 8,10],
//  [13, 3, 6, 7],
//  [15,14,12,16]
//],
//
//rotate the input matrix in-place such that it becomes:
//[
//  [15,13, 2, 5],
//  [14, 3, 4, 1],
//  [12, 6, 8, 9],
//  [16, 7,10,11]
//]
//Accepted
//341,423
//Submissions
//641,397
class q0048Solution {
    func rotate(_ matrix: inout [[Int]]) {
        //laps
        for i in 0..<matrix.count / 2 {
            let len = matrix.count - 1 - i * 2;
            for j in 0..<len {
                let temp = matrix[i][i + j]
                matrix[i][i + j] = matrix[matrix.count - 1 - i - j][i]
                matrix[matrix.count - 1 - i - j][i] = matrix[matrix.count - 1 - i][matrix.count - 1 - i - j]
                matrix[matrix.count - 1 - i][matrix.count - 1 - i - j] = matrix[i + j][matrix.count - 1 - i]
                matrix[i + j][matrix.count - 1 - i] = temp
            }
        }
    }
}
func q0048() -> () {
    let solution = q0048Solution()
    var array = [[Int]]()
//    array.append([1,2,3])
//    array.append([4,5,6])
//    array.append([7,8,9])
    array.append([ 5, 1, 9,11])
    array.append([ 2, 4, 8,10])
    array.append([13, 3, 6, 7])
    array.append([15,14,12,16])
    solution.rotate(&array)
    print(array)
}
