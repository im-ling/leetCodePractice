//
//  q0050.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 02/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//50. Pow(x, n)
//Medium
//
//1179
//
//2668
//
//Add to List
//
//Share
//Implement pow(x, n), which calculates x raised to the power n (xn).
//
//Example 1:
//
//Input: 2.00000, 10
//Output: 1024.00000
//Example 2:
//
//Input: 2.10000, 3
//Output: 9.26100
//Example 3:
//
//Input: 2.00000, -2
//Output: 0.25000
//Explanation: 2-2 = 1/22 = 1/4 = 0.25
//Note:
//
//-100.0 < x < 100.0
//n is a 32-bit signed integer, within the range [−231, 231 − 1]
//Accepted
//410,598
//Submissions
//1,411,686
class q0050Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1
        }
        var factor = x
        var times = n
        if n < 0 {
            factor = 1.0 / x
            times = -n
        }
        var result = 1.0
        while times > 0 {
            if times & 1 == 1 {
                result *= factor
            }
            times >>= 1
            factor *= factor
        }
        return result
    }
}


func q0050() -> () {
    let solution = q0050Solution()
    let result = solution.myPow(2,10)
    print(result)
}
