//
//  q0060.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 03/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//60. Permutation Sequence
//Medium
//
//1179
//
//286
//
//Add to List
//
//Share
//The set [1,2,3,...,n] contains a total of n! unique permutations.
//
//By listing and labeling all of the permutations in order, we get the following sequence for n = 3:
//
//"123"
//"132"
//"213"
//"231"
//"312"
//"321"
//Given n and k, return the kth permutation sequence.
//
//Note:
//
//Given n will be between 1 and 9 inclusive.
//Given k will be between 1 and n! inclusive.
//Example 1:
//
//Input: n = 3, k = 3
//Output: "213"
//Example 2:
//
//Input: n = 4, k = 9
//Output: "2314"
//Accepted
//165,237
//Submissions
//467,944

class q0060Solution {
    
    func getPermutation2(_ n: Int, _ k: Int) -> String {
        var candidates = [Int]()
        var factor = 1
        for i in 1...n {
            candidates.append(i)
            factor *= i
        }
        factor /= n

        var resultNumber = 0
        var tempk = k - 1
        for i in (1..<n).reversed() {
            let index = tempk / factor
            resultNumber = resultNumber * 10 + candidates[index]
            candidates.remove(at: index)
            tempk %= factor
            factor /= i
        }
        resultNumber = resultNumber * 10 + candidates[0]

        return String(resultNumber)
    }
    
    func getPermutation_helper(_ n: Int, _ k: Int, candidate:inout [Int] , path:inout [Int]){
        if candidate.count == 0 {
            return
        }
        var factor = 1
        for i in 1..<candidate.count {
            factor *= i
        }
        let index = k / factor
        path.append(candidate[index])
        candidate.remove(at: index)
        getPermutation_helper(n, k % factor, candidate: &candidate, path: &path)
    }
    func getPermutation(_ n: Int, _ k: Int) -> String {
        var candidate = [Int]()
        for i in 1...n {
            candidate.append(i)
        }
        var path = [Int]()
        getPermutation_helper(n, k - 1, candidate: &candidate, path: &path)
        var result = ""
        for number in path {
            result += String(number)
        }
        return result
    }
}

func q0060(){
    let solution = q0060Solution()
    let result = solution.getPermutation(4, 9)
    print(result)
}
