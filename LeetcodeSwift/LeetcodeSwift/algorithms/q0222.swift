//
//  q0222.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 23/06/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//222. Count Complete Tree Nodes
//Medium
//
//1896
//
//193
//
//Add to List
//
//Share
//Given a complete binary tree, count the number of nodes.
//
//Note:
//
//Definition of a complete binary tree from Wikipedia:
//In a complete binary tree every level, except possibly the last, is completely filled, and all nodes in the last level are as far left as possible. It can have between 1 and 2h nodes inclusive at the last level h.
//
//Example:
//
//Input:
//    1
//   / \
//  2   3
// / \  /
//4  5 6
//
//Output: 6
//Accepted
//207,466
//Submissions
//476,867
class q0222Solution {
    func foundNode(_ node:TreeNode?, index:Int, size:Int, len:Int) -> Bool {
        if node == nil || index > size || len < 0 {
            return false
        }else if len == 0 {
            return true
        }else{
            let midIndex = size >> 1
            if index >= midIndex {
                return foundNode(node!.right, index: index - midIndex, size: size >> 1, len: len - 1)
            }else{
                return foundNode(node!.left, index: index, size: size >> 1, len: len - 1)
            }
        }
    }
    
    func countNodes(_ root: TreeNode?) -> Int {
        var len = -1
        var node = root
        while node != nil {
            node = node?.left
            len += 1
        }
        if len <= 0 {
            return len + 1
        }
        let size = 2 << (len - 1)
        var right = size - 1
        var left = 0
        var maxVal = 0
        while left <= right {
            let mid = (left + right) >> 1
            if foundNode(root, index: mid, size: size, len: len) {
                maxVal = mid
                left = mid + 1
            }else{
                right = mid - 1
            }
        }
        return size + maxVal
    }
}
