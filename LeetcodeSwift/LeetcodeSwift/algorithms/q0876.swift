//
//  q0876.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 08/04/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//876. Middle of the Linked List
//Easy
//
//939
//
//52
//
//Add to List
//
//Share
//Given a non-empty, singly linked list with head node head, return a middle node of linked list.
//
//If there are two middle nodes, return the second middle node.
//
//
//
//Example 1:
//
//Input: [1,2,3,4,5]
//Output: Node 3 from this list (Serialization: [3,4,5])
//The returned node has value 3.  (The judge's serialization of this node is [3,4,5]).
//Note that we returned a ListNode object ans, such that:
//ans.val = 3, ans.next.val = 4, ans.next.next.val = 5, and ans.next.next.next = NULL.
//Example 2:
//
//Input: [1,2,3,4,5,6]
//Output: Node 4 from this list (Serialization: [4,5,6])
//Since the list has two middle nodes with values 3 and 4, we return the second one.
//
//
//Note:
//
//The number of nodes in the given list will be between 1 and 100.
//Accepted
//127,502
//Submissions
//189,911

class q0876Solution {
    func middleNode(_ head: ListNode?) -> ListNode? {
        var fast = head
        var slow = head
        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        return slow
    }
}


func q0876() -> () {
    let solution = q0876Solution()
    let numbers = [1, 2, 3, 4, 5]
    let node = listToListNode(list: numbers)
    guard let result = solution.middleNode(node) else { return }
    print(result.val)
}
