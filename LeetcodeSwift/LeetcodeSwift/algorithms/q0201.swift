//
//  q0201.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 23/04/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation

//201. Bitwise AND of Numbers Range
//Medium
//
//636
//
//87
//
//Add to List
//
//Share
//Given a range [m, n] where 0 <= m <= n <= 2147483647, return the bitwise AND of all numbers in this range, inclusive.
//
//Example 1:
//
//Input: [5,7]
//Output: 4
//Example 2:
//
//Input: [0,1]
//Output: 0
//Accepted
//100,645
//Submissions
//270,689

class q0201Solution {
    func rangeBitwiseAnd(_ m: Int, _ n: Int) -> Int {
        if m == n {
            return m & n
        }
        var maxValue = 2147483647
        var number = 1
        var i = m
        while i < n && number < n {
            if i & number == 0 {
                number <<= 1
                maxValue <<= 1
            }else{
                i += number
            }
        }
        return m & n & maxValue
    }
}

func q0201(){
    let m = 0
    let n = 1
    let solution = q0201Solution()
    let result = solution.rangeBitwiseAnd(m, n)
    print(result)
}
