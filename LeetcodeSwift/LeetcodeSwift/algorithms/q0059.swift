//
//  q0059.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 03/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//59. Spiral Matrix II
//Medium
//
//777
//
//101
//
//Add to List
//
//Share
//Given a positive integer n, generate a square matrix filled with elements from 1 to n2 in spiral order.
//
//Example:
//
//Input: 3
//Output:
//[
// [ 1, 2, 3 ],
// [ 8, 9, 4 ],
// [ 7, 6, 5 ]
//]
//Accepted
//173,703
//Submissions
//338,585

class q0059Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        var result = [[Int]]()
        for _ in 0..<n {
            result.append([Int].init(repeating: 0, count: n))
        }
        let laps = (n + 1) / 2
        var count = 1
        var j = 0
        for i in 0..<laps {
            j = i
            while j < n - i {
                result[i][j] = count
                count += 1
                j += 1
            }
            j = i + 1
            while j < n - i {
                result[j][n - 1 - i] = count
                count += 1
                j += 1
            }
            
            j = n - i - 2
            while j >= i {
                result[n - 1 - i][j] = count
                count += 1
                j -= 1
            }
            
            j = n - i - 2
            while j > i {
                result[j][i] = count
                count += 1
                j -= 1
            }
            
        }
        return result
    }
}

func q0059(){
    let solution = q0059Solution()
    let result = solution.generateMatrix(4)
    print(result)
}
