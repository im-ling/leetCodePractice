//
//  q0085.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 14/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//85. Maximal Rectangle
//Hard
//
//2172
//
//60
//
//Add to List
//
//Share
//Given a 2D binary matrix filled with 0's and 1's, find the largest rectangle containing only 1's and return its area.
//
//Example:
//
//Input:
//[
//  ["1","0","1","0","0"],
//  ["1","0","1","1","1"],
//  ["1","1","1","1","1"],
//  ["1","0","0","1","0"]
//]
//Output: 6
//Accepted
//155,623
//Submissions
//431,753

class q0085Solution {
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        if matrix.count < 1 || matrix[0].count < 1 {
            return 0
        }
        var result = 0
        let c1 = Character.init("1")
        let width = matrix[0].count
        var heights = [Int].init(repeating: 0, count: width)
        
        let stack_initial = [-1]
        for i in 0..<matrix.count {
            var stack = stack_initial
            for j in 0..<width {
                if matrix[i][j] == c1 {
                    heights[j] += 1
                }else{
                    heights[j] = 0
                }
                while stack.count > 1 && heights[stack.last!] > heights[j] {
                    result = max(result, heights[stack.removeLast()] * (j - stack.last! - 1))
                }
                stack.append(j)
            }
            while stack.count > 1 {
                result = max(result, heights[stack.removeLast()] * (width - stack.last! - 1))
            }
        }
        return result
    }
}
func q0085(){
    let solution = q0085Solution()
    let matrix:[[Character]] =  [
      ["1","0","1","0","0"],
      ["1","0","1","1","1"],
      ["1","1","1","1","1"],
      ["1","0","0","1","0"]
    ]
    let result = solution.maximalRectangle(matrix)
    print(result)
}
