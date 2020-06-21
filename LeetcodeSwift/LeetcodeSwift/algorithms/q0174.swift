//
//  q0174.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 21/06/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//174. Dungeon Game
//Hard
//
//1320
//
//36
//
//Add to List
//
//Share
//The demons had captured the princess (P) and imprisoned her in the bottom-right corner of a dungeon. The dungeon consists of M x N rooms laid out in a 2D grid. Our valiant knight (K) was initially positioned in the top-left room and must fight his way through the dungeon to rescue the princess.
//
//The knight has an initial health point represented by a positive integer. If at any point his health point drops to 0 or below, he dies immediately.
//
//Some of the rooms are guarded by demons, so the knight loses health (negative integers) upon entering these rooms; other rooms are either empty (0's) or contain magic orbs that increase the knight's health (positive integers).
//
//In order to reach the princess as quickly as possible, the knight decides to move only rightward or downward in each step.
//
//
//
//Write a function to determine the knight's minimum initial health so that he is able to rescue the princess.
//
//For example, given the dungeon below, the initial health of the knight must be at least 7 if he follows the optimal path RIGHT-> RIGHT -> DOWN -> DOWN.
//
//-2 (K)    -3    3
//-5    -10    1
//10    30    -5 (P)
//
//
//Note:
//
//The knight's health has no upper bound.
//Any room can contain threats or power-ups, even the first room the knight enters and the bottom-right room where the princess is imprisoned.
//Accepted
//88,696
//Submissions
//294,894
class q0174Solution {
    func calculateMinimumHP(_ dungeon: [[Int]]) -> Int {
        let maxWidth = dungeon[0].count
        let maxHeight = dungeon.count
        var dp = [[Int]].init(repeating: [Int].init(repeating: Int.max, count: maxWidth + 1), count: maxHeight + 1)
        dp[maxHeight][maxWidth - 1] = 1
        dp[maxHeight - 1][maxWidth] = 1
        for i in (0..<maxHeight).reversed() {
            for j in (0..<maxWidth).reversed() {
                let requireHp = min(dp[i + 1][j], dp[i][j + 1]) - dungeon[i][j]
                dp[i][j] = max(requireHp, 1)
            }
        }
        return dp[0][0]
    }
}


func q0174(){
    let solu = q0174Solution()
    let matrix = [[-2,-3,3],[-5,-10,1],[10,30,-5]]
    let result = solu.calculateMinimumHP(matrix)
    print(result)
}
