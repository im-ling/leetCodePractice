//
//  q0207.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 19/07/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//207. Course Schedule
//Medium
//
//3901
//
//177
//
//Add to List
//
//Share
//There are a total of numCourses courses you have to take, labeled from 0 to numCourses-1.
//
//Some courses may have prerequisites, for example to take course 0 you have to first take course 1, which is expressed as a pair: [0,1]
//
//Given the total number of courses and a list of prerequisite pairs, is it possible for you to finish all courses?
//
//
//
//Example 1:
//
//Input: numCourses = 2, prerequisites = [[1,0]]
//Output: true
//Explanation: There are a total of 2 courses to take.
//             To take course 1 you should have finished course 0. So it is possible.
//Example 2:
//
//Input: numCourses = 2, prerequisites = [[1,0],[0,1]]
//Output: false
//Explanation: There are a total of 2 courses to take.
//             To take course 1 you should have finished course 0, and to take course 0 you should
//             also have finished course 1. So it is impossible.
//
//
//Constraints:
//
//The input prerequisites is a graph represented by a list of edges, not adjacency matrices. Read more about how a graph is represented.
//You may assume that there are no duplicate edges in the input prerequisites.
//1 <= numCourses <= 10^5
//Accepted
//423,474
//Submissions
//987,962
class q0207Solution {
    
    var dic = [Int:[Int]]()
    var dic2 = [Int:[Int]]()
    var marks = [Bool]()
    var stack = [Bool]()
    
    func dfsFoundCycle(vertex: Int, flag: inout Bool){
        if flag {
            return
        }
        marks[vertex] = true
        stack[vertex] = true
        guard let nodes = dic2[vertex] else {
            stack[vertex] = false
            return
        }
        for node in nodes{
            if !marks[node] {
                dfsFoundCycle(vertex: node, flag: &flag)
            }else if stack[node] {
                flag = true
                return
            }
        }
        stack[vertex] = false
    }
    
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        marks = [Bool].init(repeating: false, count: numCourses)
        stack = [Bool].init(repeating: false, count: numCourses)
        dic = [Int:[Int]]()
        dic2 = [Int:[Int]]()
        for pair in prerequisites {
            if dic[pair[0]] == nil {
                dic[pair[0]] = [Int]()
            }
            if dic2[pair[1]] == nil {
                dic2[pair[1]] = [Int]()
            }
            dic[pair[0]]!.append(pair[1])
            dic2[pair[1]]!.append(pair[0])
        }
        
        var roots = [Int]()
        for node in 0..<numCourses{
            if dic[node] == nil {
                roots.append(node)
            }
        }
        
        var flag = false
        for node in roots {
            dfsFoundCycle(vertex: node, flag: &flag)
            if flag {
                return false
            }
        }
        for vertex in 0..<numCourses{
            if !marks[vertex] {
                dfsFoundCycle(vertex: vertex, flag: &flag)
                if flag {
                    return false
                }
            }
        }
        return true
    }
}


func q0207() -> () {
    let solu = q0207Solution()
    let numCourses = 4
    let prerequisites = [[1,0],[2,0],[3,1],[3,2]]
    let result = solu.canFinish(numCourses, prerequisites)
    print(result)
}
