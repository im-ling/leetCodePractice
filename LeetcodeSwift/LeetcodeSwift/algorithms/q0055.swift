//
//  q0055.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 02/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
class q0055Solution {
    func canJump(_ nums: [Int]) -> Bool {
        if nums.count < 1 {
            return false
        }
        var max = nums[0]
        var i = 0
        let last = nums.count - 1
        if max >= last  {
            return true
        }
        while i <= max {
            if i + nums[i] > max{
                max = i + nums[i]
                if max >= last  {
                    return true
                }
            }
            i += 1
        }
        return false
    }
    
    //    func canJump_helper(nums: [Int], position:Int, last:Int) -> Bool {
    //        if position == last {
    //            return true
    //        }
    //        if nums[position] > 0 {
    //            for i in 1...nums[position] {
    //                if canJump_helper(nums: nums, position: position + i, last: last) {
    //                    return true
    //                }
    //            }
    //        }
    //        return false
    //    }
    //    func canJump(_ nums: [Int]) -> Bool {
    //        return canJump_helper(nums: nums, position: 0, last: nums.count - 1)
    //    }

}
func q0055() -> () {
    let solution = q0055Solution()
    let array = [2,3,1,1,4]
    let result = solution.canJump(array)
    print(result)
}
