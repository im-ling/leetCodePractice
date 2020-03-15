//
//  q0102.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 16/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//102. Binary Tree Level Order Traversal
//Medium
//
//2365
//
//62
//
//Add to List
//
//Share
//Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).
//
//For example:
//Given binary tree [3,9,20,null,null,15,7],
//    3
//   / \
//  9  20
//    /  \
//   15   7
//return its level order traversal as:
//[
//  [3],
//  [9,20],
//  [15,7]
//]
//Accepted
//529,288
//Submissions
//1,009,786
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class q0102Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
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
        return result
    }
}
