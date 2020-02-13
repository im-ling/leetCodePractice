//
//  q0107.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 13/02/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation

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
//107. Binary Tree Level Order Traversal II
//Easy
//
//1018
//
//186
//
//Add to List
//
//Share
//Given a binary tree, return the bottom-up level order traversal of its nodes' values. (ie, from left to right, level by level from leaf to root).
//
//For example:
//Given binary tree [3,9,20,null,null,15,7],
//    3
//   / \
//  9  20
//    /  \
//   15   7
//return its bottom-up level order traversal as:
//[
//  [15,7],
//  [9,20],
//  [3]
//]
//Accepted
//275,708
//Submissions
//553,441
class q0107Solution {
    func levelOrderBottom_helper(node: TreeNode?, level: Int, result: inout [[Int]]){
        if node != nil {
            if level >= result.count {
                result.append([Int]())
            }
            result[level].append(node!.val)
            levelOrderBottom_helper(node: node?.left, level: level + 1, result: &result)
            levelOrderBottom_helper(node: node?.right, level: level + 1, result: &result)
        }
    }
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        levelOrderBottom_helper(node: root, level: 0, result: &result)
        return result.reversed()
    }
}


func q0107() -> () {
    let node3 = TreeNode.init(3)
    let node9 = TreeNode.init(9)
    let node20 = TreeNode.init(20)
    let node15 = TreeNode.init(15)
    let node7 = TreeNode.init(7)
    node3.left = node9
    node3.right = node20
    node20.left = node15
    node20.right = node7
    
    let solution = q0107Solution()
    let result = solution.levelOrderBottom(node3)
    print(result)
}
