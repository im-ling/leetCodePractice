//
//  q0074.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 10/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//74. Search a 2D Matrix
//Medium
//
//1365
//
//142
//
//Add to List
//
//Share
//Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:
//
//Integers in each row are sorted from left to right.
//The first integer of each row is greater than the last integer of the previous row.
//Example 1:
//
//Input:
//matrix = [
//  [1,   3,  5,  7],
//  [10, 11, 16, 20],
//  [23, 30, 34, 50]
//]
//target = 3
//Output: true
//Example 2:
//
//Input:
//matrix = [
//  [1,   3,  5,  7],
//  [10, 11, 16, 20],
//  [23, 30, 34, 50]
//]
//target = 13
//Output: false
//Accepted
//289,309
//Submissions
//805,746

class q0074Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.count < 1 || matrix[0].count < 1 {
            return false
        }
        var left = 0
        var right = matrix.count - 1
        var index = -1
        
        while left <= right {
            let mid = (left + right) / 2
            if matrix[mid][0] <= target {
                index = mid
                left = mid + 1
            }else{
                right = mid - 1
            }
        }
        guard index > -1 else {
            return false
        }
        
        left = 0
        right = matrix[index].count - 1
        while left <= right {
            let mid = (left + right) / 2
            if matrix[index][mid] == target {
                return true
            }else if matrix[index][mid] < target{
                left = mid + 1
            }else{
                right = mid - 1
            }
        }
        
        return false
    }
}

func q0074(){
    let solu = q0074Solution()
    let matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,50]]
    let target = 1
    let result = solu.searchMatrix(matrix, target)
    print(result)
}
