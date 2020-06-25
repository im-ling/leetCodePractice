//
//  q0129.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 25/06/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//129. Sum Root to Leaf Numbers
//Medium
//
//1246
//
//40
//
//Add to List
//
//Share
//Given a binary tree containing digits from 0-9 only, each root-to-leaf path could represent a number.
//
//An example is the root-to-leaf path 1->2->3 which represents the number 123.
//
//Find the total sum of all root-to-leaf numbers.
//
//Note: A leaf is a node with no children.
//
//Example:
//
//Input: [1,2,3]
//    1
//   / \
//  2   3
//Output: 25
//Explanation:
//The root-to-leaf path 1->2 represents the number 12.
//The root-to-leaf path 1->3 represents the number 13.
//Therefore, sum = 12 + 13 = 25.
//Example 2:
//
//Input: [4,9,0,5,1]
//    4
//   / \
//  9   0
// / \
//5   1
//Output: 1026
//Explanation:
//The root-to-leaf path 4->9->5 represents the number 495.
//The root-to-leaf path 4->9->1 represents the number 491.
//The root-to-leaf path 4->0 represents the number 40.
//Therefore, sum = 495 + 491 + 40 = 1026.
//Accepted
//245,361
//Submissions
//522,723


class q0129Solution {
    func sumNumbers_helper(_ node: TreeNode?, preNumber:Int, sum: inout Int){
        guard let node = node else {
            return
        }
        var nums = [Int]()
        var temp = node.val
        nums.append(temp % 10)
        temp /= 10
        while temp > 0 {
            nums.append(temp % 10)
            temp /= 10
        }
        var newPreNumber = preNumber
        while nums.count > 0 {
            newPreNumber = newPreNumber * 10 + nums.last!
            nums.removeLast()
        }
        if node.left == nil && node.right == nil {
            sum += newPreNumber
        }else{
            sumNumbers_helper(node.left, preNumber: newPreNumber, sum: &sum)
            sumNumbers_helper(node.right, preNumber: newPreNumber, sum: &sum)
        }
    }
    func sumNumbers(_ root: TreeNode?) -> Int {
        var result = 0
        sumNumbers_helper(root, preNumber: 0, sum: &result)
        return result
    }
}
