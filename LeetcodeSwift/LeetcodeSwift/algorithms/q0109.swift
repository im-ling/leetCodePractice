//
//  q0109.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 11/04/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//109. Convert Sorted List to Binary Search Tree
//Medium
//
//1662
//
//84
//
//Add to List
//
//Share
//Given a singly linked list where elements are sorted in ascending order, convert it to a height balanced BST.
//
//For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.
//
//Example:
//
//Given the sorted linked list: [-10,-3,0,5,9],
//
//One possible answer is: [0,-3,9,-10,null,5], which represents the following height balanced BST:
//
//      0
//     / \
//   -3   9
//   /   /
// -10  5
//Accepted
//225,349
//Submissions
//494,057
class q0109Solution {
    var nums = [Int]()
    func sortedListToBST_helper(start: Int, end: Int) -> TreeNode? {
        if start > end {
            return nil
        }
        let mid = (end - start) / 2 + start
        let node = TreeNode.init(nums[mid])
        node.left = sortedListToBST_helper(start: start, end: mid - 1)
        node.right = sortedListToBST_helper(start: mid + 1, end: end)
        return node
    }
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        var pNode = head
        while pNode != nil {
            nums.append(pNode!.val)
            pNode = pNode?.next
        }
        return sortedListToBST_helper(start: 0, end: nums.count - 1)
    }

    func sortedListToBST_helper2(_ head: ListNode?, terminateNode: ListNode?) -> TreeNode? {
        if head == nil || head === terminateNode {
            return nil
        }
        var fast = head
        var slow = head
        while fast != nil && fast?.next != nil{
            if fast === terminateNode || fast?.next === terminateNode {
                break
            }
            fast = fast?.next?.next
            slow = slow?.next
        }
        let node = TreeNode(slow!.val)
        node.left = sortedListToBST_helper2(head, terminateNode: slow)
        node.right = sortedListToBST_helper2(slow?.next, terminateNode: terminateNode)
        return node
    }

    func sortedListToBST2(_ head: ListNode?) -> TreeNode? {
        return sortedListToBST_helper2(head, terminateNode: nil)
    }
}

func q0109() {
    let nums = [-10,-3,0,5,9]
    let node = listToListNode(list: nums)
    let solution = q0109Solution()
    let result = solution.sortedListToBST(node)
    printTreeNode(root: result)
}

