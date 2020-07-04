//
//  q1201.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 05/07/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//1201. Ugly Number III
//Medium
//
//221
//
//209
//
//Add to List
//
//Share
//Write a program to find the n-th ugly number.
//
//Ugly numbers are positive integers which are divisible by a or b or c.
//
//
//
//Example 1:
//
//Input: n = 3, a = 2, b = 3, c = 5
//Output: 4
//Explanation: The ugly numbers are 2, 3, 4, 5, 6, 8, 9, 10... The 3rd is 4.
//Example 2:
//
//Input: n = 4, a = 2, b = 3, c = 4
//Output: 6
//Explanation: The ugly numbers are 2, 3, 4, 6, 8, 9, 10, 12... The 4th is 6.
//Example 3:
//
//Input: n = 5, a = 2, b = 11, c = 13
//Output: 10
//Explanation: The ugly numbers are 2, 4, 6, 8, 10, 11, 12, 13... The 5th is 10.
//Example 4:
//
//Input: n = 1000000000, a = 2, b = 217983653, c = 336916467
//Output: 1999999984
//
//
//Constraints:
//
//1 <= n, a, b, c <= 10^9
//1 <= a * b * c <= 10^18
//It's guaranteed that the result will be in range [1, 2 * 10^9]
//Accepted
//8,659
//Submissions
//33,805
class q1201Solution {
    func gcd(a:Int, b:Int) -> Int{
        if a % b == 0 {
            return b
        }else{
            return gcd(a: b, b: a % b)
        }
    }
    
    func nthUglyNumber(_ n: Int, _ a: Int, _ b: Int, _ c: Int) -> Int {
        let factors = [a,b,c].sorted()
        let a = factors[0]
        let b = factors[1]
        let c = factors[2]
        
        let ab = a * b / gcd(a: a, b: b)
        let ac = a * c / gcd(a: a, b: c)
        let bc = b * c / gcd(a: b, b: c)
        let abc = ab * c / gcd(a: ab, b: c)

        var left = 1
        var right = 2000000000
        var result = 0
        while left <= right {
            let mid = (left + right) / 2
            let target = mid / a + mid / b + mid / c - mid / ab - mid / ac - mid / bc + mid / abc
            if target == n {
                result = mid
                break
            }else if target > n {
                right = mid - 1
            }else{
                left = mid + 1
            }
        }
        while result % a != 0 && result % b != 0 && result % c != 0 {
            result -= 1
        }
        return result
    }
}

func q1201(){
    let solu = q1201Solution()
    let n = 10
    let a = 7
    let b = 6
    let c = 8
    let result = solu.nthUglyNumber(n, a, b, c)
    print(result)
}
