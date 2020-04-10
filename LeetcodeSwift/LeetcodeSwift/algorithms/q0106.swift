//
//  q0106.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 10/04/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//106. Construct Binary Tree from Inorder and Postorder Traversal
//Medium
//
//1351
//
//29
//
//Add to List
//
//Share
//Given inorder and postorder traversal of a tree, construct the binary tree.
//
//Note:
//You may assume that duplicates do not exist in the tree.
//
//For example, given
//
//inorder = [9,3,15,20,7]
//postorder = [9,15,7,20,3]
//Return the following binary tree:
//
//    3
//   / \
//  9  20
//    /  \
//   15   7
//Accepted
//198,850
//Submissions
//455,363
class q0106Solution {
    var postorder = [Int]()
    var inorder = [Int]()
    func buildTree_helper(postIndex: Int, inorderStart: Int, inorderEnd: Int) -> TreeNode? {
        if inorderStart > inorderEnd || postIndex < 0 {
            return nil
        }

        let value = postorder[postIndex]
        let node = TreeNode(value)
        
        var index = inorderEnd
        while index > 0 {
            if inorder[index] == value {
                break
            }
            index -= 1
        }
        node.right = buildTree_helper(postIndex: postIndex - 1, inorderStart: index + 1, inorderEnd: inorderEnd)
            
        node.left = buildTree_helper(postIndex: postIndex - 1 - inorderEnd + index, inorderStart: inorderStart, inorderEnd: index - 1)
        return node
    }

    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        self.postorder = postorder
        self.inorder = inorder
        return buildTree_helper(postIndex: postorder.count - 1, inorderStart: 0, inorderEnd: inorder.count - 1)
    }
    
}

func q0106(){
    let postorder = [1,2,3]
    let inorder =  [2,3,1]
    let solution = q0106Solution()
    _ = solution.buildTree(inorder, postorder)
}
