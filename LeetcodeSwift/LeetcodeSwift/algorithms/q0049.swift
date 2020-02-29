//
//  q0049.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 01/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//49. Group Anagrams
//Medium
//
//2587
//
//150
//
//Add to List
//
//Share
//Given an array of strings, group anagrams together.
//
//Example:
//
//Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
//Output:
//[
//  ["ate","eat","tea"],
//  ["nat","tan"],
//  ["bat"]
//]
//Note:
//
//All inputs will be in lowercase.
//The order of your output does not matter.
//Accepted
//494,752
//Submissions
//938,417

class q0049Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var result = [[String]]()
        var resultDic = Dictionary<String,Array<String>>.init()
        for str in strs {
            let sort = String(str.sorted())
            if resultDic[sort] != nil {
                resultDic[sort]?.append(str)
            }else{
                resultDic[sort] = [str]
            }
        }
        for value in resultDic.values{
            result.append(value)
        }
        return result
    }
//    func groupAnagrams3(_ strs: [String]) -> [[String]] {
//        var result = [[String]]()
//        var resultDic = Dictionary<String,Array<String>>.init()
//        for i in strs {
//            var characterDic = Dictionary<Character,Int>.init()
//            for j in i {
//                if characterDic[j] != nil {
//                    characterDic[j]! += 1
//                }else{
//                    characterDic[j] = 1
//                }
//            }
//            var string = ""
//            for key in characterDic.keys.sorted() {
//                string += String(key) + String(characterDic[key]!)
//            }
//            if resultDic[string] != nil {
//                resultDic[string]?.append(i)
//            }else{
//                resultDic[string] = [i]
//            }
//        }
//        for value in resultDic.values{
//            result.append(value)
//        }
//        return result
//    }
//    func groupAnagrams2(_ strs: [String]) -> [[String]] {
//        var result = [[String]]()
//        var resultDic = Dictionary<String,Array<String>>.init()
//        var characterDic = Dictionary<Character,Int>.init()
//        let characterString = "abcdefghijklmnopqrstuvwxyz"
//        for char in characterString {
//            characterDic[char] = 0
//        }
//        for i in strs {
//            for j in i {
//                characterDic[j]! += 1
//            }
//
//            var string = ""
//            for j in characterString {
//                string += String(j) + String(characterDic[j]!)
//                characterDic[j] = 0
//            }
//            if resultDic[string] != nil {
//                resultDic[string]?.append(i)
//            }else{
//                resultDic[string] = [i]
//            }
//        }
//        for (_, value) in resultDic {
//            result.append(value)
//        }
//        return result
//    }
}
func q0049() -> () {
    let solution = q0049Solution()
    let stringArray = ["eat", "tea", "tan", "ate", "nat", "bat"];
    let result = solution.groupAnagrams(stringArray)
    print(result)
}
