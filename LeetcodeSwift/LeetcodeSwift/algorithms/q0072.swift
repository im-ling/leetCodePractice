//
//  q0072.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 05/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//72. Edit Distance
//Hard
//
//3022
//
//44
//
//Add to List
//
//Share
//Given two words word1 and word2, find the minimum number of operations required to convert word1 to word2.
//
//You have the following 3 operations permitted on a word:
//
//Insert a character
//Delete a character
//Replace a character
//Example 1:
//
//Input: word1 = "horse", word2 = "ros"
//Output: 3
//Explanation:
//horse -> rorse (replace 'h' with 'r')
//rorse -> rose (remove 'r')
//rose -> ros (remove 'e')
//Example 2:
//
//Input: word1 = "intention", word2 = "execution"
//Output: 5
//Explanation:
//intention -> inention (remove 't')
//inention -> enention (replace 'i' with 'e')
//enention -> exention (replace 'n' with 'x')
//exention -> exection (replace 'n' with 'c')
//exection -> execution (insert 'u')
//Accepted
//226,210
//Submissions
//547,223
class q0072Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        if word1.count == 0{
            return word2.count
        }
        if word2.count == 0 {
            return word1.count
        }
        let word1Array = [Character].init(word1)
        let word2Array = [Character].init(word2)
        let m = word1.count + 1
        let n = word2.count + 1
        var dp = [[Int]].init(repeating: [Int].init(repeating: 0, count: n), count: m)
        for i in 1..<m {
            dp[i][0] = i
        }
        for i in 1..<n {
            dp[0][i] = i
        }
        
        for i in 1..<m {
            for j in 1..<n {
                if word1Array[i - 1] == word2Array[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1]
                }else{
                    dp[i][j] = 1 + min(min(dp[i - 1][j], dp[i][j - 1]), dp[i - 1][j - 1])
                }
            }
        }

        return dp[m - 1][n - 1]
    }
}
func q0072(){
    let solution = q0072Solution()
    let word1 = "horse"
    let word2 = "ros"
    let result = solution.minDistance(word1, word2)
    print(result)
}
