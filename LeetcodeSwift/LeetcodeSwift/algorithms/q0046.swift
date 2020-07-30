//
//  q0046.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 30/07/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation

//46. Permutations
//Medium
//
//4018
//
//106
//
//Add to List
//
//Share
//Given a collection of distinct integers, return all possible permutations.
//
//Example:
//
//Input: [1,2,3]
//Output:
//[
//  [1,2,3],
//  [1,3,2],
//  [2,1,3],
//  [2,3,1],
//  [3,1,2],
//  [3,2,1]
//]
//Accepted
//621,687
//Submissions
//981,757
class q0046Solution {
    func permute_helper(_ nums: [Int], _ flags: inout [Bool],_ currentLen:Int,_ targetLen:Int, _ path: inout [Int], _ result: inout [[Int]]){
        if currentLen == targetLen{
            result.append(path)
            return
        }
        
        for i in 0..<targetLen {
            if flags[i] {
                flags[i] = false
                path.append(nums[i]);
                permute_helper(nums, &flags, currentLen + 1, targetLen, &path, &result)
                path.removeLast()
                flags[i] = true
            }
            
        }
    }

    func permute(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var path = [Int]()
        var flags = [Bool].init(repeating: true, count: nums.count)
        permute_helper(nums, &flags, 0, nums.count, &path, &result)
        return result
    }
}
