//
//  q0098.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 13/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//98. Validate Binary Search Tree
//Medium
//
//3175
//
//450
//
//Add to List
//
//Share
//Given a binary tree, determine if it is a valid binary search tree (BST).
//
//Assume a BST is defined as follows:
//
//The left subtree of a node contains only nodes with keys less than the node's key.
//The right subtree of a node contains only nodes with keys greater than the node's key.
//Both the left and right subtrees must also be binary search trees.
//
//
//Example 1:
//
//    2
//   / \
//  1   3
//
//Input: [2,1,3]
//Output: true
//Example 2:
//
//    5
//   / \
//  1   4
//     / \
//    3   6
//
//Input: [5,1,4,null,null,3,6]
//Output: false
//Explanation: The root node's value is 5 but its right child's value is 4.
//Accepted
//593,396
//Submissions
//2,185,562

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
class q0098Solution {
    func isValidBST_helper(_ root: TreeNode?, max: Int, min:Int) -> Bool{
        guard (root != nil) else {
            return true
        }
        if (root!.left != nil && (root!.left!.val >= root!.val || root!.left!.val <= max)) || (root!.right != nil && (root!.right!.val <= root!.val || root!.right!.val >= min)){
            print("root.val(\(root!.val)) max(\(max))")
            return false
        }
        return isValidBST_helper(root?.left, max: max, min: min < root!.val ? min : root!.val) && isValidBST_helper(root?.right, max: root!.val >= max ? root!.val : max, min: min)
    }
    
    func isValidBST_helper2(_ root: TreeNode?, max: Int, min:Int) -> Bool{
        guard (root != nil) else {
            return true
        }
        if (root!.val >= max || root!.val <= min){
            return false
        }
        return isValidBST_helper2(root?.left, max: root!.val, min: min) && isValidBST_helper2(root?.right, max: max, min: root!.val)
    }

    func isValidBST(_ root: TreeNode?) -> Bool {
        return isValidBST_helper2(root, max: Int.max, min: Int.min)
    }
}
