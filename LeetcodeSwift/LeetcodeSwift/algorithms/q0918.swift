//
//  q0918.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 15/05/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//918. Maximum Sum Circular Subarray
//Medium
//
//590
//
//26
//
//Add to List
//
//Share
//Given a circular array C of integers represented by A, find the maximum possible sum of a non-empty subarray of C.
//
//Here, a circular array means the end of the array connects to the beginning of the array.  (Formally, C[i] = A[i] when 0 <= i < A.length, and C[i+A.length] = C[i] when i >= 0.)
//
//Also, a subarray may only include each element of the fixed buffer A at most once.  (Formally, for a subarray C[i], C[i+1], ..., C[j], there does not exist i <= k1, k2 <= j with k1 % A.length = k2 % A.length.)
//
//
//
//Example 1:
//
//Input: [1,-2,3,-2]
//Output: 3
//Explanation: Subarray [3] has maximum sum 3
//Example 2:
//
//Input: [5,-3,5]
//Output: 10
//Explanation: Subarray [5,5] has maximum sum 5 + 5 = 10
//Example 3:
//
//Input: [3,-1,2,-1]
//Output: 4
//Explanation: Subarray [2,-1,3] has maximum sum 2 + (-1) + 3 = 4
//Example 4:
//
//Input: [3,-2,2,-3]
//Output: 3
//Explanation: Subarray [3] and [3,-2,2] both have maximum sum 3
//Example 5:
//
//Input: [-2,-3,-1]
//Output: -1
//Explanation: Subarray [-1] has maximum sum -1
//
//
//Note:
//
//-30000 <= A[i] <= 30000
//1 <= A.length <= 30000
//Accepted
//19,281
//Submissions
//56,779
class q0918Solution {
    func maxSubarraySumCircular(_ A: [Int]) -> Int {
        let threshold = 30000
        var maxVal = -threshold
        var minVal = threshold
        var totalSum = 0
        var tempMax = maxVal
        var tempMin = minVal
        for i in A {
            tempMax = max(i, i + tempMax)
            if tempMax > maxVal {
                maxVal = tempMax
            }
            tempMin = min(i, i + tempMin)
            if tempMin < minVal {
                minVal = tempMin
            }
            totalSum += i
        }
        if maxVal < 0 {
            return maxVal
        }
        return totalSum - minVal > maxVal ? (totalSum - minVal) : maxVal
    }
}

func q0918() -> () {
    let solution = q0918Solution()
    let numbers = [52,183,124,154,-170,-191,-240,107,-178,171,75,186,-125,61,-298,284,21,-73,-294,253,146,248,-248,127,26,289,118,-22,-300,26,-116,-113,-44,29,252,-278,47,254,-106,246,-275,42,257,15,96,-298,-69,-104,-239,-95,-4,76,-202,156,-14,-178,188,-84,78,-195,-125,28,109,125,-25,-53,58,287,55,-296,198,281,53,-160,146,298,25,-41,-3,27,-242,169,287,-281,19,91,213,115,211,-218,124,-25,-272,278,296,-177,-166,-192,97,-49,-25,168,-81,6,-94,267,293,146,-1,-258,256,283,-156,197,28,78,267,-151,-230,-66,100,-94,-66,-123,121,-214,-182,187,65,-186,215,273,243,-99,-76,178,59,190,279,300,217,67,-117,170,163,153,-37,-147,-251,296,-176,117,68,258,-159,-300,-36,-91,-60,195,-293,-116,208,175,-100,-97,188,79,-270,80,100,211,112,264,-217,-142,5,105,171,-264,-247,138,275,227,-86,30,-219,153,10,-66,267,22,-56,-70,-234,-66,89,182,110,-146,162,-48,-201,-240,-225,-15,-275,129,-117,28,150,84,-264,249,-85,70,-140,-259,26,162,5,-203,143,184,101,140,207,131,177,274,-178,-79,14,-36,104,52,31,257,273,-52,74,276,104,-133,-255,188,-252,229,200,-74,-39,-250,142,-201,-196,-43,-40,255,-149,-299,-197,-175,-96,-155,-196,-24,12,79,71,-144,-59,-120,227,-256,-163,-297,116,286,-283,-31,-221,-41,121,-170,160,205,8,88,25,-272,-107,292,-180,299,94,-97,-81,-134,37,238]
    let result = solution.maxSubarraySumCircular(numbers)
    print(result)
}
