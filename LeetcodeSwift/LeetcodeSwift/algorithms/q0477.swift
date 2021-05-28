//
//  q0477.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 28/05/2021.
//  Copyright © 2021 DL. All rights reserved.
//

import Foundation
class q0477Solution {
    func totalHammingDistance(_ nums: [Int]) -> Int {
        var array = Array.init(repeating: 0, count: 30)
        for num in nums {
            var pos = 0
            var tmp = num
            while tmp > 0{
                array[pos] += tmp % 2
                tmp /= 2
                pos += 1
            }
        }
        var result = 0
        for count in array {
            result += count * (nums.count - count)
        }
        return result
    }
}

func q0477(){
    let solu = q0477Solution()
    let nums = [1,2,3]
    print(solu.totalHammingDistance(nums))
}
