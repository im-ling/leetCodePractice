//
//  q0678.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 13/02/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//678. Valid Parenthesis String
//Medium
//
//881
//
//29
//
//Add to List
//
//Share
//Given a string containing only three types of characters: '(', ')' and '*', write a function to check whether this string is valid. We define the validity of a string by these rules:
//
//Any left parenthesis '(' must have a corresponding right parenthesis ')'.
//Any right parenthesis ')' must have a corresponding left parenthesis '('.
//Left parenthesis '(' must go before the corresponding right parenthesis ')'.
//'*' could be treated as a single right parenthesis ')' or a single left parenthesis '(' or an empty string.
//An empty string is also valid.
//Example 1:
//Input: "()"
//Output: True
//Example 2:
//Input: "(*)"
//Output: True
//Example 3:
//Input: "(*))"
//Output: True
//Note:
//The string size will be in the range [1, 100].
//Accepted
//39,151
//Submissions
//115,883
class q0678Solution {
    
    func checkValidString_helper(s: [Character], position:Int, countLeft:Int) -> Bool {
        var localCountLeft = countLeft
        for i in position ..< s.count {
            if s[i] == "(" {
                localCountLeft += 1
            }else if s[i] == ")"{
                if localCountLeft < 1 {
                    return false
                }
                localCountLeft -= 1
            }else{
                return checkValidString_helper(s: s, position: i + 1, countLeft: localCountLeft - 1) || checkValidString_helper(s: s, position: i + 1, countLeft: localCountLeft) || checkValidString_helper(s: s, position: i + 1, countLeft: localCountLeft + 1)
            }
        }
        if localCountLeft == 0 {
            return true
        }
        return false
    }
    
    

    
    func checkValidString(_ s: String) -> Bool {
        return checkValidString_helper(s: Array.init(s), position: 0, countLeft: 0)
    }
    
//Approach #3: Greedy [Accepted]
//Intuition
//
//When checking whether the string is valid, we only cared about the "balance": the number of extra, open left brackets as we parsed through the string. For example, when checking whether '(()())' is valid, we had a balance of 1, 2, 1, 2, 1, 0 as we parse through the string: '(' has 1 left bracket, '((' has 2, '(()' has 1, and so on. This means that after parsing the first i symbols, (which may include asterisks,) we only need to keep track of what the balance could be.
//
//For example, if we have string '(***)', then as we parse each symbol, the set of possible values for the balance is [1] for '('; [0, 1, 2] for '(*'; [0, 1, 2, 3] for '(**'; [0, 1, 2, 3, 4] for '(***', and [0, 1, 2, 3] for '(***)'.
//
//Furthermore, we can prove these states always form a contiguous interval. Thus, we only need to know the left and right bounds of this interval. That is, we would keep those intermediate states described above as [lo, hi] = [1, 1], [0, 2], [0, 3], [0, 4], [0, 3].
//
//Algorithm
//
//Let lo, hi respectively be the smallest and largest possible number of open left brackets after processing the current character in the string.
//
//If we encounter a left bracket (c == '('), then lo++, otherwise we could write a right bracket, so lo--. If we encounter what can be a left bracket (c != ')'), then hi++, otherwise we must write a right bracket, so hi--. If hi < 0, then the current prefix can't be made valid no matter what our choices are. Also, we can never have less than 0 open left brackets. At the end, we should check that we can have exactly 0 open left brackets.
    
    func checkValidStringGreedy(_ s: String) -> Bool {
        var low = 0
        var high = 0
        for i in s {
            if i == "(" {
                low += 1
            }else{
                low -= 1
            }

            if i != ")" {
                high += 1
            }else{
                high -= 1
            }
            
            if high < 0 {
                break
            }
            
            if low < 0 {
                low = 0
            }
        }
        return low == 0
    }

}

func q0678() -> () {
    let s = "(*)"
    let solution = q0678Solution()
    let result = solution.checkValidString(s)
    print(result)
}



