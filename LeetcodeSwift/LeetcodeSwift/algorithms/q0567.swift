//
//  q0567.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 18/05/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//567. Permutation in String
//Medium
//
//1180
//
//53
//
//Add to List
//
//Share
//Given two strings s1 and s2, write a function to return true if s2 contains the permutation of s1. In other words, one of the first string's permutations is the substring of the second string.
//
//
//
//Example 1:
//
//Input: s1 = "ab" s2 = "eidbaooo"
//Output: True
//Explanation: s2 contains one permutation of s1 ("ba").
//Example 2:
//
//Input:s1= "ab" s2 = "eidboaoo"
//Output: False
//
//
//Note:
//
//The input strings only contain lower case letters.
//The length of both given strings is in range [1, 10,000].
//Accepted
//89,359
//Submissions
//218,180


class q0567Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        var dic = [Character: Int]()
        for i in s1 {
            dic[i] = (dic[i] ?? 0) + 1
        }
        let s1Len = s1.count
        let chars = Array.init(s2)
        for i in 0..<chars.count {
            if i >= s1Len  {
                let char = chars[i - s1Len]
                if dic[char] == -1 {
                    dic.removeValue(forKey: char)
                }else{
                    dic[char] = (dic[char] ?? 0) + 1
                }
            }
            let char = chars[i]
            if dic[char] == 1 {
                if dic.keys.count == 1 {
                    return true
                }
                dic.removeValue(forKey: char)
            }else{
                dic[char] = (dic[char] ?? 0) - 1
            }
        }
        return false
    }
}


func q0567(){
    let solu = q0567Solution()
    let s1 = "abc"
    let s2 = "cbaebabacd"
    let result = solu.checkInclusion(s1, s2)
    print(result)

}
