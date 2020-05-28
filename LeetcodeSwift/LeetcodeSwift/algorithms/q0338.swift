//
//  q0338.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 28/05/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//338. Counting Bits
//Medium
//
//2390
//
//150
//
//Add to List
//
//Share
//Given a non negative integer number num. For every numbers i in the range 0 ≤ i ≤ num calculate the number of 1's in their binary representation and return them as an array.
//
//Example 1:
//
//Input: 2
//Output: [0,1,1]
//Example 2:
//
//Input: 5
//Output: [0,1,1,2,1,2]
//Follow up:
//
//It is very easy to come up with a solution with run time O(n*sizeof(integer)). But can you do it in linear time O(n) /possibly in a single pass?
//Space complexity should be O(n).
//Can you do it like a boss? Do it without using any builtin function like __builtin_popcount in c++ or in any other language.

class q0338Solution {
    func countBits(_ num: Int) -> [Int] {
        var result = [0]
        if num < 2 {
            for _ in 0..<num {
                result.append(1)
            }
            return result
        }
        result.append(1)
        var upper = 2
        var index = 1
        for i in 2...num {
            if i == upper {
                upper <<= 1
                index = 1
                result.append(1)
            }else{
                result.append(result[index] + 1)
                index += 1
            }
        }
        return result
    }
}
