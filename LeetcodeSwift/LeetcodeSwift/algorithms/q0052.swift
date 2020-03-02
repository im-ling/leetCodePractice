//
//  q0052.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 02/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//52. N-Queens II
//Hard
//
//390
//
//136
//
//Add to List
//
//Share
//The n-queens puzzle is the problem of placing n queens on an n×n chessboard such that no two queens attack each other.
//
//
//
//Given an integer n, return the number of distinct solutions to the n-queens puzzle.
//
//Example:
//
//Input: 4
//Output: 2
//Explanation: There are two distinct solutions to the 4-queens puzzle as shown below.
//[
// [".Q..",  // Solution 1
//  "...Q",
//  "Q...",
//  "..Q."],
//
// ["..Q.",  // Solution 2
//  "Q...",
//  "...Q",
//  ".Q.."]
//]
//Accepted
//120,915
//Submissions
//217,435
class q0052Solution {
    func totalNQueens_helper(n:Int, candidates: inout [Int], path: inout [Int], result: inout Int, check: inout [[Bool]]){
        if candidates.count == 0 {
            result += 1
            return
        }
        for i in 0..<candidates.count {
            if check[0][candidates[i]] || check[1][path.count + candidates[i]] || check[2][n - path.count + candidates[i]]{
                continue
            }
            check[0][candidates[i]] = true
            check[1][path.count + candidates[i]] = true
            check[2][n - path.count + candidates[i]] = true
            path.append(candidates[i])
            candidates.remove(at: i)
            
            totalNQueens_helper(n: n, candidates: &candidates, path: &path, result: &result, check: &check)
            
            candidates.insert(path.last!, at: i)
            path.removeLast()
            check[0][candidates[i]] = false
            check[1][path.count + candidates[i]] = false
            check[2][n - path.count + candidates[i]] = false

        }
        
    }
    func totalNQueens(_ n: Int) -> Int {
        var result = 0
        var candidates = [Int]()
        var path = [Int]()
        var check = [[Bool]]()
        check.append([Bool].init(repeating: false, count: n))
        check.append([Bool].init(repeating: false, count: n * 2))
        check.append([Bool].init(repeating: false, count: n * 2))
        for i in 0..<n {
            candidates.append(i)
        }
        
        totalNQueens_helper(n:n, candidates: &candidates, path: &path, result: &result, check: &check)
        return result
    }
}

func q0052() -> () {
    let solution = q0052Solution()
    let result = solution.totalNQueens(4)
    print(result)
}

