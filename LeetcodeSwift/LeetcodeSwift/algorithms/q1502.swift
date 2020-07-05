//
//  q1502.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 05/07/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//1502. Can Make Arithmetic Progression From Sequence
//Easy
//
//30
//
//0
//
//Add to List
//
//Share
//Given an array of numbers arr. A sequence of numbers is called an arithmetic progression if the difference between any two consecutive elements is the same.
//
//Return true if the array can be rearranged to form an arithmetic progression, otherwise, return false.
//
//
//
//Example 1:
//
//Input: arr = [3,5,1]
//Output: true
//Explanation: We can reorder the elements as [1,3,5] or [5,3,1] with differences 2 and -2 respectively, between each consecutive elements.
//Example 2:
//
//Input: arr = [1,2,4]
//Output: false
//Explanation: There is no way to reorder the elements to obtain an arithmetic progression.
//
//
//Constraints:
//
//2 <= arr.length <= 1000
//-10^6 <= arr[i] <= 10^6
//Accepted
//8,372
//Submissions
//10,395
class q1502Solution {
    func canMakeArithmeticProgression(_ arr: [Int]) -> Bool {
        let nums = arr.sorted()
        let interval = nums[1] - nums[0]
        for i in 1..<nums.count {
            if nums[i] - nums[i - 1] != interval {
                return false
            }
        }
        return true
    }
}
