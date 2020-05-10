//
//  q0997.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 10/05/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//997. Find the Town Judge
//Easy
//
//600
//
//66
//
//Add to List
//
//Share
//In a town, there are N people labelled from 1 to N.  There is a rumor that one of these people is secretly the town judge.
//
//If the town judge exists, then:
//
//The town judge trusts nobody.
//Everybody (except for the town judge) trusts the town judge.
//There is exactly one person that satisfies properties 1 and 2.
//You are given trust, an array of pairs trust[i] = [a, b] representing that the person labelled a trusts the person labelled b.
//
//If the town judge exists and can be identified, return the label of the town judge.  Otherwise, return -1.
//
//
//
//Example 1:
//
//Input: N = 2, trust = [[1,2]]
//Output: 2
//Example 2:
//
//Input: N = 3, trust = [[1,3],[2,3]]
//Output: 3
//Example 3:
//
//Input: N = 3, trust = [[1,3],[2,3],[3,1]]
//Output: -1
//Example 4:
//
//Input: N = 3, trust = [[1,2],[2,3]]
//Output: -1
//Example 5:
//
//Input: N = 4, trust = [[1,3],[1,4],[2,3],[2,4],[4,3]]
//Output: 3
//
//
//Note:
//
//1 <= N <= 1000
//trust.length <= 10000
//trust[i] are all different
//trust[i][0] != trust[i][1]
//1 <= trust[i][0], trust[i][1] <= N
//Accepted
//75,275
//Submissions
//149,213


class q0997Solution {
    func findJudge(_ N: Int, _ trust: [[Int]]) -> Int {
        var trustCount = [Int].init(repeating: 1, count: N + 1)
        var isjudge = [Bool].init(repeating: true, count: N + 1)
        for pair in trust {
            if isjudge[pair[0]] {
                isjudge[pair[0]] = false
            }
            trustCount[pair[1]] += 1
        }
        var candidate = [Int]()
        for i in 1...N {
            if isjudge[i] && trustCount[i] >= N {
                candidate.append(i)
            }
        }
        return candidate.count == 1 ? candidate.first! : -1
    }
}


func q0997(){
    let solution = q0997Solution()
    let n = 3
    let trust = [[1,3],[2,3]]
    let result = solution.findJudge(n, trust)
    print(result)

}
