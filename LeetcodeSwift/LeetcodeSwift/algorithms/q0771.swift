//
//  q0771.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 28/02/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation

//771. Jewels and Stones
//Easy
//
//1809
//
//327
//
//Add to List
//
//Share
//You're given strings J representing the types of stones that are jewels, and S representing the stones you have.  Each character in S is a type of stone you have.  You want to know how many of the stones you have are also jewels.
//
//The letters in J are guaranteed distinct, and all characters in J and S are letters. Letters are case sensitive, so "a" is considered a different type of stone from "A".
//
//Example 1:
//
//Input: J = "aA", S = "aAAbbbb"
//Output: 3
//Example 2:
//
//Input: J = "z", S = "ZZ"
//Output: 0
//Note:
//
//S and J will consist of letters and have length at most 50.
//The characters in J are distinct.
//Accepted
//387,053
//Submissions
//457,826
class q0771Solution {
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        var result = 0
        var characterDictionary = Dictionary<Character, Bool>.init()
        for i in J {
            characterDictionary[i] = true
        }
        for i in S{
            if characterDictionary[i] == true {
                result += 1
            }
        }
        return result
    }
}

func q0771(){
    let J = "aA";
    let S = "aAAbbbb";
    print(q0771Solution().numJewelsInStones(J, S))
}
