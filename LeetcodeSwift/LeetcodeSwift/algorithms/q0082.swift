//
//  q0082.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 11/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//82. Remove Duplicates from Sorted List II
//Medium
//
//1298
//
//98
//
//Add to List
//
//Share
//Given a sorted linked list, delete all nodes that have duplicate numbers, leaving only distinct numbers from the original list.
//
//Return the linked list sorted as well.
//
//Example 1:
//
//Input: 1->2->3->3->4->4->5
//Output: 1->2->5
//Example 2:
//
//Input: 1->1->1->2->3
//Output: 2->3
//Accepted
//225,831
//Submissions
//638,108

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
class q0082Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard head != nil else {
            return head
        }
        let pre_head = ListNode.init(0)
        pre_head.next = head
        var p = pre_head
        while p.next != nil && p.next!.next != nil{
            if p.next!.val == p.next!.next!.val {
                while p.next?.val == p.next?.next?.val {
                    p.next = p.next?.next
                }
                p.next = p.next!.next
            }else{
                p = p.next!
            }
        }
        return pre_head.next
    }
}

func q0082(){
    let solution = q0082Solution()
    let numbers = [1,2,3,3,4,4,5]
    let head = listToListNode(list: numbers)
    let result = solution.deleteDuplicates(head)
    printListNode(head: result)
}
