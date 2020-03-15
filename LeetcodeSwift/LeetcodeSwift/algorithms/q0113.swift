//
//  q0113.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 16/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//113. Path Sum II
//Medium
//
//1385
//
//47
//
//Add to List
//
//Share
//Given a binary tree and a sum, find all root-to-leaf paths where each path's sum equals the given sum.
//
//Note: A leaf is a node with no children.
//
//Example:
//
//Given the below binary tree and sum = 22,
//
//      5
//     / \
//    4   8
//   /   / \
//  11  13  4
// /  \    / \
//7    2  5   1
//Return:
//
//[
//   [5,4,11,2],
//   [5,8,4,5]
//]
//Accepted
//297,266
//Submissions
//667,783
class q0113Solution {
    func pathSum_helper(_ root: TreeNode?, _ sum: Int, path: inout [Int], result:inout [[Int]]){
        if root != nil {
            path.append(root!.val)
            if root!.left == nil && root!.right == nil {
                if sum == root!.val {
                    result.append(path)
                }
            }else{
                pathSum_helper(root?.left, sum - root!.val, path: &path, result: &result)
                pathSum_helper(root?.right, sum - root!.val, path: &path, result: &result)
            }
            path.removeLast()
        }
    }
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        var result = [[Int]]()
        var path = [Int]()
        pathSum_helper(root, sum, path: &path, result: &result)
        return result
    }
}
