//
//  q0844.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 09/04/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//844. Backspace String Compare
//Easy
//
//1129
//
//63
//
//Add to List
//
//Share
//Given two strings S and T, return if they are equal when both are typed into empty text editors. # means a backspace character.
//
//Example 1:
//
//Input: S = "ab#c", T = "ad#c"
//Output: true
//Explanation: Both S and T become "ac".
//Example 2:
//
//Input: S = "ab##", T = "c#d#"
//Output: true
//Explanation: Both S and T become "".
//Example 3:
//
//Input: S = "a##c", T = "#a#c"
//Output: true
//Explanation: Both S and T become "c".
//Example 4:
//
//Input: S = "a#c", T = "b"
//Output: false
//Explanation: S becomes "c" while T becomes "b".
//Note:
//
//1 <= S.length <= 200
//1 <= T.length <= 200
//S and T only contain lowercase letters and '#' characters.
//Follow up:
//
//Can you solve it in O(N) time and O(1) space?
//Accepted
//113,364
//Submissions
//239,093

class q0844Solution {
    var sCharacters = [Character]()
    var tCharacters = [Character]()
    
    func nextC(characters:[Character], index: Int) -> Int {
        var countHash = 0
        var _index = index
        while _index >= 0 {
            if characters[_index] == "#" {
                countHash += 1
            }else if(countHash > 0){
                countHash -= 1
            }else{
                return _index
            }
            _index -= 1
        }
        return -1
    }

    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        sCharacters = [Character].init(S)
        tCharacters = [Character].init(T)
        var sIndex = sCharacters.count - 1
        var tIndex = tCharacters.count - 1
        
        while sIndex >= 0 && tIndex >= 0 {
            sIndex = nextC(characters: sCharacters, index: sIndex)
            tIndex = nextC(characters: tCharacters, index: tIndex)
            if sIndex >= 0 && tIndex >= 0 && sCharacters[sIndex] != tCharacters[tIndex]  {
                return false
            }
            sIndex -= 1
            tIndex -= 1
        }
        if sIndex >= 0 && sCharacters[sIndex] == "#"{
            sIndex = nextC(characters: sCharacters, index: sIndex)
        }
        if tIndex >= 0 && tCharacters[tIndex] == "#" {
            tIndex = nextC(characters: tCharacters, index: tIndex)
        }
        return sIndex == tIndex
    }
}


func q0844() -> () {
    let solution = q0844Solution()
    let S = "rheyggodcclgstf"
    let T = "#rheyggodcclgstf"
    let result = solution.backspaceCompare(S, T)
    print(result)
}
