//
//  q0045.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 03/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//45. Jump Game II
//Hard
//
//1925
//
//114
//
//Add to List
//
//Share
//Given an array of non-negative integers, you are initially positioned at the first index of the array.
//
//Each element in the array represents your maximum jump length at that position.
//
//Your goal is to reach the last index in the minimum number of jumps.
//
//Example:
//
//Input: [2,3,1,1,4]
//Output: 2
//Explanation: The minimum number of jumps to reach the last index is 2.
//    Jump 1 step from index 0 to 1, then 3 steps to the last index.
//Note:
//
//You can assume that you can always reach the last index.
//
//Accepted
//225,774
//Submissions
//759,086
class q0045Solution {
    func jump(_ nums: [Int]) -> Int {
        var step = 0
        if nums.count < 2 {
            return step
        }

        var lastMax = 0
        var max = nums[0]
        step += 1
        let last = nums.count - 1
        while max < last {
            let tempMax = max
            for i in lastMax...tempMax {
                if i + nums[i] > max {
                    max = i + nums[i]
                }
            }
            lastMax = tempMax
            step += 1
        }
        return step
    }
}

func q0045(){
    let solution = q0045Solution()
    let candidates = [2,3,1,1,4]
    let result = solution.jump(candidates)
    print(result)
}
