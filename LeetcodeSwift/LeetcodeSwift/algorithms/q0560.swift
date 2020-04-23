//
//  q0560.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 23/04/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
class q0560Solution {
    
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var result = 0
        var map = [Int:Int]()
        map[0] = 1
        var sum = 0
        for i in nums {
            sum += i
            if map[sum - k] != nil {
                result += map[sum - k]!
            }
            map[sum] = (map[sum] ?? 0) + 1
        }
        return result
    }    
    
    func subarraySum2(_ nums: [Int], _ k: Int) -> Int {
        var sums = [Int]()
        var result = 0
        var sum = 0
        for item in nums {
            sum += item
            if sum == k {
                result += 1
            }
            sums.append(sum)
        }
        
        for i in (1..<sums.count).reversed(){
            for j in 0..<i {
                if sums[i] - sums[j] == k {
                    result += 1
                }
            }
        }
        
        return result
    }
}

func q0560() -> () {
    let nums = [1,1,1,1,1,-2]
    let k = 2
    let solution = q0560Solution()
    let result = solution.subarraySum(nums, k)
    print(result)
}
