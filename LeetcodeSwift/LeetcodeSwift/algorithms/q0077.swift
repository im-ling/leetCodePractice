//
//  q0077.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 10/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//77. Combinations
//Medium
//
//1187
//
//60
//
//Add to List
//
//Share
//Given two integers n and k, return all possible combinations of k numbers out of 1 ... n.
//
//Example:
//
//Input: n = 4, k = 2
//Output:
//[
//  [2,4],
//  [3,4],
//  [2,3],
//  [1,2],
//  [1,3],
//  [1,4],
//]
//Accepted
//259,628
//Submissions
//497,164
class q0077Solution {
    func combine_helper(n: Int, path: inout [Int], k: Int, start:Int, result: inout [[Int]] ) {
        if path.count == k {
            result.append(path)
            return
        }
        if start > n {
            return
        }
        for i in start...n {
            path.append(i)
            combine_helper(n: n, path: &path, k: k, start: i + 1, result: &result)
            path.removeLast()
        }
    }

    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var result = [[Int]].init()
        var path = [Int]()
        combine_helper(n: n, path: &path, k: k, start: 1, result: &result)
        return result
    }
//    func combine_helper(candidates: inout [Int], path: inout [Int], k: Int, result: inout [[Int]] ) {
//        if path.count == k {
//            result.append(path)
//            return
//        }
//        for i in 0..<candidates.count {
//            if path.last != nil && candidates[i] < path.last! {
//                continue
//            }
//            path.append(candidates[i])
//            candidates.remove(at: i)
//            combine_helper(candidates: &candidates, path: &path, k: k, result: &result)
//            candidates.insert(path.last!, at: i)
//            path.removeLast()
//        }
//    }
//    func combine(_ n: Int, _ k: Int) -> [[Int]] {
//        var result = [[Int]].init()
//        var path = [Int]()
//        var candidates = [Int]()
//        for i in 1...n {
//            candidates.append(i)
//        }
//        combine_helper(candidates: &candidates, path: &path, k: k, result: &result)
//        return result
//    }
}
func q0077(){
    let solu = q0077Solution()
    let result = solu.combine(4, 2)
    print(result)
}
