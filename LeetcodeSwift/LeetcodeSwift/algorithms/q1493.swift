//
//  q5434.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 27/06/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//5434. Longest Subarray of 1's After Deleting One Element
//User Accepted:388
//User Tried:443
//Total Accepted:391
//Total Submissions:505
//Difficulty:Medium
//Given a binary array nums, you should delete one element from it.
//
//Return the size of the longest non-empty subarray containing only 1's in the resulting array.
//
//Return 0 if there is no such subarray.
//
//
//
//Example 1:
//
//Input: nums = [1,1,0,1]
//Output: 3
//Explanation: After deleting the number in position 2, [1,1,1] contains 3 numbers with value of 1's.
//Example 2:
//
//Input: nums = [0,1,1,1,0,1,1,0,1]
//Output: 5
//Explanation: After deleting the number in position 4, [0,1,1,1,1,1,0,1] longest subarray with value of 1's is [1,1,1,1,1].
//Example 3:
//
//Input: nums = [1,1,1]
//Output: 2
//Explanation: You must delete one element.
//Example 4:
//
//Input: nums = [1,1,0,0,1,1,1,0,1]
//Output: 4
//Example 5:
//
//Input: nums = [0,0,0]
//Output: 0
//
//
//Constraints:
//
//1 <= nums.length <= 10^5
//nums[i] is either 0 or 1.
class q1493Solution {
    func longestSubarray(_ nums: [Int]) -> Int {
        var result = 0
        var record = [0]
        var count = 0
        for num in nums {
            if num == 0 {
                if count >= 1 && record[count] == record[count - 1] && record[count] == 0 {
                }else{
                    record.append(0)
                    count += 1
                }
            }else{
                record[count] += 1
                if count > 0 && record[count] + record[count - 1] > result {
                    result = record[count] + record[count - 1]
                }
            }
        }
        if record[0] > result {
            result = record[0]
            if count == 0 {
                result -= 1
            }
        }
        return result
    }
}
