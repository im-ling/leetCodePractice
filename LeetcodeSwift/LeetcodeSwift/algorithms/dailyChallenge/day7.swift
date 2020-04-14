//
//  day7.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 07/04/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation

//day7
// https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/528/week-1/3289/
//Counting Elements
//Solution
//Given an integer array arr, count element x such that x + 1 is also in arr.
//
//If there're duplicates in arr, count them seperately.
//
//
//
//Example 1:
//
//Input: arr = [1,2,3]
//Output: 2
//Explanation: 1 and 2 are counted cause 2 and 3 are in arr.
//Example 2:
//
//Input: arr = [1,1,3,3,5,5,7,7]
//Output: 0
//Explanation: No numbers are counted, cause there's no 2, 4, 6, or 8 in arr.
//Example 3:
//
//Input: arr = [1,3,2,3,5,0]
//Output: 3
//Explanation: 0, 1 and 2 are counted cause 1, 2 and 3 are in arr.
//Example 4:
//
//Input: arr = [1,1,2,2]
//Output: 2
//Explanation: Two 1s are counted cause 2 is in arr.
//
//
//Constraints:
//
//1 <= arr.length <= 1000
//0 <= arr[i] <= 1000

class Day7Solution {
    func countElements(_ arr: [Int]) -> Int {
        var dic = Dictionary<Int,Int>()
        for i in arr {
            if dic[i] != nil {
                dic[i]! += 1
            }else{
                dic[i] = 1
            }
        }
        
        var result = 0
        for key in dic.keys {
            if dic[key + 1] != nil {
                result += dic[key]!
            }
        }
        return result
    }
}

func day7(){
    let nums = [1,1,2,2,3]
    let result = Day7Solution().countElements(nums)
    print(result)
}
