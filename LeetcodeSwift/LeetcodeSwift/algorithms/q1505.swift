//
//  q1505.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 05/07/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//1505. Minimum Possible Integer After at Most K Adjacent Swaps On Digits
//Hard
//
//59
//
//8
//
//Add to List
//
//Share
//Given a string num representing the digits of a very large integer and an integer k.
//
//You are allowed to swap any two adjacent digits of the integer at most k times.
//
//Return the minimum integer you can obtain also as a string.
//
//
//
//Example 1:
//
//
//Input: num = "4321", k = 4
//Output: "1342"
//Explanation: The steps to obtain the minimum integer from 4321 with 4 adjacent swaps are shown.
//Example 2:
//
//Input: num = "100", k = 1
//Output: "010"
//Explanation: It's ok for the output to have leading zeros, but the input is guaranteed not to have any leading zeros.
//Example 3:
//
//Input: num = "36789", k = 1000
//Output: "36789"
//Explanation: We can keep the number without any swaps.
//Example 4:
//
//Input: num = "22", k = 22
//Output: "22"
//Example 5:
//
//Input: num = "9438957234785635408", k = 23
//Output: "0345989723478563548"
//
//
//Constraints:
//
//1 <= num.length <= 30000
//num contains digits only and doesn't have leading zeros.
//1 <= k <= 10^9
//Accepted
//1,360
//Submissions
//4,560
class q1505Solution {
    func minInteger(_ num: String, _ k: Int) -> String {
        var array:Array<Character> = Array.init(num)
        var sortedArray = array.sorted()
        if (1 + array.count) * array.count <= k {
            return String(sortedArray)
        }
        var startIndex = 0
        var times = k
//        print(sortedArray)
//        print(array)
        while startIndex < array.count{
            var count = startIndex
            while times > 0 && count < sortedArray.count {
//                print("target \(sortedArray[count])    k \(times) startIndex \(startIndex)")
                for i in startIndex..<array.count {
                    if times < i - startIndex {
                        break
                    }
                    if array[i] == sortedArray[count]{
                        times -= (i - startIndex)
                        let number = array[i]
                        array.remove(at: i)
                        array.insert(number, at: startIndex)
                        sortedArray.remove(at: count)
                        sortedArray.insert(number, at: startIndex)
                        count = startIndex
                        startIndex += 1
//                        print(sortedArray)
//                        print(array)
                        break
                    }
                }
                count += 1
            }
            startIndex += 1
        }
        return String.init(array)
    }
}
