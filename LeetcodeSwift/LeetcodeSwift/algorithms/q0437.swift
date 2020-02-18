//
//  q0437.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 18/02/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//437. Path Sum III
//Easy
//
//2693
//
//197
//
//Add to List
//
//Share
//You are given a binary tree in which each node contains an integer value.
//
//Find the number of paths that sum to a given value.
//
//The path does not need to start or end at the root or a leaf, but it must go downwards (traveling only from parent nodes to child nodes).
//
//The tree has no more than 1,000 nodes and the values are in the range -1,000,000 to 1,000,000.
//
//Example:
//
//root = [10,5,-3,3,2,null,11,3,-2,null,1], sum = 8
//
//      10
//     /  \
//    5   -3
//   / \    \
//  3   2   11
// / \   \
//3  -2   1
//
//Return 3. The paths that sum to 8 are:
//
//1.  5 -> 3
//2.  5 -> 2 -> 1
//3. -3 -> 11
class q0437Solution {
    func pathSum_helper(node: TreeNode?, sum:Int) -> Int{
        guard let node = node else { return 0 }
        return (node.val == sum ? 1 : 0) + pathSum_helper(node: node.left, sum: sum - node.val) + pathSum_helper(node: node.right, sum: sum - node.val)
    }
    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
        guard let root = root else { return 0 }
        return pathSum_helper(node: root, sum: sum) + pathSum(root.left, sum) + pathSum(root.right, sum)
    }
}

