//
//  q1143.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 26/04/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//1143. Longest Common Subsequence
//Medium
//
//858
//
//11
//
//Add to List
//
//Share
//Given two strings text1 and text2, return the length of their longest common subsequence.
//
//A subsequence of a string is a new string generated from the original string with some characters(can be none) deleted without changing the relative order of the remaining characters. (eg, "ace" is a subsequence of "abcde" while "aec" is not). A common subsequence of two strings is a subsequence that is common to both strings.
//
//
//
//If there is no common subsequence, return 0.
//
//
//
//Example 1:
//
//Input: text1 = "abcde", text2 = "ace"
//Output: 3
//Explanation: The longest common subsequence is "ace" and its length is 3.
//Example 2:
//
//Input: text1 = "abc", text2 = "abc"
//Output: 3
//Explanation: The longest common subsequence is "abc" and its length is 3.
//Example 3:
//
//Input: text1 = "abc", text2 = "def"
//Output: 0
//Explanation: There is no such common subsequence, so the result is 0.
//
//
//Constraints:
//
//1 <= text1.length <= 1000
//1 <= text2.length <= 1000
//The input strings consist of lowercase English characters only.
//Accepted
//61,252
//Submissions
//104,577

class q1143Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        guard text1.count > 0 && text2.count > 0 else { return 0 }
        let array1 = Array.init(text1)
        let array2 = Array.init(text2)
        var dp = [[Int]].init(repeating: [Int].init(repeating: 0, count: array1.count), count: array2.count)
        if array1[0] == array2[0] {
            dp[0][0] = 1
        }
        for i in 1..<array1.count {
            if array1[i] == array2[0] {
                dp[0][i] = 1
            }else{
                dp[0][i] = dp[0][i - 1]
            }
        }
        
        for i in 1..<array2.count {
            if array1[0] == array2[i] {
                dp[i][0] = 1
            }else{
                dp[i][0] = dp[i - 1][0]
            }
        }
        
        for i in 1..<array2.count {
            for j in 1..<array1.count {
                if array1[j] == array2[i] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                }else{
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        return dp[array2.count - 1][array1.count - 1]
    }
}

func q1143() -> () {
    let solution = q1143Solution()
    let text1 = "abcde", text2 = "ace"
    let result = solution.longestCommonSubsequence(text1, text2)
    print(result)
}
