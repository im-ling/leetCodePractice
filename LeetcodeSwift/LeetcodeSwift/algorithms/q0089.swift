//
//  q0089.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 13/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//89. Gray Code
//Medium
//
//546
//
//1429
//
//Add to List
//
//Share
//The gray code is a binary numeral system where two successive values differ in only one bit.
//
//Given a non-negative integer n representing the total number of bits in the code, print the sequence of gray code. A gray code sequence must begin with 0.
//
//Example 1:
//
//Input: 2
//Output: [0,1,3,2]
//Explanation:
//00 - 0
//01 - 1
//11 - 3
//10 - 2
//
//For a given n, a gray code sequence may not be uniquely defined.
//For example, [0,2,3,1] is also a valid gray code sequence.
//
//00 - 0
//10 - 2
//11 - 3
//01 - 1
//Example 2:
//
//Input: 0
//Output: [0]
//Explanation: We define the gray code sequence to begin with 0.
//             A gray code sequence of n has size = 2n, which for n = 0 the size is 20 = 1.
//             Therefore, for n = 0 the gray code sequence is [0].
//Accepted
//153,538
//Submissions
//320,179

class q0089Solution {
    func grayCode(_ n: Int) -> [Int] {
        if n < 1 {
            return [0]
        }
        var result = [0,1]
        for i in 1..<n {
            let highest = 1 << i
            for j in (0..<result.count).reversed() {
                result.append(result[j] | highest)
            }
        }
        return result
    }
}

func q0089(){
    let solution = q0089Solution()
    let result = solution.grayCode(4)
    print(result)
}
