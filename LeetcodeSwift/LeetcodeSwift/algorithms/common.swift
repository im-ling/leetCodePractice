//
//  common.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 13/02/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func printGrid(_ grid: [[Int]]){
    for i in 0..<grid.count {
        print("")
        for j in 0..<grid[i].count {
            print("\(grid[i][j]) ", separator: "", terminator: "")
        }
    }
    print("")
}

func listToListNode(list:[Int]) -> ListNode?{
    let result = ListNode.init(0)
    var p = result
    for item in list {
        p.next = ListNode.init(item)
        p = p.next!
    }
    return result.next
}
func printListNode(head:ListNode?){
    var p = head
    print("[", separator: "", terminator: "")
    while p != nil && p!.next != nil{
        print("\(p!.val),", separator: "", terminator: "")
        p = p?.next
    }
    if p != nil {
        print("\(p!.val)", separator: "", terminator: "")
    }
    print("]", separator: "", terminator: "")
    print("")
}
