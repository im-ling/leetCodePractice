//
//  q0056.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 02/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//56. Merge Intervals
//Medium
//
//3293
//
//252
//
//Add to List
//
//Share
//Given a collection of intervals, merge all overlapping intervals.
//
//Example 1:
//
//Input: [[1,3],[2,6],[8,10],[15,18]]
//Output: [[1,6],[8,10],[15,18]]
//Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
//Example 2:
//
//Input: [[1,4],[4,5]]
//Output: [[1,5]]
//Explanation: Intervals [1,4] and [4,5] are considered overlapping.
//NOTE: input types have been changed on April 15, 2019. Please reset to default code definition to get new method signature.
//
//Accepted
//504,908
//Submissions
//1,329,270
class q0056Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        var result = [[Int]]()
        guard intervals.count > 0 else {
            return result
        }
        let intervals2 = intervals.sorted { (a, b) -> Bool in
            a[0] < b[0]
        }
        result.append(intervals2[0])
        for item in intervals2 {
            if item[0] > result.last![1] {
                result.append(item)
            }else if item[1] > result.last![1]{
                result[result.count - 1][1] = item[1]
            }
        }
        return result
    }
}
func q0056() -> () {
    let solution = q0056Solution()
    let intervals = [[1,3],[2,6],[8,10],[15,18]]
    let result = solution.merge(intervals)
    print(result)
}
