//
//  q0001.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 01/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//1. Two Sum
//Easy
//
//13667
//
//499
//
//Add to List
//
//Share
//Given an array of integers, return indices of the two numbers such that they add up to a specific target.
//
//You may assume that each input would have exactly one solution, and you may not use the same element twice.
//
//Example:
//
//Given nums = [2, 7, 11, 15], target = 9,
//
//Because nums[0] + nums[1] = 2 + 7 = 9,
//return [0, 1].
//Accepted
//2,605,366
//Submissions
//5,776,328
class q0001Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dic = Dictionary<Int, Int>.init()
        var result = [Int]()
        for i in 0..<nums.count {
            if dic[target - nums[i]] != nil{
                result.append(dic[target - nums[i]]!)
                result.append(i)
                return result
            }
            dic[nums[i]] = i
        }
        return result
    }
}

func q0001() -> () {
    let solution = q0001Solution()
    let candidates = [2,3,6,7]
    let target = 9
    let result = solution.twoSum(candidates, target)
    print(result)
}
