//
//  q0097.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 14/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//97. Interleaving String
//Hard
//
//1163
//
//72
//
//Add to List
//
//Share
//Given s1, s2, s3, find whether s3 is formed by the interleaving of s1 and s2.
//
//Example 1:
//
//Input: s1 = "aabcc", s2 = "dbbca", s3 = "aadbbcbcac"
//Output: true
//Example 2:
//
//Input: s1 = "aabcc", s2 = "dbbca", s3 = "aadbbbaccc"
//Output: false
//Accepted
//138,463
//Submissions
//458,467
class q0097Solution {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        if s1.count + s2.count != s3.count {
            return false
        }
        let charsS1 = [Character].init(s1)
        let charsS2 = [Character].init(s2)
        let charsS3 = [Character].init(s3)
        let lenS1 = s1.count
        let lenS2 = s2.count
        var dp = [[Bool]].init(repeating: [Bool].init(repeating: false, count: lenS2 + 1), count: lenS1 + 1)
        dp[lenS1][lenS2] = true
        for i in (0..<lenS2).reversed() {
            dp[lenS1][i] = (charsS2[i] == charsS3[lenS1 + i]) && dp[lenS1][i + 1]
        }
        for i in (0..<lenS1).reversed() {
            dp[i][lenS2] = (charsS1[i] == charsS3[lenS2 + i]) && dp[i + 1][lenS2]
        }
        for i in (0..<lenS1).reversed() {
            for j in (0..<lenS2).reversed() {
                dp[i][j] = (dp[i + 1][j] && charsS1[i] == charsS3[i + j]) || (dp[i][j + 1] && charsS2[j] == charsS3[i + j])
            }
        }
        return dp[0][0]
    }
}

func q0097(){
    let solution = q0097Solution()
    let s1 = ""
    let s2 = ""
    let s3 = "a"
    let result = solution.isInterleave(s1, s2, s3)
    print(result)
}
