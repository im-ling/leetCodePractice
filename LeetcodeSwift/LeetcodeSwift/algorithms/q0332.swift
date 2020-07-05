//
//  q0332.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 28/06/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//332. Reconstruct Itinerary
//Medium
//
//1617
//
//939
//
//Add to List
//
//Share
//Given a list of airline tickets represented by pairs of departure and arrival airports [from, to], reconstruct the itinerary in order. All of the tickets belong to a man who departs from JFK. Thus, the itinerary must begin with JFK.
//
//Note:
//
//If there are multiple valid itineraries, you should return the itinerary that has the smallest lexical order when read as a single string. For example, the itinerary ["JFK", "LGA"] has a smaller lexical order than ["JFK", "LGB"].
//All airports are represented by three capital letters (IATA code).
//You may assume all tickets form at least one valid itinerary.
//One must use all the tickets once and only once.
//Example 1:
//
//Input: [["MUC", "LHR"], ["JFK", "MUC"], ["SFO", "SJC"], ["LHR", "SFO"]]
//Output: ["JFK", "MUC", "LHR", "SFO", "SJC"]
//Example 2:
//
//Input: [["JFK","SFO"],["JFK","ATL"],["SFO","ATL"],["ATL","JFK"],["ATL","SFO"]]
//Output: ["JFK","ATL","JFK","SFO","ATL","SFO"]
//Explanation: Another possible reconstruction is ["JFK","SFO","ATL","JFK","ATL","SFO"].
//             But it is larger in lexical order.
//Accepted
//141,157
//Submissions
//400,715
class q0332Solution {
    func findItinerary(_ tickets: [[String]]) -> [String] {

        var result = [String]()
        var dic = [String:[String]]()
        var backDic = [String:[String]]()
        for ticket in tickets {
            if dic[ticket[0]] == nil {
                dic[ticket[0]] = [String]()
            }
            dic[ticket[0]]!.append(ticket[1])
            if backDic[ticket[1]] == nil {
                backDic[ticket[1]] = [String]()
            }
            backDic[ticket[1]]!.append(ticket[0])
        }
        for key in dic.keys {
            dic[key]! = dic[key]!.sorted()
        }
        for key in backDic.keys {
            backDic[key]! = backDic[key]!.sorted()
        }
        
        var isThereEndPoint = false
        var endPoint = ""
        for ticket in tickets {
            let end = ticket[1]
            if dic[end] == nil {
                isThereEndPoint = true
                endPoint = end
            }
        }
        
        if isThereEndPoint {
            result.append(endPoint)
            while backDic.keys.count > 0 {
                if let origin = backDic[endPoint]?.last {
                    result.insert(origin, at: 0)
                    backDic[endPoint]?.removeLast()
                    if backDic[endPoint]?.count == 0 {
                        backDic.removeValue(forKey: endPoint)
                    }
                    endPoint = origin
                }
            }
        }else{
            var start = "JFK"
            result.append(start)
            while dic.keys.count > 0 {
                if let des = dic[start]?.first {
                    result.append(des)
                    dic[start]?.removeFirst()
                    if dic[start]?.count == 0 {
                        dic.removeValue(forKey: start)
                    }
                    start = des
                }
            }
        }
        return result
    }
}

func q0332(){
    let solu = q0332Solution()
    let tickets = [["EZE","TIA"],["EZE","HBA"],["AXA","TIA"],["JFK","AXA"],["ANU","JFK"],["ADL","ANU"],["TIA","AUA"],["ANU","AUA"],["ADL","EZE"],["ADL","EZE"],["EZE","ADL"],["AXA","EZE"],["AUA","AXA"],["JFK","AXA"],["AXA","AUA"],["AUA","ADL"],["ANU","EZE"],["TIA","ADL"],["EZE","ANU"],["AUA","ANU"]]
    let result = solu.findItinerary(tickets)
    print(result)
}
