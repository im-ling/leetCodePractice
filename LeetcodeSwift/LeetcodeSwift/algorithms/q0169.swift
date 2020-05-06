//
//  q0169.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 07/05/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//169. Majority Element
//Easy
//
//2845
//
//213
//
//Add to List
//
//Share
//Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.
//
//You may assume that the array is non-empty and the majority element always exist in the array.
//
//Example 1:
//
//Input: [3,2,3]
//Output: 3
//Example 2:
//
//Input: [2,2,1,1,1,2,2]
//Output: 2
//Accepted
//590,201
//Submissions
//1,027,085


class q0169Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var dic = [Int: Int]()
        let threshold = (nums.count + 1) / 2
        for num in nums {
            dic[num] = (dic[num] ?? 0) + 1
            if dic[num]! >= threshold  {
                return num
            }
        }
        return -1
    }
    func majorityElement2(_ nums: [Int]) -> Int {
        return nums.sorted()[nums.count / 2]
    }
}

func q0169(){
    let nums = [2,2,1,1,1,2,2]
    let solu = q0169Solution()
    let result = solu.majorityElement(nums)
    print(result)
}
