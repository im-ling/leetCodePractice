//
//  q1480.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 18/06/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
class q1480Solution {
    func runningSum(_ nums: [Int]) -> [Int] {
        var result = [Int]()
        var sum = 0
        for number in nums {
            sum += number
            result.append(sum)
        }
        return result
    }
}
