//
//  q0155.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 10/04/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//155. Min Stack
//Easy
//
//2813
//
//283
//
//Add to List
//
//Share
//Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.
//
//push(x) -- Push element x onto stack.
//pop() -- Removes the element on top of the stack.
//top() -- Get the top element.
//getMin() -- Retrieve the minimum element in the stack.
//
//
//Example:
//
//MinStack minStack = new MinStack();
//minStack.push(-2);
//minStack.push(0);
//minStack.push(-3);
//minStack.getMin();   --> Returns -3.
//minStack.pop();
//minStack.top();      --> Returns 0.
//minStack.getMin();   --> Returns -2.
//
//
//Accepted
//438,368
//Submissions
//1,051,923
class q0155MinStack {
    var min = Int.max
    var minReset = true

    var stack = [Int]()
    var minStack = [Int]()
//    var stackSort = [Int]()
    /** initialize your data structure here. */
    init() {
    }
    
    func push(_ x: Int) {
        if min > x {
            min = x
        }
        stack.append(x)
        minStack.append(min)
    }
    
    func pop() {
        _ = stack.popLast()
        _ = minStack.popLast()
        min = minStack.last ?? Int.max
    }
    
    func top() -> Int {
        if stack.count > 0 {
            return stack.last!
        }else{
            return -1
        }
    }
    
    func getMin() -> Int {
        if stack.count > 0 {
            return minStack.last!
        }else{
            return -1
        }
    }
}


class q0155MinStack2 {
    var min = Int.max
    var minReset = true

    var stack = [Int]()
//    var stackSort = [Int]()
    /** initialize your data structure here. */
    init() {
    }
    
    func push(_ x: Int) {
        stack.append(x)
        if min > x {
            min = x
            minReset = false
        }
    }
    
    func pop() {
        if stack.last == min {
            minReset = true
        }
        _ = stack.popLast()
    }
    
    func top() -> Int {
        if stack.count > 0 {
            return stack.last!
        }else{
            return -1
        }
    }
    
    func getMin() -> Int {
        if stack.count > 0 {
            if minReset {
                min = stack.sorted()[0]
                minReset = false
            }
            return min
        }else{
            return -1
        }
    }
}

func q0155() -> () {
    let minStack = q0155MinStack()
    minStack.push(-2)
    minStack.push(0)
    minStack.push(-3)
    print(minStack.getMin())   //--> Returns -3
    minStack.pop();
    print(minStack.top())
    print(minStack.getMin())
}
