//
//  q1008.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 20/04/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//1008. Construct Binary Search Tree from Preorder Traversal
//Medium
//
//658
//
//21
//
//Add to List
//
//Share
//Return the root node of a binary search tree that matches the given preorder traversal.
//
//(Recall that a binary search tree is a binary tree where for every node, any descendant of node.left has a value < node.val, and any descendant of node.right has a value > node.val.  Also recall that a preorder traversal displays the value of the node first, then traverses node.left, then traverses node.right.)
//
//
//
//Example 1:
//
//Input: [8,5,1,7,10,12]
//Output: [8,5,10,1,7,null,12]
//
//
//
//Note:
//
//1 <= preorder.length <= 100
//The values of preorder are distinct.
//Accepted
//46,299
//Submissions
//60,977


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
class q1008Solution {
    var preorder = [Int]()
    func bstFromPreorder_helper(left: Int, right: Int) -> TreeNode? {
        if left > right {
            return nil
        }
        let result = TreeNode.init(preorder[left])
        var i = left + 1
        while i <= right && preorder[i] < preorder[left] {
            i += 1
        }
        result.left = bstFromPreorder_helper(left: left + 1, right: i - 1)
        result.right = bstFromPreorder_helper(left: i, right: right)
        return result
    }
    func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
        guard preorder.count > 0 else {
            return nil
        }
        self.preorder = preorder
        return bstFromPreorder_helper(left: 0, right: preorder.count - 1)
    }
}

func q1008() {
    let solution = q1008Solution()
    let preorder = [8,5,1,7,10,12]
    _ = solution.bstFromPreorder(preorder)
}
