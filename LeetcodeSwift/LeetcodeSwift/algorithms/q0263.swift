//
//  q0263.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 05/07/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//263. Ugly Number
//Easy
//
//463
//
//622
//
//Add to List
//
//Share
//Write a program to check whether a given number is an ugly number.
//
//Ugly numbers are positive numbers whose prime factors only include 2, 3, 5.
//
//Example 1:
//
//Input: 6
//Output: true
//Explanation: 6 = 2 × 3
//Example 2:
//
//Input: 8
//Output: true
//Explanation: 8 = 2 × 2 × 2
//Example 3:
//
//Input: 14
//Output: false
//Explanation: 14 is not ugly since it includes another prime factor 7.
//Note:
//
//1 is typically treated as an ugly number.
//Input is within the 32-bit signed integer range: [−231,  231 − 1].
//Accepted
//202,612
//Submissions
//489,477
class q0263Solution {
    func isUgly(_ num: Int) -> Bool {
        if num < 1 {
            return false
        }
        let factors = [2,3,5]
        var result = num
        for factor in factors {
            while result % factor == 0 {
                result = result / factor
            }
        }
        return result == 1
    }
}
