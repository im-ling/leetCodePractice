//
//  q0383.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 03/05/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//383. Ransom Note
//Easy
//
//479
//
//167
//
//Add to List
//
//Share
//Given an arbitrary ransom note string and another string containing letters from all the magazines, write a function that will return true if the ransom note can be constructed from the magazines ; otherwise, it will return false.
//
//Each letter in the magazine string can only be used once in your ransom note.
//
//Note:
//You may assume that both strings contain only lowercase letters.
//
//canConstruct("a", "b") -> false
//canConstruct("aa", "ab") -> false
//canConstruct("aa", "aab") -> true
//Accepted
//144,484
//Submissions
//278,984

class q0383Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var dic = [Character: Int]()
        for i in ransomNote {
            dic[i] = (dic[i] ?? 0) + 1
        }
        for i in magazine {
            if dic[i] != nil {
                dic[i]! -= 1
                if dic[i] == 0 {
                    dic.removeValue(forKey: i)
                }
            }
        }
        return dic.keys.count == 0
    }
}

func q0383(){
    let string1 = "aa"
    let string2 = "ab"
    let solu = q0383Solution()
    let result = solu.canConstruct(string1, string2)
    print(result)
}
