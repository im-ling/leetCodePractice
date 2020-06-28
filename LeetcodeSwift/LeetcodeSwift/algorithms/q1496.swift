//
//  q01496.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 29/06/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//1496. Path Crossing
//Easy
//
//28
//
//1
//
//Add to List
//
//Share
//Given a string path, where path[i] = 'N', 'S', 'E' or 'W', each representing moving one unit north, south, east, or west, respectively. You start at the origin (0, 0) on a 2D plane and walk on the path specified by path.
//
//Return True if the path crosses itself at any point, that is, if at any time you are on a location you've previously visited. Return False otherwise.
//
//
//
//Example 1:
//
//
//
//Input: path = "NES"
//Output: false
//Explanation: Notice that the path doesn't cross any point more than once.
//Example 2:
//
//
//
//Input: path = "NESWW"
//Output: true
//Explanation: Notice that the path visits the origin twice.
//
//
//Constraints:
//
//1 <= path.length <= 10^4
//path will only consist of characters in {'N', 'S', 'E', 'W}
//Accepted
//6,589
//Submissions
//12,103

class q1496Solution {
    func isPathCrossing(_ path: String) -> Bool {
        var dic = [Int:Bool]()
        let factor = 10000
        var point = 0
        dic[point] = true
        for char in path {
            switch char {
            case "N":
                point += factor
            case "S":
                point -= factor
            case "E":
                point += 1
            case "W":
                point -= 1
            default:
                print("error")
            }
            if dic[point] != nil {
                return true
            }
            dic[point] = true
        }
        return false
    }
}
