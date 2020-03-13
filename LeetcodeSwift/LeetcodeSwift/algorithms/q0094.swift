//
//  q0094.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 13/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//94. Binary Tree Inorder Traversal
//Medium
//
//2536
//
//106
//
//Add to List
//
//Share
//Given a binary tree, return the inorder traversal of its nodes' values.
//
//Example:
//
//Input: [1,null,2,3]
//   1
//    \
//     2
//    /
//   3
//
//Output: [1,3,2]
//Follow up: Recursive solution is trivial, could you do it iteratively?
//
//Accepted
//639,046
//Submissions
//1,047,539
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
class q0094Solution {
    func inorderTraversal_helper(_ root: TreeNode?, result: inout [Int]){
        if root != nil {
            if root?.left != nil {
                inorderTraversal_helper(root?.left, result: &result)
            }
            result.append(root!.val)
            if root?.right != nil {
                inorderTraversal_helper(root?.right, result: &result)
            }
        }
    }
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        inorderTraversal_helper(root, result: &result)
        return result
    }
    
    func inorderTraversal2(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        if root == nil {
            return result
        }
        var stack = [TreeNode]()
        
        var p = root!
        stack.append(p)
        var flag = true
        while stack.count > 0 {
            p = stack.last!
            if (flag && p.left != nil) {
                stack.append(p.left!)
            }else{
                flag = false
                stack.removeLast()
                result.append(p.val)
                if p.right != nil {
                    flag = true
                    stack.append(p.right!)
                }
            }
        }
        return result
    }

    
    func inorderTraversal3(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        if root == nil {
            return result
        }
        var stack = [TreeNode?]()
        var p = root
        while p != nil || stack.count > 0 {
            while p != nil {
                stack.append(p)
                p = p?.left
            }
            p = stack.last!
            stack.removeLast()
            result.append(p!.val)
            p = p?.right
        }
        return result
    }

}
