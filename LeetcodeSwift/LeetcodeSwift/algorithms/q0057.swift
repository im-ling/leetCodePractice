//
//  q0057.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 03/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//57. Insert Interval
//Hard
//
//1284
//
//146
//
//Add to List
//
//Share
//Given a set of non-overlapping intervals, insert a new interval into the intervals (merge if necessary).
//
//You may assume that the intervals were initially sorted according to their start times.
//
//Example 1:
//
//Input: intervals = [[1,3],[6,9]], newInterval = [2,5]
//Output: [[1,5],[6,9]]
//Example 2:
//
//Input: intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]
//Output: [[1,2],[3,10],[12,16]]
//Explanation: Because the new interval [4,8] overlaps with [3,5],[6,7],[8,10].
//NOTE: input types have been changed on April 15, 2019. Please reset to default code definition to get new method signature.
//
//Accepted
//221,357
//Submissions
//679,535
class q0057Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var result = intervals
        if intervals.count < 1 {
            result.append(newInterval)
            return result
        }
        if newInterval[1] < intervals[0][0] {
            result.insert(newInterval, at: 0)
        }else if newInterval[0] > intervals.last![1]{
            result.append(newInterval)
        }else{
            for i in 0..<result.count {
                if result[i][0] > newInterval[0] || result[i][1] >= newInterval[0]{
                    var temp = newInterval[0]
                    if result[i][1] >= newInterval[0] && result[i][0] < newInterval[0]{
                        temp = result[i][0]
                    }
                    let end = newInterval[1]
                    while i < result.count {
                        if result[i][1] >= end || result[i][0] > end{
                            break
                        }
                        result.remove(at: i)
                    }
                    if i == result.count {
                        result.append([temp, end])
                    }else{
                        if result[i][0] > end{
                            result.insert([temp, end], at: i)
                        }else{
                            result[i][0] = temp
                        }
                    }
                    return result
                }
            }
        }
        return result
    }
}
func q0057() -> () {
    let solution = q0057Solution()
    let intervals = [[1,3],[6,9]]
    let newInterval = [2,5]
    let result = solution.insert(intervals, newInterval)
    print(result)
}
