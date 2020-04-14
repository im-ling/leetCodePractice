//
//  day14.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 14/04/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//day 14
//https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/529/week-2/3299/
//Perform String Shifts
//You are given a string s containing lowercase English letters, and a matrix shift, where shift[i] = [direction, amount]:
//
//direction can be 0 (for left shift) or 1 (for right shift).
//amount is the amount by which string s is to be shifted.
//A left shift by 1 means remove the first character of s and append it to the end.
//Similarly, a right shift by 1 means remove the last character of s and add it to the beginning.
//Return the final string after all operations.
//
//
//
//Example 1:
//
//Input: s = "abc", shift = [[0,1],[1,2]]
//Output: "cab"
//Explanation:
//[0,1] means shift to left by 1. "abc" -> "bca"
//[1,2] means shift to right by 2. "bca" -> "cab"
//Example 2:
//
//Input: s = "abcdefg", shift = [[1,1],[1,1],[0,2],[1,3]]
//Output: "efgabcd"
//Explanation:
//[1,1] means shift to right by 1. "abcdefg" -> "gabcdef"
//[1,1] means shift to right by 1. "gabcdef" -> "fgabcde"
//[0,2] means shift to left by 2. "fgabcde" -> "abcdefg"
//[1,3] means shift to right by 3. "abcdefg" -> "efgabcd"
//
//
//Constraints:
//
//1 <= s.length <= 100
//s only contains lower case English letters.
//1 <= shift.length <= 100
//shift[i].length == 2
//0 <= shift[i][0] <= 1
//0 <= shift[i][1] <= 100

class Day14Solution {
    func stringShift(_ s: String, _ shift: [[Int]]) -> String {
        var finalShift = 0
        for item in shift {
            if item[0] == 0 {
                finalShift -= item[1]
            }else{
                finalShift += item[1]
            }
        }
        finalShift = finalShift % s.count
        
        // string concatenation
        if finalShift == 0 {
            return s
        }else if finalShift > 0{
            return s[s.count - finalShift..<s.count] + s[0..<s.count-finalShift]
        }else{
            finalShift = -finalShift
            return s[finalShift..<s.count] + s[0..<finalShift]
        }
    }
}

func day14(){
    let s = "wpdhhcj"
    let shift = [[0,7],[1,7],[1,0],[1,3],[0,3],[0,6],[1,2]]
    let result = Day14Solution().stringShift(s, shift)
    print(result)
}
