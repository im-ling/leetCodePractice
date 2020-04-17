//
//  q0200.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 17/04/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//200. Number of Islands
//Medium
//
//4569
//
//168
//
//Add to List
//
//Share
//Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.
//
//Example 1:
//
//Input:
//11110
//11010
//11000
//00000
//
//Output: 1
//Example 2:
//
//Input:
//11000
//11000
//00100
//00011
//
//Output: 3
//Accepted
//600,672
//Submissions
//1,324,637
class q0200Solution {
    func visit(flagGrid: inout [[Bool]], row: Int, line: Int){
        if row < 0 || line < 0 || row >= flagGrid.count || line >= flagGrid[row].count || !flagGrid[row][line]{
            return
        }
        flagGrid[row][line] = false
        visit(flagGrid: &flagGrid, row: row - 1, line: line)
        visit(flagGrid: &flagGrid, row: row, line: line - 1)
        visit(flagGrid: &flagGrid, row: row + 1, line: line)
        visit(flagGrid: &flagGrid, row: row, line: line + 1)
    }
    
    func numIslands(_ grid: [[Character]]) -> Int {
        guard grid.count > 0 else {
            return 0
        }
        var result = 0
        var flagGrid = [[Bool]]()
        for i in grid {
            var flags = [Bool].init()
            for j in i {
                if j == "1" {
                    flags.append(true)
                }else{
                    flags.append(false)
                }
            }
            flagGrid.append(flags)
        }
        for i in 0..<flagGrid.count {
            for j in 0..<flagGrid[0].count {
                if flagGrid[i][j] {
                    result += 1
                    visit(flagGrid: &flagGrid, row: i, line: j)
                }
            }
        }
        return result
    }
}


func q0200() -> () {
    var grid = [[Character]].init()
    let sArray = ["11110", "11010", "11000", "00000"]
    for s in sArray {
        grid.append([Character].init(s))
    }
    let result = q0200Solution().numIslands(grid)
    print(result)
}


