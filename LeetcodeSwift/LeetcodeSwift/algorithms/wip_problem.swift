//
//  wip_problem.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 10/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation

//swift 3.0.2
class Solution
{
    /**
    * @param {number} src
    * @param {number} dest
    * @param {number[][]} wizards
    * @return {minCost, [] = minPath}
    */
    static func distance_path_helper(src: Int, dest: Int, wizards:inout [[Int]], min: inout Int, path:inout [Int], cost: inout Int, flags: inout [Bool], resultPath:inout [Int]){
//        print("\(src) \(dest) \(cost)")
        if dest == src && min > cost{
            min = cost
            resultPath = path
            resultPath.append(dest)
            return
        }
        if flags[src] {
            flags[src] = false
            for i in wizards[src] {
                path.append(src)
                let stepCost = (i - src) * (i - src)
                cost += stepCost
                distance_path_helper(src: i, dest: dest, wizards: &wizards, min: &min, path: &path, cost: &cost, flags: &flags, resultPath: &resultPath)
                cost -= stepCost
                path.removeLast()
            }
            flags[src] = true
        }
        return
    }

   static func distance_path(src: Int, dest: Int, wizards: [[Int]]) -> (Int, [Int]) {
       var minCost: Int;
       var minPath: [Int];
       minCost = 0;
       minPath = [];
       // Put your code here to calculate minCost and minPath
       var wizards2 = wizards
       var min = Int.max
       var flags = [Bool].init(repeating: true, count: wizards.count)
       var path = [Int]()
       var cost = 0
       distance_path_helper(src: src, dest: dest, wizards: &wizards2, min: &min, path: &path, cost: &cost, flags: &flags, resultPath: &minPath)
       if min < Int.max {
           minCost = min
       }
       // Return the result, do not change the structure
      return (minCost, minPath);
   }
}

//let numberOfWizards: Int = 10;
//let src = 0
//let dest = 9
//let wizards = [[1,2,3], [8,6,4], [7,8,3], [8,1], [6], [8,7], [9,4], [4,6], [1], [1, 4]]
//
//
//var minCost: Int;
//var minPath: [Int];
//(minCost, minPath) = Solution.distance_path(src: src, dest: dest, wizards: wizards);
//print(minCost)
//print(minPath)
