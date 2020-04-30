//
//  day30.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 30/04/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//Check If a String Is a Valid Sequence from Root to Leaves Path in a Binary Tree
//Given a binary tree where each path going from the root to any leaf form a valid sequence, check if a given string is a valid sequence in such binary tree.
//
//We get the given string from the concatenation of an array of integers arr and the concatenation of all values of the nodes along a path results in a sequence in the given binary tree.
//
//
//
//Example 1:
//
//
//
//Input: root = [0,1,0,0,1,0,null,null,1,0,0], arr = [0,1,0,1]
//Output: true
//Explanation:
//The path 0 -> 1 -> 0 -> 1 is a valid sequence (green color in the figure).
//Other valid sequences are:
//0 -> 1 -> 1 -> 0
//0 -> 0 -> 0
//Example 2:
//
//
//
//Input: root = [0,1,0,0,1,0,null,null,1,0,0], arr = [0,0,1]
//Output: false
//Explanation: The path 0 -> 0 -> 1 does not exist, therefore it is not even a sequence.
//Example 3:
//
//
//
//Input: root = [0,1,0,0,1,0,null,null,1,0,0], arr = [0,1,1]
//Output: false
//Explanation: The path 0 -> 1 -> 1 is a sequence, but it is not a valid sequence.
//
//
//Constraints:
//
//1 <= arr.length <= 5000
//0 <= arr[i] <= 9
//Each node's value is between [0 - 9].
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
class Day30Solution {
    func isValidSequence_helper(_ root: TreeNode?, _ arr: [Int] , position: Int, result: inout Bool){
        if position >= arr.count || root == nil || root?.val != arr[position] || result {
            return
        }
        if position == arr.count - 1 && root?.left == nil && root?.right == nil{
            result = true
        }
        isValidSequence_helper(root?.left, arr, position: position + 1, result: &result)
        isValidSequence_helper(root?.right, arr, position: position + 1, result: &result)
    }

    func isValidSequence(_ root: TreeNode?, _ arr: [Int]) -> Bool {
        var result = false
        isValidSequence_helper(root, arr , position: 0, result: &result)
        return result
    }
}
