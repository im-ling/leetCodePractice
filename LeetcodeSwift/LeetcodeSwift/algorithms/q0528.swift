//
//  q0528.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 06/06/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//528. Random Pick with Weight
//Medium
//
//592
//
//1354
//
//Add to List
//
//Share
//Given an array w of positive integers, where w[i] describes the weight of index i, write a function pickIndex which randomly picks an index in proportion to its weight.
//
//Note:
//
//1 <= w.length <= 10000
//1 <= w[i] <= 10^5
//pickIndex will be called at most 10000 times.
//Example 1:
//
//Input:
//["Solution","pickIndex"]
//[[[1]],[]]
//Output: [null,0]
//Example 2:
//
//Input:
//["Solution","pickIndex","pickIndex","pickIndex","pickIndex","pickIndex"]
//[[[1,3]],[],[],[],[],[]]
//Output: [null,0,1,1,1,0]
//Explanation of Input Syntax:
//
//The input is two lists: the subroutines called and their arguments. Solution's constructor has one argument, the array w. pickIndex has no arguments. Arguments are always wrapped with a list, even if there aren't any.
//
//Accepted
//68,330
//Submissions
//156,043

class q0528Solution {
    fileprivate var numbers = [Int]()
    fileprivate var length = 0

    init(_ w: [Int]) {
        numbers.removeAll()
        var number = 0
        for item in w {
            number += item
            numbers.append(number)
        }
        length = number
    }
    
    func pickIndex() -> Int {
        guard length > 0 else {
            return 0
        }
        let number = Int.random(in: 1 ... length)
        var left = 0
        var right = numbers.count - 1
        var result = 0
        while left <= right {
            let mid = (left + right) / 2
            if numbers[mid] == number {
                result = mid
                break
            }else if number < numbers[mid] {
                right = mid - 1
            }else if number > numbers[mid]{
                result = mid
                left = mid + 1
            }
        }
        return result
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(w)
 * let ret_1: Int = obj.pickIndex()
 */
