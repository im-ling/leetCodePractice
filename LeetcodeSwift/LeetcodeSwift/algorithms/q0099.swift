//
//  q0099.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 14/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//99. Recover Binary Search Tree
//Hard
//
//1226
//
//66
//
//Add to List
//
//Share
//Two elements of a binary search tree (BST) are swapped by mistake.
//
//Recover the tree without changing its structure.
//
//Example 1:
//
//Input: [1,3,null,null,2]
//
//   1
//  /
// 3
//  \
//   2
//
//Output: [3,1,null,null,2]
//
//   3
//  /
// 1
//  \
//   2
//Example 2:
//
//Input: [3,1,4,null,null,2]
//
//  3
// / \
//1   4
//   /
//  2
//
//Output: [2,1,4,null,null,3]
//
//  2
// / \
//1   4
//   /
//  3
//Follow up:
//
//A solution using O(n) space is pretty straight forward.
//Could you devise a constant space solution?
//Accepted
//147,103
//Submissions
//390,850
class q0099Solution {
    var left = TreeNode.init(Int.min)
    var foundLeft = false
    var right = TreeNode.init(Int.max)
    var foundRight = false
    func findLeft(root: TreeNode?){
        if foundLeft {
            return
        }
        if root != nil {
            findLeft(root: root?.left)
            if left.val > root!.val {
                foundLeft = true
            }
            left = root!
            findLeft(root: root?.right)
        }
    }
    func findRight(root: TreeNode?){
        if foundRight {
            return
        }
        if root != nil {
            findRight(root: root?.right)
            if right.val < root!.val {
                foundRight = true
            }
            right = root!
            findRight(root: root?.left)
        }
    }


    func recoverTree(_ root: TreeNode?) {
        findLeft(root: root)
        findRight(root: root)
        left.val = left.val + right.val
        right.val = left.val - right.val
        left.val = left.val - right.val
    }
    
    
    
    func recoverTree2(_ root: TreeNode?) {
         var treeNodeArray = [TreeNode]()
         treeNodeToNodeArray(root: root, nodeArray: &treeNodeArray)
         var left = -1
         for i in 0..<treeNodeArray.count - 1 {
             if treeNodeArray[i].val > treeNodeArray[i].val  {
                 left = i
                 break
             }
         }
         var right = -1
         for j in (1..<treeNodeArray.count).reversed(){
             if treeNodeArray[j].val < treeNodeArray[j - 1].val {
                 right = j
                 break
             }
         }
         treeNodeArray[left].val += treeNodeArray[right].val
         treeNodeArray[right].val = treeNodeArray[left].val - treeNodeArray[right].val
         treeNodeArray[left].val = treeNodeArray[left].val - treeNodeArray[right].val
     }
     func treeNodeToNodeArray(root: TreeNode?, nodeArray: inout [TreeNode]){
         if root != nil {
             treeNodeToNodeArray(root: root?.left, nodeArray: &nodeArray)
             nodeArray.append(root!)
             treeNodeToNodeArray(root: root?.right, nodeArray: &nodeArray)
         }
     }
}
