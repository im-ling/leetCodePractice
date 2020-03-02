//
//  q0051.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 02/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//51. N-Queens
//Hard
//
//1466
//
//65
//
//Add to List
//
//Share
//The n-queens puzzle is the problem of placing n queens on an n×n chessboard such that no two queens attack each other.
//
//
//
//Given an integer n, return all distinct solutions to the n-queens puzzle.
//
//Each solution contains a distinct board configuration of the n-queens' placement, where 'Q' and '.' both indicate a queen and an empty space respectively.
//
//Example:
//
//Input: 4
//Output: [
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
//Explanation: There exist two distinct solutions to the 4-queens puzzle as shown above.
//Accepted
//180,046
//Submissions
//410,970

class q0051Solution {
    func solveNQueens_helper(n:Int, candidates: inout [Int], path: inout [Int], resultArray: inout [[Int]], check: inout [[Bool]]){
        if candidates.count == 0 {
            resultArray.append(path)
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
            
            solveNQueens_helper(n: n, candidates: &candidates, path: &path, resultArray: &resultArray, check: &check)
            
            candidates.insert(path.last!, at: i)
            path.removeLast()
            check[0][candidates[i]] = false
            check[1][path.count + candidates[i]] = false
            check[2][n - path.count + candidates[i]] = false

        }
        
    }

    func solveNQueens(_ n: Int) -> [[String]] {
        var resultArray = [[Int]]()
        var candidates = [Int]()
        var path = [Int]()
        var check = [[Bool]]()
        check.append([Bool].init(repeating: false, count: n))
        check.append([Bool].init(repeating: false, count: n * 2))
        check.append([Bool].init(repeating: false, count: n * 2))
        for i in 0..<n {
            candidates.append(i)
        }
        
        solveNQueens_helper(n:n, candidates: &candidates, path: &path, resultArray: &resultArray, check: &check)
        
        var result = [[String]]()
        var characterArray = [Character].init(repeating: ".", count: n - 1)
        for item in resultArray {
            var oneSolution = [String]()
            for number in item {
                characterArray.insert("Q", at: number)
                oneSolution.append(String.init(characterArray))
                characterArray.remove(at: number)
            }
            result.append(oneSolution)
        }
        return result
    }
}

func q0051() -> () {
    let solution = q0051Solution()
    let result = solution.solveNQueens(4)
    print(result)
}
