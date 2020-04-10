//
//  q0105.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 10/04/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//105. Construct Binary Tree from Preorder and Inorder Traversal
//Medium
//
//2778
//
//79
//
//Add to List
//
//Share
//Given preorder and inorder traversal of a tree, construct the binary tree.
//
//Note:
//You may assume that duplicates do not exist in the tree.
//
//For example, given
//
//preorder = [3,9,20,15,7]
//inorder = [9,3,15,20,7]
//Return the following binary tree:
//
//    3
//   / \
//  9  20
//    /  \
//   15   7
//Accepted
//318,614
//Submissions
//686,168
class q0105Solution {
    var preorder = [Int]()
    var inorder = [Int]()
    func buildTree_helper(preIndex: Int, inorderStart: Int, inorderEnd: Int) -> TreeNode? {
        if inorderStart > inorderEnd || preIndex >= preorder.count {
            return nil
        }

        let value = preorder[preIndex]
        let node = TreeNode(value)
        
        var index = inorderStart
        while index <= inorderEnd{
            if inorder[index] == value {
                break
            }
            index += 1
        }
        node.left = buildTree_helper(preIndex: preIndex + 1, inorderStart: inorderStart, inorderEnd: index - 1)
        node.right = buildTree_helper(preIndex: preIndex + 1 + index - inorderStart, inorderStart: index + 1, inorderEnd: inorderEnd)
        return node
    }

    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        self.preorder = preorder
        self.inorder = inorder
        return buildTree_helper(preIndex: 0, inorderStart: 0, inorderEnd: inorder.count - 1)
    }
    
}

func q0105(){
    let preorder = [1,2,3]
    let inorder =  [2,3,1]
    let solution = q0105Solution()
    _ = solution.buildTree(preorder, inorder)
}
