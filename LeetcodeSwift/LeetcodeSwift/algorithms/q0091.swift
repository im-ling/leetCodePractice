//
//  q0091.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 13/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//91. Decode Ways
//Medium
//
//2159
//
//2410
//
//Add to List
//
//Share
//A message containing letters from A-Z is being encoded to numbers using the following mapping:
//
//'A' -> 1
//'B' -> 2
//...
//'Z' -> 26
//Given a non-empty string containing only digits, determine the total number of ways to decode it.
//
//Example 1:
//
//Input: "12"
//Output: 2
//Explanation: It could be decoded as "AB" (1 2) or "L" (12).
//Example 2:
//
//Input: "226"
//Output: 3
//Explanation: It could be decoded as "BZ" (2 26), "VF" (22 6), or "BBF" (2 2 6).
//Accepted
//348,522
//Submissions
//1,469,932
class q0091Solution {
    func numDecodings(_ s: String) -> Int {
        if s.count < 1{
            return 0
        }
        let c0 = Character.init("0")
        let c1 = Character.init("1")
        let c2 = Character.init("2")
        let c7 = Character.init("7")
        var charArray = [Character].init(s)
        if charArray[0] == c0 {
            return 0
        }
        let len = charArray.count
        charArray.append("1")
        var dp = [Int].init(repeating: 0, count: len + 1)
        dp[len] = 1
        dp[len - 1] = 1
        for i in (0..<len - 1).reversed() {
            dp[i] = dp[i + 1]
            if charArray[i + 1] == c0 {
                if charArray[i] == c0 || charArray[i] > c2{
                    return 0
                }
            }else if (charArray[i] == c1 || (charArray[i] == c2 && charArray[i + 1] < c7)) && charArray[i + 2] != c0{
                dp[i] += dp[i + 2]
            }
            print(dp)
        }
        return dp[0]
    }
}
func q0091(){
    let solution = q0091Solution()
    let string = "110"
    let result = solution.numDecodings(string)
    print(result)
}
