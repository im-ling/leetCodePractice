//
//  q0103.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 16/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//103. Binary Tree Zigzag Level Order Traversal
//Medium
//
//1601
//
//85
//
//Add to List
//
//Share
//Given a binary tree, return the zigzag level order traversal of its nodes' values. (ie, from left to right, then right to left for the next level and alternate between).
//
//For example:
//Given binary tree [3,9,20,null,null,15,7],
//    3
//   / \
//  9  20
//    /  \
//   15   7
//return its zigzag level order traversal as:
//[
//  [3],
//  [20,9],
//  [15,7]
//]
//Accepted
//310,208
//Submissions
//683,000
class q0103Solution {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        if root == nil {
            return result
        }
        var nodes1 = [TreeNode]()
        nodes1.append(root!)
        while nodes1.count > 0 {
            var level = [Int]()
            var nodes2 = [TreeNode]()
            for node in nodes1 {
                level.append(node.val)
                if node.left != nil {
                    nodes2.append(node.left!)
                }
                if node.right != nil {
                    nodes2.append(node.right!)
                }
            }
            result.append(level)
            nodes1 = nodes2
        }
        for i in 0..<result.count {
            if i % 2 == 1 {
                result[i] = result[i].reversed()
            }
        }
        return result
    }
}
