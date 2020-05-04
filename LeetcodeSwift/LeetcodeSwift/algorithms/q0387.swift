//
//  q0387.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 05/05/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//387. First Unique Character in a String
//Easy
//
//1661
//
//111
//
//Add to List
//
//Share
//Given a string, find the first non-repeating character in it and return it's index. If it doesn't exist, return -1.
//
//Examples:
//
//s = "leetcode"
//return 0.
//
//s = "loveleetcode",
//return 2.
//Note: You may assume the string contain only lowercase letters.
//
//Accepted
//434,565
//Submissions
//837,138

class q0387Solution {
    func firstUniqChar(_ s: String) -> Int {
        var dic1 = [Character: Int]()
        var dic2 = [Character: Int]()
        var index = 0
        for i in s {
            if dic2[i] != nil {
            }else if dic1[i] != nil {
                dic2[i] = 2
                dic1.removeValue(forKey: i)
            }else{
                dic1[i] = index
            }
            index += 1
        }
        var result = Int.max
        for key in dic1.keys {
            if dic1[key]! < result {
                result = dic1[key]!
            }
        }
        return result == Int.max ? -1 : result
    }
}

func q0387(){
    let solu = q0387Solution()
    let s = "loveleetcode"
    print(solu.firstUniqChar(s))
}
