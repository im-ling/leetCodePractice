//
//  q0986.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 23/05/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//986. Interval List Intersections
//Medium
//
//956
//
//35
//
//Add to List
//
//Share
//Given two lists of closed intervals, each list of intervals is pairwise disjoint and in sorted order.
//
//Return the intersection of these two interval lists.
//
//(Formally, a closed interval [a, b] (with a <= b) denotes the set of real numbers x with a <= x <= b.  The intersection of two closed intervals is a set of real numbers that is either empty, or can be represented as a closed interval.  For example, the intersection of [1, 3] and [2, 4] is [2, 3].)
//
//
//
//Example 1:
//
//
//
//Input: A = [[0,2],[5,10],[13,23],[24,25]], B = [[1,5],[8,12],[15,24],[25,26]]
//Output: [[1,2],[5,5],[8,10],[15,23],[24,24],[25,25]]
//Reminder: The inputs and the desired output are lists of Interval objects, and not arrays or lists.
//
//
//Note:
//
//0 <= A.length < 1000
//0 <= B.length < 1000
//0 <= A[i].start, A[i].end, B[i].start, B[i].end < 10^9
//NOTE: input types have been changed on April 15, 2019. Please reset to default code definition to get new method signature.
//
//Accepted
//73,707
//Submissions
//110,872

class q0986Solution {
    func getCommonInterVal(_ A:[Int], _ B: [Int]) -> [Int]?{
        if A[0] > B[1] || B[0] > A[1] {
            return nil
        }
        let left = max(A[0], B[0])
        let right = min(A[1], B[1])
        return [left, right]
    }
    func intervalIntersection(_ A: [[Int]], _ B: [[Int]]) -> [[Int]] {
        var result = [[Int]]()
        var indexA = 0
        var indexB = 0
        while indexA < A.count && indexB < B.count {
            let intervalInA = A[indexA]
            let intervalInB = B[indexB]
            if let interval = getCommonInterVal(intervalInA, intervalInB){
                result.append(interval)
            }
            if intervalInA[1] > intervalInB[1] {
                indexB += 1
            }else if intervalInA[1] < intervalInB[1]{
                indexA += 1
            }else{
                indexA += 1
                indexB += 1
            }
        }
        return result
    }
}

func q0986(){
    let A = [[0,2],[5,10],[13,23],[24,25]]
    let B = [[1,5],[8,12],[15,24],[25,26]]
    let solu = q0986Solution()
    let result = solu.intervalIntersection(A, B)
    print(result)
}
