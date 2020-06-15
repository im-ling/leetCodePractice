//
//  q0787.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 15/06/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//787. Cheapest Flights Within K Stops
//Medium
//
//1574
//
//55
//
//Add to List
//
//Share
//There are n cities connected by m flights. Each flight starts from city u and arrives at v with a price w.
//
//Now given all the cities and flights, together with starting city src and the destination dst, your task is to find the cheapest price from src to dst with up to k stops. If there is no such route, output -1.
//
//Example 1:
//Input:
//n = 3, edges = [[0,1,100],[1,2,100],[0,2,500]]
//src = 0, dst = 2, k = 1
//Output: 200
//Explanation:
//The graph looks like this:
//
//
//The cheapest price from city 0 to city 2 with at most 1 stop costs 200, as marked red in the picture.
//Example 2:
//Input:
//n = 3, edges = [[0,1,100],[1,2,100],[0,2,500]]
//src = 0, dst = 2, k = 0
//Output: 500
//Explanation:
//The graph looks like this:
//
//
//The cheapest price from city 0 to city 2 with at most 0 stop costs 500, as marked blue in the picture.
//
//
//Constraints:
//
//The number of nodes n will be in range [1, 100], with nodes labeled from 0 to n - 1.
//The size of flights will be in range [0, n * (n - 1) / 2].
//The format of each flight will be (src, dst, price).
//The price of each flight will be in the range [1, 10000].
//k is in the range of [0, n - 1].
//There will not be any duplicated flights or self cycles.
//Accepted
//82,825
//Submissions
//219,024


// need improve
class q0787Solution {
    var flightDic = [Int:[[Int]]]()
    var costs = [[[Int]]]()
    var minVal = Int.max
    func findCheapestPrice_helper(visit:Int, currentCost:Int, dst:Int, k:Int, K:Int){
//        print(costs)
//        print("\(visit) \(currentCost) \(dst) \(k) \(K)")
        if k >= K {
            return
        }
        
        if let array = flightDic[visit] {
            for flight in array {
                if flight[1] == dst && currentCost + flight[2] < minVal {
                    minVal = currentCost + flight[2]
                    continue
                }
                // found cost less
                var flagFoundCostLess = false
                for i in (0..<costs[flight[1]].count).reversed() {
                    if k + 1 <= costs[flight[1]][i][0] &&  currentCost + flight[2] < costs[flight[1]][i][1] {
                        costs[flight[1]].remove(at: i)
                    }else if costs[flight[1]][i][0] <= k + 1 && costs[flight[1]][i][1] <= currentCost + flight[2] {
                        flagFoundCostLess = true
                        break;
                    }
                }
                
                if !flagFoundCostLess {
                    costs[flight[1]].append([k + 1, currentCost + flight[2]])
                    findCheapestPrice_helper(visit:flight[1], currentCost: currentCost + flight[2], dst: dst, k: k + 1, K:K)
                }
            }
        }
    }
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ K: Int) -> Int {
        minVal = Int.max
        flightDic.removeAll()
        for flight in flights {
            if flightDic[flight[0]] == nil {
                flightDic[flight[0]] = [[Int]]()
            }
            flightDic[flight[0]]!.append(flight)
        }
        costs.removeAll()
        for i in 0..<n {
            costs.append([[Int]]())
            costs[i].append([n, Int.max])
        }
        costs[src].removeAll()
        costs[src].append([0,0])
        findCheapestPrice_helper(visit: src, currentCost: 0, dst: dst, k: -1, K: K)
        if minVal == Int.max {
            return -1
        }
        return minVal
    }
}

func q0787(){
    let n = 3
    let edges = [[0,1,100],[1,2,100],[0,2,500]]
    let solu = q0787Solution()
    let src = 0
    let dst = 2
    let k = 0
    let result = solu.findCheapestPrice(n, edges, src, dst, k)
    print(result)
}
