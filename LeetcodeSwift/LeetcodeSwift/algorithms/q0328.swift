//
//  q0328.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 16/05/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//328. Odd Even Linked List
//Medium
//
//1467
//
//278
//
//Add to List
//
//Share
//Given a singly linked list, group all odd nodes together followed by the even nodes. Please note here we are talking about the node number and not the value in the nodes.
//
//You should try to do it in place. The program should run in O(1) space complexity and O(nodes) time complexity.
//
//Example 1:
//
//Input: 1->2->3->4->5->NULL
//Output: 1->3->5->2->4->NULL
//Example 2:
//
//Input: 2->1->3->5->6->4->7->NULL
//Output: 2->3->6->7->1->5->4->NULL
//Note:
//
//The relative order inside both the even and odd groups should remain as it was in the input.
//The first node is considered odd, the second node even and so on ...
//Accepted
//222,746
//Submissions
//418,258
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class q0328Solution {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        let preheadOdd = ListNode(0);
        let preHeadEven = ListNode(0);
        var pointer = head;
        var pointerPreOdd:ListNode? = preheadOdd;
        var pointerPreEven:ListNode? = preHeadEven;
        var oddFlag = false;
        while pointer != nil {
            oddFlag = !oddFlag;
            if oddFlag {
                pointerPreOdd!.next = pointer;
                pointerPreOdd = pointerPreOdd!.next;
            }else{
                pointerPreEven!.next = pointer;
                pointerPreEven = pointerPreEven!.next;
            }
            pointer = pointer?.next;
        }
        pointerPreEven?.next = nil;
        pointerPreOdd?.next = preHeadEven.next;
        return preheadOdd.next;
    }
}
