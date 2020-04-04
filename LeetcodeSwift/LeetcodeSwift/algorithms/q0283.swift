//
//  q0283.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 04/04/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//283. Move Zeroes
//Easy
//
//3125
//
//107
//
//Add to List
//
//Share
//Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
//
//Example:
//
//Input: [0,1,0,3,12]
//Output: [1,3,12,0,0]
//Note:
//
//You must do this in-place without making a copy of the array.
//Minimize the total number of operations.
//Accepted
//647,839
//Submissions
//1,145,434
class q0283Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var i = 0
        var j = 0
        while i < nums.count {
            if nums[i] != 0 {
                nums[j] = nums[i]
                j += 1
            }
            i += 1
        }
        while j < nums.count {
            nums[j] = 0
            j += 1
        }
    }
}

func q0283(){
    let solution = q0283Solution()
    var numbers = [0,1,0,3,12]
    solution.moveZeroes(&numbers)
    print(numbers)
}
