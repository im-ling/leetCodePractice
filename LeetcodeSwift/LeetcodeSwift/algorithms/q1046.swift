//
//  q1046.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 12/04/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//1046. Last Stone Weight
//Easy
//
//448
//
//23
//
//Add to List
//
//Share
//We have a collection of stones, each stone has a positive integer weight.
//
//Each turn, we choose the two heaviest stones and smash them together.  Suppose the stones have weights x and y with x <= y.  The result of this smash is:
//
//If x == y, both stones are totally destroyed;
//If x != y, the stone of weight x is totally destroyed, and the stone of weight y has new weight y-x.
//At the end, there is at most 1 stone left.  Return the weight of this stone (or 0 if there are no stones left.)
//
//
//
//Example 1:
//
//Input: [2,7,4,1,8,1]
//Output: 1
//Explanation:
//We combine 7 and 8 to get 1 so the array converts to [2,4,1,1,1] then,
//we combine 2 and 4 to get 2 so the array converts to [2,1,1,1] then,
//we combine 2 and 1 to get 1 so the array converts to [1,1,1] then,
//we combine 1 and 1 to get 0 so the array converts to [1] then that's the value of last stone.
//
//
//Note:
//
//1 <= stones.length <= 30
//1 <= stones[i] <= 1000
//Accepted
//49,531
//Submissions
//78,540

class q1046Solution {
    func lastStoneWeight(_ stones: [Int]) -> Int {
        if stones.count < 1 {
            return 0
        }
        if stones.count < 2{
            return stones[0]
        }
        var stones2 = stones.sorted()
        while stones2.count > 1 {
//            print(stones2)
            let last = stones2.popLast()!
            let last2 = stones2.popLast()!
            let result = abs(last - last2)
            if result > 0 {
                var start = 0
                var end = stones2.count - 1
                while start <= end {
                    let mid = (end - start) % 2 + start
                    if stones2[mid] == result {
                        start = mid
                        end = mid
                        break
                    }else if stones2[mid] > result{
                        end = mid - 1
                    }else{
                        start = mid + 1
                    }
                }
//                print("\(last) \(last2)   \(start) \(end)")
                stones2.insert(result, at: start)
            }
        }
        if stones2.count < 1 {
            return 0
        }else{
            return stones2[0]
        }
    }
}
func q1046() -> () {
    let solution = q1046Solution()
    let numbers = [2, 10, 10, 45, 46, 57, 51, 66, 71, 73, 106, 157, 187, 212, 283, 303, 316, 398, 405, 425, 464, 477, 508, 590, 600, 604]
    let result = solution.lastStoneWeight(numbers)
    print(result)
}
