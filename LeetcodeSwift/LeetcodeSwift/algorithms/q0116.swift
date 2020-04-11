//
//  q0116.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 11/04/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//116. Populating Next Right Pointers in Each Node
//Medium
//
//1630
//
//135
//
//Add to List
//
//Share
//You are given a perfect binary tree where all leaves are on the same level, and every parent has two children. The binary tree has the following definition:
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
//Input: root = [1,2,3,4,5,6,7]
//Output: [1,#,2,3,#,4,5,6,7,#]
//Explanation: Given the above perfect binary tree (Figure A), your function should populate each next pointer to point to its next right node, just like in Figure B. The serialized output is in level order as connected by the next pointers, with '#' signifying the end of each level.
//
//
//Constraints:
//
//The number of nodes in the given tree is less than 4096.
//-1000 <= node.val <= 1000
//Accepted
//325,501
//Submissions
//762,354

class q0116Solution {
    func connect(_ root: Node?) -> Node? {
        guard let root = root else { return nil }
        root.left?.next = root.right
        if root.next != nil {
            root.right?.next = root.next?.left
        }
        _ = connect(root.left)
        _ = connect(root.right)
        return root
    }
}
