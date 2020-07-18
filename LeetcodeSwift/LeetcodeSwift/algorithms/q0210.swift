//
//  q0210.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 19/07/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
class q0210Solution {
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

    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        guard self.canFinish(numCourses, prerequisites) else {
            return [Int]()
        }
        let order = DFSOrder.init(vertexs: numCourses, sidesDic: self.dic2)
        return order.reversePost
    }
}
func q0210() -> () {
    let solu = q0210Solution()
    let numCourses = 2
    let prerequisites = [[1,0]]
    let result = solu.findOrder(numCourses, prerequisites)
    print(result)
}
