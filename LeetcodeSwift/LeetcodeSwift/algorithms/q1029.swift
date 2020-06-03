//
//  q1029.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 03/06/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//1029. Two City Scheduling
//Easy
//
//867
//
//112
//
//Add to List
//
//Share
//There are 2N people a company is planning to interview. The cost of flying the i-th person to city A is costs[i][0], and the cost of flying the i-th person to city B is costs[i][1].
//
//Return the minimum cost to fly every person to a city such that exactly N people arrive in each city.
//
//
//
//Example 1:
//
//Input: [[10,20],[30,200],[400,50],[30,20]]
//Output: 110
//Explanation:
//The first person goes to city A for a cost of 10.
//The second person goes to city A for a cost of 30.
//The third person goes to city B for a cost of 50.
//The fourth person goes to city B for a cost of 20.
//
//The total minimum cost is 10 + 30 + 50 + 20 = 110 to have half the people interviewing in each city.
//
//
//Note:
//
//1 <= costs.length <= 100
//It is guaranteed that costs.length is even.
//1 <= costs[i][0], costs[i][1] <= 1000
//Accepted
//39,960
//Submissions
//71,596

class q1029Solution {
    func twoCitySchedCost(_ costs: [[Int]]) -> Int {
        var result = 0
        let sortedCost = costs.sorted { (a, b) -> Bool in
            return a[0] - a[1] < b[0] - b[1]
        }
        let N = costs.count / 2
        for i in 0..<N {
            result += sortedCost[i][0] + sortedCost[i + N][1]
        }
        return result
    }
    func twoCitySchedCost2(_ costs: [[Int]]) -> Int {
        var result = 0
        var countADic = [Int: Int]()
        var countBDic = [Int: Int]()
        for i in 0..<costs.count {
            let pair = costs[i]
            if pair[0] > pair[1] {
                result += pair[1]
                countADic[i] = pair[0] - pair[1]
            }else{
                result += pair[0]
                countBDic[i] = pair[1] - pair[0]
            }
        }
        if countADic.keys.count > countBDic.keys.count {
            let times = (countADic.keys.count - countBDic.keys.count) / 2
            var sorted = countADic.sorted { $0.1 <= $1.1 }
            for _ in 0..<times {
                result += sorted.first!.value
                sorted.removeFirst()
            }
        }else if countADic.keys.count < countBDic.keys.count{
            let times = (countBDic.keys.count - countADic.keys.count) / 2
            var sorted = countBDic.sorted { $0.1 <= $1.1 }
            for _ in 0..<times {
                result += sorted.first!.value
                sorted.removeFirst()
            }
        }
        return result
    }
}


func q1029(){
    let costs =
        [[518,518],[71,971],[121,862],[967,607],[138,754],[513,337],[499,873],[337,387],[647,917],[76,417]]
    let solu = q1029Solution()
    let result = solu.twoCitySchedCost(costs)
    print(result)
}
