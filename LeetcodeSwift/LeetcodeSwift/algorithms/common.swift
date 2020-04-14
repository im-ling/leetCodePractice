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

public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
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

func printTreeNodeStack(stack:[TreeNode]){
    print("[", separator: "", terminator: "")
    for item in stack {
        print("\(item.val),", separator: "", terminator: "")
    }
    print("]", separator: "", terminator: "")
    print("")
}

func printTreeNode(root: TreeNode?){
    guard let root = root else {
        return
    }
    printTreeNode(root: root.left)
    print("\(root.val),", separator: "", terminator: " ")
    printTreeNode(root: root.right)
}


extension String {
    subscript(_ i: Int) -> String {
        let idx1 = index(startIndex, offsetBy: i)
        let idx2 = index(idx1, offsetBy: 1)
        return String(self[idx1..<idx2])
    }

    subscript (r: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: r.lowerBound)
        let end = index(startIndex, offsetBy: r.upperBound)
        return String(self[start ..< end])
    }

    subscript (r: CountableClosedRange<Int>) -> String {
        let startIndex =  self.index(self.startIndex, offsetBy: r.lowerBound)
        let endIndex = self.index(startIndex, offsetBy: r.upperBound - r.lowerBound)
        return String(self[startIndex...endIndex])
    }
}
