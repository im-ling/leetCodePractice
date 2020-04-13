//
//  q0525.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 13/04/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//525. Contiguous Array
//Medium
//
//1130
//
//53
//
//Add to List
//
//Share
//Given a binary array, find the maximum length of a contiguous subarray with equal number of 0 and 1.
//
//Example 1:
//Input: [0,1]
//Output: 2
//Explanation: [0, 1] is the longest contiguous subarray with equal number of 0 and 1.
//Example 2:
//Input: [0,1,0]
//Output: 2
//Explanation: [0, 1] (or [1, 0]) is a longest contiguous subarray with equal number of 0 and 1.
//Note: The length of the given binary array will not exceed 50,000.
//
//Accepted
//58,107
//Submissions
//130,169
class q0525Solution {
    
    func findMaxLength(_ nums: [Int]) -> Int {

        var nums2 = nums
        for i in 0..<nums2.count {
            if nums2[i] == 0 {
                nums2[i] = -1
            }
        }

        var result = 0
        var dic = [0: -1]
        var key = 0
        for i in 0..<nums2.count {
            key += nums2[i]
            if dic[key] != nil{
                if i - dic[key]! > result {
                    result = i - dic[key]!
                }
            }else{
                dic[key] = i
            }
        }
        return result
    }
    
    func findMaxLength2(_ nums: [Int]) -> Int {
        var result = 0
        var records = [Int].init(repeating: 0, count: nums.count)
        var start = 0
        var j = 0
        
        var nums2 = nums
        for i in 0..<nums2.count {
            if(nums2[i] == 0){
                nums2[i] = -1
            }
        }
        for i in 0..<nums2.count {
            j = start
            while j <= i {
                if nums2.count - j < result {
                    break
                }
                records[j] += nums2[i]
                if abs(records[j])  > nums2.count - j {
                    start = j + 1
                }

                if records[j] == 0 && i - j > result{
                    result = i - j
//                    print("\(i) \(j)")
                }
                j += 1
            }
        }
        if result != 0 {
            result += 1
        }
        return result
    }
}
func q0525() -> () {
    let nums = [0,1]
    let result = q0525Solution().findMaxLength(nums)
    print(result)
}
