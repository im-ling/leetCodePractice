//
//  q0993.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 07/05/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//993. Cousins in Binary Tree
//Easy
//
//550
//
//33
//
//Add to List
//
//Share
//In a binary tree, the root node is at depth 0, and children of each depth k node are at depth k+1.
//
//Two nodes of a binary tree are cousins if they have the same depth, but have different parents.
//
//We are given the root of a binary tree with unique values, and the values x and y of two different nodes in the tree.
//
//Return true if and only if the nodes corresponding to the values x and y are cousins.
//
//
//
//Example 1:
//
//
//Input: root = [1,2,3,4], x = 4, y = 3
//Output: false
//Example 2:
//
//
//Input: root = [1,2,3,null,4,null,5], x = 5, y = 4
//Output: true
//Example 3:
//
//
//
//Input: root = [1,2,3,null,4], x = 2, y = 3
//Output: false
//
//
//Note:
//
//The number of nodes in the tree will be between 2 and 100.
//Each node has a unique integer value from 1 to 100.
//
//Accepted
//51,522
//Submissions
//97,611

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class q0993Solution {
    var xParent:TreeNode? = nil
    var xLevel = 0
    var yParent:TreeNode? = nil
    var yLevel = 0

    func visitNode(_ root: TreeNode?, x:Int, y: Int, lastNode: TreeNode, level: Int) {
        guard let root = root else { return }
        if xLevel > 0 && yLevel > 0 {
            return
        }
        if root.val == x {
            xParent = lastNode
            xLevel = level
        }
        if root.val == y {
            yParent = lastNode
            yLevel = level
        }

        visitNode(root.left, x: x, y: y, lastNode: root, level: level + 1)
        visitNode(root.right, x: x, y: y, lastNode: root, level: level + 1)
    }

    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        guard let root = root else { return false }
        if root.val == x || root.val == y {
            return false
        }else{
            visitNode(root.left, x: x, y: y, lastNode: root, level: 1)
            visitNode(root.right, x: x, y: y, lastNode: root, level: 1)
        }
        return xLevel == yLevel && xParent !== yParent && xLevel > 0
    }
}

