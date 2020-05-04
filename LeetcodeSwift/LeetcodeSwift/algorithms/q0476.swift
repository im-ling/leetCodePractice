//
//  q0476.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 05/05/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//476. Number Complement
//Easy
//
//760
//
//79
//
//Add to List
//
//Share
//Given a positive integer, output its complement number. The complement strategy is to flip the bits of its binary representation.
//
//
//
//Example 1:
//
//Input: 5
//Output: 2
//Explanation: The binary representation of 5 is 101 (no leading zero bits), and its complement is 010. So you need to output 2.
//
//
//Example 2:
//
//Input: 1
//Output: 0
//Explanation: The binary representation of 1 is 1 (no leading zero bits), and its complement is 0. So you need to output 0.
//
//
//Note:
//
//The given integer is guaranteed to fit within the range of a 32-bit signed integer.
//You could assume no leading zero bit in the integer’s binary representation.
//This question is the same as 1009: https://leetcode.com/problems/complement-of-base-10-integer/
//Accepted
//147,308
//Submissions
//229,992
class q0476Solution {
    func findComplement(_ num: Int) -> Int {
        var tempNum = num
        var bits = 0
        while tempNum > 0 {
            tempNum >>= 1
            bits = (bits << 1) + 1
        }
        return bits ^ num
    }
}

func q0476(){
    let solu = q0476Solution()
    print(solu.findComplement(5))
}
