//
//  q0092.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 13/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//92. Reverse Linked List II
//Medium
//
//1863
//
//121
//
//Add to List
//
//Share
//Reverse a linked list from position m to n. Do it in one-pass.
//
//Note: 1 ≤ m ≤ n ≤ length of list.
//
//Example:
//
//Input: 1->2->3->4->5->NULL, m = 2, n = 4
//Output: 1->4->3->2->5->NULL
//Accepted
//244,686
//Submissions
//654,730
class q0092Solution {
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        let preHead = ListNode.init(0)
        preHead.next = head
        var p = preHead
        for _ in 1..<m {
            p = p.next!
        }
        let pm = p

        let list2 = ListNode.init(2)
        let staticPLast = p.next
        p = p.next!
        var flag = false
        for _ in m...n {
            let temp = p
            if p.next != nil {
                p = p.next!
            }else{
                flag = true
            }
            temp.next = list2.next
            list2.next = temp
        }
        if flag {
            staticPLast?.next = nil
        }else{            
            staticPLast?.next = p
        }
        pm.next = list2.next
        return preHead.next
    }
}
func q0092(){
    let solution = q0092Solution()
    let numbers = [1,2,3,4,5,6,7]
    let head = listToListNode(list: numbers)
    let m = 2
    let n = 7
    let result = solution.reverseBetween(head, m, n)
    printListNode(head: result)
}

