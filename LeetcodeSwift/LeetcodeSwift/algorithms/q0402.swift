//
//  q0402.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 13/05/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//402. Remove K Digits
//Medium
//
//1582
//
//85
//
//Add to List
//
//Share
//Given a non-negative integer num represented as a string, remove k digits from the number so that the new number is the smallest possible.
//
//Note:
//The length of num is less than 10002 and will be ≥ k.
//The given num does not contain any leading zero.
//Example 1:
//
//Input: num = "1432219", k = 3
//Output: "1219"
//Explanation: Remove the three digits 4, 3, and 2 to form the new number 1219 which is the smallest.
//Example 2:
//
//Input: num = "10200", k = 1
//Output: "200"
//Explanation: Remove the leading 1 and the number is 200. Note that the output must not contain leading zeroes.
//Example 3:
//
//Input: num = "10", k = 2
//Output: "0"
//Explanation: Remove all the digits from the number and it is left with nothing which is 0.
//Accepted
//92,524
//Submissions
//334,017


class q0402Solution {
    func removeKdigits(_ num: String, _ k: Int) -> String {
        if k >= num.count {
            return "0"
        }
        var nums = Array.init(num)
        var right = nums.count - 1
        var left = 0
        var count = 0
        while left < right {
            if nums[left] > nums[left + 1]{
                count += 1
                nums.remove(at: left)
                right -= 1
                if count >= k {
                    break;
                }
                if left > 0 {
                    left -= 1
                }
            }else{
                left += 1
            }
        }
        for _ in count..<k {
            nums.removeLast()
        }
        while nums.first == "0" {
            nums.removeFirst()
        }
        if nums.count > 0 {
            return String.init(nums)
        }else{
            return "0";
        }
    }
}
func q0402(){
    let solu = q0402Solution()
    let num = "1234567890", k = 9
    print(solu.removeKdigits(num, k))
}
