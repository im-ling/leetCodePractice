//
//  q1035.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 25/05/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//1035. Uncrossed Lines
//Medium
//
//540
//
//10
//
//Add to List
//
//Share
//We write the integers of A and B (in the order they are given) on two separate horizontal lines.
//
//Now, we may draw connecting lines: a straight line connecting two numbers A[i] and B[j] such that:
//
//A[i] == B[j];
//The line we draw does not intersect any other connecting (non-horizontal) line.
//Note that a connecting lines cannot intersect even at the endpoints: each number can only belong to one connecting line.
//
//Return the maximum number of connecting lines we can draw in this way.
//
//
//
//Example 1:
//
//
//Input: A = [1,4,2], B = [1,2,4]
//Output: 2
//Explanation: We can draw 2 uncrossed lines as in the diagram.
//We cannot draw 3 uncrossed lines, because the line from A[1]=4 to B[2]=4 will intersect the line from A[2]=2 to B[1]=2.
//Example 2:
//
//Input: A = [2,5,1,2,5], B = [10,5,2,1,5,2]
//Output: 3
//Example 3:
//
//Input: A = [1,3,7,1,7,5], B = [1,9,2,5,1]
//Output: 2
//
//
//Note:
//
//1 <= A.length <= 500
//1 <= B.length <= 500
//1 <= A[i], B[i] <= 2000
//Accepted
//20,545
//Submissions
//37,322
class q1035Solution {
    var a = [Int]()
    var b = [Int]()
    func maxUncrossedLines_helper(a_start: Int, a_end:Int, b_start: Int, b_end: Int, current: Int, max: inout Int){
        if a_start >= a_end || b_start >= b_end || max >= current + a_end - a_start || max >= current + b_end - b_start{
            return
        }
        if a[a_start] == b[b_start] {
                            if current + 1 > max {
                max = current + 1
            }
            maxUncrossedLines_helper(a_start: a_start + 1, a_end: a_end, b_start: b_start + 1, b_end: b_end, current: current + 1, max: &max)
            return
        }
        for i in b_start..<b_end {
            if a[a_start] == b[i] {
                if current + 1 > max {
                    max = current + 1
                }
                maxUncrossedLines_helper(a_start: a_start + 1, a_end: a_end, b_start: i + 1, b_end: b_end, current: current + 1, max: &max)
            }
        }
        maxUncrossedLines_helper(a_start: a_start + 1, a_end: a_end, b_start: b_start, b_end: b_end, current: current, max: &max)
    }
    
    func maxUncrossedLines(_ A: [Int], _ B: [Int]) -> Int {
        var dp = [[Int]].init(repeating: [Int].init(repeating: 0, count: B.count), count: A.count)
        dp[0][0] = A[0] == B[0] ? 1 : 0
        for i in 1..<A.count {
            if A[i] == B[0] {
                dp[i][0] = 1
            }else{
                dp[i][0] = dp[i - 1][0]
            }
        }
        for i in 1..<B.count {
            if A[0] == B[i] {
                dp[0][i] = 1
            }else{
                dp[0][i] = dp[0][i - 1]
            }
        }
        
        for i in 1..<A.count {
            for j in 1..<B.count {
                if A[i] == B[j] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                }else{
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        print(dp)
        
        return dp[A.count - 1][B.count - 1]
    }
}

func q1035(){
    let A =
    [15,14,1,7,15,1,12,18,9,15,1,20,18,15,16,18,11,8,11,18,11,11,17,20,16,20,15,15,9,18,16,4,16,1,13,10,10,20,4,18,17,3,8,1,8,19,14,10,10,12]
    let B =
    [12,8,17,4,2,18,16,10,11,12,7,1,8,16,4,14,12,18,18,19,19,1,11,18,1,6,12,17,6,19,10,5,11,16,6,17,12,1,9,3,19,2,18,18,2,4,11,11,14,9,20,19,2,20,9,15,8,7,8,6,19,12,4,11,18,18,1,6,9,17,13,19,5,4,14,9,11,15,2,5,4,1,10,11,6,4,9,7,11,7,3,8,11,12,4,19,12,17,14,18]
    let solu = q1035Solution()
    let result = solu.maxUncrossedLines(A, B)
    print(result)
}
