//
//  q0070.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 04/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//70. Climbing Stairs
//Easy
//
//3453
//
//112
//
//Add to List
//
//Share
//You are climbing a stair case. It takes n steps to reach to the top.
//
//Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
//
//Note: Given n will be a positive integer.
//
//Example 1:
//
//Input: 2
//Output: 2
//Explanation: There are two ways to climb to the top.
//1. 1 step + 1 step
//2. 2 steps
//Example 2:
//
//Input: 3
//Output: 3
//Explanation: There are three ways to climb to the top.
//1. 1 step + 1 step + 1 step
//2. 1 step + 2 steps
//3. 2 steps + 1 step
//Accepted
//580,517
//Submissions
//1,256,952
class q0070Solution {
    func climbStairs(_ n: Int) -> Int {
        if n < 3 {
            return n
        }
        var stepPre = 1
        var result = 2
        for _ in 3...n {
            result += stepPre
            stepPre = result - stepPre
        }
        return result
    }
}
func q0070(){
    let solution = q0070Solution()
    let result = solution.climbStairs(5)
    print(result)
}
