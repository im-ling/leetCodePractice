//
//  q0114.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 16/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//114. Flatten Binary Tree to Linked List
//Medium
//
//2244
//
//277
//
//Add to List
//
//Share
//Given a binary tree, flatten it to a linked list in-place.
//
//For example, given the following tree:
//
//    1
//   / \
//  2   5
// / \   \
//3   4   6
//The flattened tree should look like:
//
//1
// \
//  2
//   \
//    3
//     \
//      4
//       \
//        5
//         \
//          6
//Accepted
//305,889
//Submissions
//655,425
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
class q0114Solution {
    var lastNode:TreeNode?
    func flatten_helper(_ root: TreeNode?) {
        if root == nil{
            return
        }
        flatten_helper(root?.right)
        flatten_helper(root?.left)
        root?.right = lastNode
        root?.left = nil
        lastNode = root
    }
    func flatten(_ root: TreeNode?) {
        lastNode = nil
        flatten_helper(root)
    }
}
