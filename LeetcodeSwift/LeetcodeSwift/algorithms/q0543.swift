//
//  q0543.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 11/04/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//543. Diameter of Binary Tree
//Easy
//
//2372
//
//150
//
//Add to List
//
//Share
//Given a binary tree, you need to compute the length of the diameter of the tree. The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.
//
//Example:
//Given a binary tree
//          1
//         / \
//        2   3
//       / \
//      4   5
//Return 3, which is the length of the path [4,2,1,3] or [5,2,1,3].
//
//Note: The length of path between two nodes is represented by the number of edges between them.
//
//Accepted
//229,635
//Submissions
//474,370
class q0543Solution {
    var max = 0
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        _ = maxLength(root)
        return max
    }
    
    func maxLength(_ root: TreeNode?) -> Int{
        guard root != nil else {
            return 0
        }
        let maxLeft = maxLength(root?.left)
        let maxRight = maxLength(root?.right)
        if maxLeft + maxRight > max {
            max = maxLeft + maxRight
        }
        return (maxLeft > maxRight ? maxLeft : maxRight) + 1
    }
}
