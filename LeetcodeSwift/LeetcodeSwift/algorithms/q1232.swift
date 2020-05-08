//
//  q1232.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 08/05/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//1232. Check If It Is a Straight Line
//Easy
//
//208
//
//28
//
//Add to List
//
//Share
//You are given an array coordinates, coordinates[i] = [x, y], where [x, y] represents the coordinate of a point. Check if these points make a straight line in the XY plane.
//
//
//
//
//
//Example 1:
//
//
//
//Input: coordinates = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7]]
//Output: true
//Example 2:
//
//
//
//Input: coordinates = [[1,1],[2,2],[3,4],[4,5],[5,6],[7,7]]
//Output: false
//
//
//Constraints:
//
//2 <= coordinates.length <= 1000
//coordinates[i].length == 2
//-10^4 <= coordinates[i][0], coordinates[i][1] <= 10^4
//coordinates contains no duplicate point.
//Accepted
//31,820
//Submissions
//65,802
class q1232Solution {
    func checkStraightLine(_ coordinates: [[Int]]) -> Bool {
        let originX = coordinates[0][0]
        let originY = coordinates[0][1]
        let ratio =  Float(coordinates[coordinates.count - 1][1] - originY) / Float(coordinates[coordinates.count - 1][0] - originX)
        for i in 1..<coordinates.count-1 {
            if Float(coordinates[i][1] - originY) / Float(coordinates[i][0] - originX) != ratio{
                return false
            }
        }
        return true
    }
}

func q1232() -> () {
    let solution = q1232Solution()
    let coordinates = [[1,1],[2,2],[3,4],[4,5],[5,6],[7,7]]
    let result = solution.checkStraightLine(coordinates)
    print(result)
}
