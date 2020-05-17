//
//  q0438.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 17/05/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//438. Find All Anagrams in a String
//Medium
//
//2620
//
//166
//
//Add to List
//
//Share
//Given a string s and a non-empty string p, find all the start indices of p's anagrams in s.
//
//Strings consists of lowercase English letters only and the length of both strings s and p will not be larger than 20,100.
//
//The order of output does not matter.
//
//Example 1:
//
//Input:
//s: "cbaebabacd" p: "abc"
//
//Output:
//[0, 6]
//
//Explanation:
//The substring with start index = 0 is "cba", which is an anagram of "abc".
//The substring with start index = 6 is "bac", which is an anagram of "abc".
//Example 2:
//
//Input:
//s: "abab" p: "ab"
//
//Output:
//[0, 1, 2]
//
//Explanation:
//The substring with start index = 0 is "ab", which is an anagram of "ab".
//The substring with start index = 1 is "ba", which is an anagram of "ab".
//The substring with start index = 2 is "ab", which is an anagram of "ab".
//Accepted
//217,677
//Submissions
//521,596

class q0438Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        var result = [Int]()
        var dic = [Character:Int]()
        for char in p {
            dic[char] = (dic[char] ?? 0) + 1
        }
        let pLen = p.count
        let charsOfS = Array.init(s)
        var index = 0
        var startIndex = index
        for char in s {
            if index >= pLen{
                let tempChar = charsOfS[startIndex]
                dic[tempChar] = (dic[tempChar] ?? 0) + 1
                if dic[tempChar] == 0 {
                    dic.removeValue(forKey: tempChar)
                }
                startIndex += 1
            }
            dic[char] = (dic[char] ?? 0) - 1
            if dic[char] == 0 {
                dic.removeValue(forKey: char)
                if dic.keys.count == 0 {
                    result.append(startIndex)
                }
            }
            index += 1
        }
        return result
    }
}


func q0438(){
    let solu = q0438Solution()
    let s = "cbaebabacd"
    let p = "abc"
    let result = solu.findAnagrams(s, p)
    print(result)
}
