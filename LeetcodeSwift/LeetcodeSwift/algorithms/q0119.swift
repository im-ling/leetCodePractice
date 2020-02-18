//
//  q0119.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 18/02/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//119. Pascal's Triangle II
//Easy
//
//636
//
//188
//
//Add to List
//
//Share
//Given a non-negative index k where k ≤ 33, return the kth index row of the Pascal's triangle.
//
//Note that the row index starts from 0.
//
//
//In Pascal's triangle, each number is the sum of the two numbers directly above it.
//
//Example:
//
//Input: 3
//Output: [1,3,3,1]
//Follow up:
//
//Could you optimize your algorithm to use only O(k) extra space?
//
//Accepted
//250,430
//Submissions
//534,052
class q0119Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        if rowIndex < 0 {
            return [Int]()
        }
        var array1 = [Int]()
        var array2 = [Int]()
        array1.append(1)
        array2.append(1)

        if rowIndex == 0 {
            return array2
        }

        for _ in 1...rowIndex {
            array1.append(0)
            array2.append(0)
        }
        for i in 1...rowIndex {
            let temp = array1
            array1 = array2
            array2 = temp
            for j in 1...i {
                array2[j] = array1[j] + array1[j - 1]
            }
        }
        return array2
    }
}


func q0119() -> () {
    let result = q0119Solution().getRow(0)
    print(result)
}
