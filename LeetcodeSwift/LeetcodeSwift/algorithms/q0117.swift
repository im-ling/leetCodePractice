//
//  q0117.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 12/04/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//117. Populating Next Right Pointers in Each Node II
//Medium
//
//1337
//
//169
//
//Add to List
//
//Share
//Given a binary tree
//
//struct Node {
//  int val;
//  Node *left;
//  Node *right;
//  Node *next;
//}
//Populate each next pointer to point to its next right node. If there is no next right node, the next pointer should be set to NULL.
//
//Initially, all next pointers are set to NULL.
//
// 
//
//Follow up:
//
//You may only use constant extra space.
//Recursive approach is fine, you may assume implicit stack space does not count as extra space for this problem.
// 
//
//Example 1:
//
//
//
//Input: root = [1,2,3,4,5,null,7]
//Output: [1,#,2,3,#,4,5,7,#]
//Explanation: Given the above binary tree (Figure A), your function should populate each next pointer to point to its next right node, just like in Figure B. The serialized output is in level order as connected by the next pointers, with '#' signifying the end of each level.
// 
//
//Constraints:
//
//The number of nodes in the given tree is less than 6000.
//-100 <= node.val <= 100
//Accepted
//232,401
//Submissions
//619,262
class q0117Solution {
    func connect(_ root: Node?) -> Node? {
        guard let root = root else { return nil }
        var node = root.left
        if root.right != nil {
            root.left?.next = root.right
            node = root.right
        }
        
        if node != nil {
            var node2 = root.next
            while node2 != nil {
                if node2?.left != nil {
                    node?.next = node2?.left
                    break
                }
                if node2?.right != nil {
                    node?.next = node2?.right
                    break
                }
                node2 = node2?.next
            }
        }
        _ = connect(root.right)
        _ = connect(root.left)
        return root
    }
}
