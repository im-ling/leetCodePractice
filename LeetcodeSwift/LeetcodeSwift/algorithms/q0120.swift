//
//  q0120.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 20/04/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//120. Triangle
//Medium
//
//1696
//
//206
//
//Add to List
//
//Share
//Given a triangle, find the minimum path sum from top to bottom. Each step you may move to adjacent numbers on the row below.
//
//For example, given the following triangle
//
//[
//     [2],
//    [3,4],
//   [6,5,7],
//  [4,1,8,3]
//]
//The minimum path sum from top to bottom is 11 (i.e., 2 + 3 + 5 + 1 = 11).
//
//Note:
//
//Bonus point if you are able to do this using only O(n) extra space, where n is the total number of rows in the triangle.
//
//Accepted
//230,994
//Submissions
//539,340


class q0120Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        if triangle.count <= 0 {
            return 0
        }
        var oldCosts = [Int]()
        var costs = [Int].init(repeating: Int.max, count: triangle.count)
        costs[0] = 0

        for line in triangle {
            oldCosts = costs
            costs[0] += line[0]
            for i in 1..<line.count {
                costs[i] = min(oldCosts[i - 1], oldCosts[i]) + line[i]
            }
        }
        var result = Int.max
        for i in costs {
            if result > i {
                result = i
            }
        }
        return result
    }
}

func q0120() {
    let triangle = [
         [2],
        [3,4],
       [6,5,7],
      [4,1,8,3]
    ]
    let solution = q0120Solution()
    let result = solution.minimumTotal(triangle)
    print(result)

}
