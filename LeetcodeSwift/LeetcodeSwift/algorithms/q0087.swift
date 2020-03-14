//
//  q0087.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 15/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//87. Scramble String
//Hard
//
//405
//
//629
//
//Add to List
//
//Share
//Given a string s1, we may represent it as a binary tree by partitioning it to two non-empty substrings recursively.
//
//Below is one possible representation of s1 = "great":
//
//    great
//   /    \
//  gr    eat
// / \    /  \
//g   r  e   at
//           / \
//          a   t
//To scramble the string, we may choose any non-leaf node and swap its two children.
//
//For example, if we choose the node "gr" and swap its two children, it produces a scrambled string "rgeat".
//
//    rgeat
//   /    \
//  rg    eat
// / \    /  \
//r   g  e   at
//           / \
//          a   t
//We say that "rgeat" is a scrambled string of "great".
//
//Similarly, if we continue to swap the children of nodes "eat" and "at", it produces a scrambled string "rgtae".
//
//    rgtae
//   /    \
//  rg    tae
// / \    /  \
//r   g  ta  e
//       / \
//      t   a
//We say that "rgtae" is a scrambled string of "great".
//
//Given two strings s1 and s2 of the same length, determine if s2 is a scrambled string of s1.
//
//Example 1:
//
//Input: s1 = "great", s2 = "rgeat"
//Output: true
//Example 2:
//
//Input: s1 = "abcde", s2 = "caebd"
//Output: false
//Accepted
//102,648
//Submissions
//312,136
class q0087Solution {
    func isScramble(_ s1: String, _ s2: String) -> Bool {
        let len = s1.count
        let charsS1 = [Character].init(s1)
        let charsS2 = [Character].init(s2)
        if charsS1.sorted() != charsS2.sorted() {
            return false
        }
        if len < 3 {
            return true
        }
        
        var array1 = [Character]()
        var array2 = [Character]()
        var array3 = [Character]()
        for i in 0..<len - 1{
            array1.append(charsS1[i])
            array2.append(charsS2[i])
            array3.append(charsS2[len - 1 - i])
            if array1.sorted() == array2.sorted() && isScramble(String(s1.suffix(s1.count-array1.count)), String(s2.suffix(s2.count - array1.count))) && isScramble(String(s1.prefix(array1.count)), String(s2.prefix(array1.count))) {
                return true
            }
            if array1.sorted() == array3.sorted() && isScramble(String(s1.suffix(s1.count-array1.count)), String(s2.prefix(s2.count - array1.count))) && isScramble(String(s1.prefix(array1.count)), String(s2.suffix(array1.count))) {
                return true
            }
        }
        return false
    }
}
func q0087(){
    let solution = q0087Solution()
    let s1 = "abcdd"
    let s2 = "dbdac"
    let result = solution.isScramble(s1, s2)
    print(result)
}
