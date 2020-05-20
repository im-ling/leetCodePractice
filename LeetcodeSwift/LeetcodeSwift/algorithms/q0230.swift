//
//  q0230.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 20/05/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//230. Kth Smallest Element in a BST
//Medium
//
//2130
//
//57
//
//Add to List
//
//Share
//Given a binary search tree, write a function kthSmallest to find the kth smallest element in it.
//
//Note:
//You may assume k is always valid, 1 ≤ k ≤ BST's total elements.
//
//Example 1:
//
//Input: root = [3,1,4,null,2], k = 1
//   3
//  / \
// 1   4
//  \
//   2
//Output: 1
//Example 2:
//
//Input: root = [5,3,6,2,4,null,null,1], k = 3
//       5
//      / \
//     3   6
//    / \
//   2   4
//  /
// 1
//Output: 3
//Follow up:
//What if the BST is modified (insert/delete operations) often and you need to find the kth smallest frequently? How would you optimize the kthSmallest routine?
//
//Accepted
//342,984
//Submissions
//594,988

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
class q0230Solution {
    func visit(_ root: TreeNode?, _ k: Int, current: inout Int, result: inout Int){
        guard let root = root else { return }
        guard current <= k else { return }
        visit(root.left, k, current: &current, result: &result)
        current += 1
        if current == k {
            result = root.val
            return
        }
        visit(root.right, k, current: &current, result: &result)
    }
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var count = 0
        var result = 0
        visit(root, k, current: &count, result: &result)
        return result
    }
}
