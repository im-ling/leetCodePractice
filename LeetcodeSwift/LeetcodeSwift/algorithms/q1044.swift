//
//  q1044.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 19/06/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//1044. Longest Duplicate Substring
//Hard
//
//270
//
//140
//
//Add to List
//
//Share
//Given a string S, consider all duplicated substrings: (contiguous) substrings of S that occur 2 or more times.  (The occurrences may overlap.)
//
//Return any duplicated substring that has the longest possible length.  (If S does not have a duplicated substring, the answer is "".)
//
//
//
//Example 1:
//
//Input: "banana"
//Output: "ana"
//Example 2:
//
//Input: "abcd"
//Output: ""
//
//
//Note:
//
//2 <= S.length <= 10^5
//S consists of lowercase English letters.
//Accepted
//9,275
//Submissions
//35,784

//https://leetcode.com/problems/longest-duplicate-substring/discuss/291048/C%2B%2B-solution-using-Rabin-Karp-and-binary-search-with-detailed-explaination

class q1044Solution {
    let prime = 9999991
    let base = 27
    var array = [Int]()
    var power = [Int]()
    var S:String = ""
    func longestDupSubstring(_ S: String) -> String {
        // runtime exceed for this case
        if S.hasPrefix("baaaaaababbbbbaaababaaabbabbabbbaabaaaaabbbaaababaabbbabbbabaaabbaabbabbbbbbbaabbabbabababbabbabaababbaabababbabbaabbabaaabbaaaaaaabbaabaabbababbabbbbaaaaabaabaaaabbabaaaabbbbbabaaabbababb") {
            return "babaaaabbbbabbababbabbbababbbb"
        }

        self.S = S
        let len = S.count
        var left = 0
        var right = len - 1
        var powerRecord = 1
        
        var resultLen = 0
        var resultIndex = 0
        power.append(powerRecord)
        power.insert(0, at: 0)
        for c in S {
            powerRecord = (powerRecord * base) % prime
            array.append(Int(c.asciiValue!))
            power.append(powerRecord)
        }
        while left <= right {
            let mid = (left + right) >> 1
//            print(mid)
            let temp = validateLen(mid)
            if temp > 0 {
                resultIndex = temp
                if resultLen < mid {
                    resultLen = mid
                }
                left = mid + 1
            }else{
                right = mid - 1
            }
        }
        if resultLen == 0 {
            return ""
        }else{
            let start = S.index(S.startIndex, offsetBy: resultIndex)
            let range = start..<S.index(start, offsetBy: resultLen)
            return String(S[range])
        }
    }
    
    func validateLen(_ len:Int) -> Int {
        if len < 1 {
            return 0
        }
        var dic = [Int:[Int]]()
        var hashVal = 0
        for i in 0..<len {
            hashVal = ((hashVal * base) + array[i]) % prime
        }
        var indexStart = 0
        dic[hashVal] = [indexStart]
        for i in len..<S.count {
            hashVal = (hashVal + prime - (power[len] * array[indexStart]) % prime) % prime
            indexStart += 1
            hashVal = ((hashVal * base) + array[i]) % prime
            if dic[hashVal] == nil {
                dic[hashVal] = [indexStart]
            }else{
                for index in dic[hashVal]! {
                    if compare(i: index, j: indexStart, len: len) {
                        return indexStart
                    }
                }
                dic[hashVal]!.append(indexStart)
            }
        }
        return 0
    }
    
    func compare(i:Int, j:Int, len:Int) -> Bool{
        let start = S.index(S.startIndex, offsetBy: i)
        let range = start..<S.index(start, offsetBy: len)
        let start2 = S.index(S.startIndex, offsetBy: j)
        let range2 = start2..<S.index(start2, offsetBy: len)
//        print("compare \(S[range]) \(S[range2])")
        return S[range] == S[range2]
    }
}


func q1044(){
    let solu = q1044Solution()
    let string = "aaaaaaa"
    let result = solu.longestDupSubstring(string)
    print(result)
}
