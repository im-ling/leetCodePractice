//
//  DFSOrder.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 19/07/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
class DFSOrder {
    var pre = [Int]()
    var post = [Int]()
    var reversePost = [Int]()
    private var marks = [Bool]()
    private var sidesDic = [Int:[Int]]()
    
    private func dfsVist(_ vertex:Int){
        if marks[vertex] {
            return
        }
        marks[vertex] = true
        pre.append(vertex)
        guard let nodes = sidesDic[vertex] else { return post.append(vertex) }
        for node in nodes {
            dfsVist(node)
        }
        post.append(vertex)
    }
    
    init(vertexs:Int, sidesDic:[Int:[Int]]) {
        marks = [Bool].init(repeating: false, count: vertexs)
        self.sidesDic = sidesDic
        for vertex in 0..<vertexs {
            dfsVist(vertex)
        }
        reversePost = post.reversed()
    }
}
