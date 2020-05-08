//
//  q0367.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 09/05/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//367. Valid Perfect Square
//Easy
//
//684
//
//150
//
//Add to List
//
//Share
//Given a positive integer num, write a function which returns True if num is a perfect square else False.
//
//Note: Do not use any built-in library function such as sqrt.
//
//Example 1:
//
//Input: 16
//Output: true
//Example 2:
//
//Input: 14
//Output: false
//Accepted
//164,866
//Submissions
//399,571
class q0367Solution {
    func isPerfectSquare(_ num: Int) -> Bool {
        var temp = num
        var bits = 0
        while temp > 0 {
            temp >>= 1
            bits += 1
        }
        var upper = 1
        for _ in 0..<(bits + 1)/2 {
            upper = (upper << 1) + 1
        }
        var lower = 1
        for _ in 0..<(bits - 1) / 2{
            lower <<= 1
        }
        while lower <= upper {
            let mid = (lower + upper) / 2
            if mid * mid == num {
                return true
            }else if mid * mid > num {
                upper = mid - 1
            }else{
                lower = mid + 1
            }
        }
        return false
    }
}

func q0367(){
    let solution = q0367Solution()
    let result = solution.isPerfectSquare(16)
    print(result)
}
