//
//  q0124.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 29/04/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation

//124. Binary Tree Maximum Path Sum
//Hard
//
//2961
//
//245
//
//Add to List
//
//Share
//Given a non-empty binary tree, find the maximum path sum.
//
//For this problem, a path is defined as any sequence of nodes from some starting node to any node in the tree along the parent-child connections. The path must contain at least one node and does not need to go through the root.
//
//Example 1:
//
//Input: [1,2,3]
//
//       1
//      / \
//     2   3
//
//Output: 6
//Example 2:
//
//Input: [-10,9,20,null,null,15,7]
//
//   -10
//   / \
//  9  20
//    /  \
//   15   7
//
//Output: 42
//Accepted
//305,905
//Submissions
//930,382

class q0124Solution {
    var _max = Int.min
    func maxPathSum_helper(_ root: TreeNode?) -> Int{
        guard let _root = root else {
            return 0
        }
        let leftValue = maxPathSum_helper(_root.left)
        let rightValue = maxPathSum_helper(_root.right)
        let value = _root.val + (leftValue > 0 ? leftValue : 0) + (rightValue > 0 ? rightValue : 0)
        if value > _max {
            _max = value
        }
        if leftValue < 0 && rightValue < 0 {
            return _root.val
        }
        return _root.val + max(leftValue, rightValue)
    }

    func maxPathSum(_ root: TreeNode?) -> Int {
        _ = maxPathSum_helper(root)
        return _max
    }
}
