//
//  q0093.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 13/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//93. Restore IP Addresses
//Medium
//
//983
//
//443
//
//Add to List
//
//Share
//Given a string containing only digits, restore it by returning all possible valid IP address combinations.
//
//Example:
//
//Input: "25525511135"
//Output: ["255.255.11.135", "255.255.111.35"]
//Accepted
//172,275
//Submissions
//509,120
class q0093Solution {
    var intArray = [Int]()
    func restoreIpAddresses_helper(start:Int, end:Int, path: inout [Int], result: inout [[Int]]){
        if path.count > 4 {
            return
        }
        if start >= end {
            if path.count == 4 {
                result.append(path)
            }
            return
        }
        path.append(intArray[start])
        restoreIpAddresses_helper(start: start + 1, end: end, path: &path, result: &result)
        path.removeLast()
        if start > 0 && path.last != 0 && intArray[start] + path.last! * 10 <= 255 {
            let temp = intArray[start] + path.last! * 10
            path.removeLast()
            path.append(temp)
            restoreIpAddresses_helper(start: start + 1, end: end, path: &path, result: &result)
        }
    }
    func restoreIpAddresses(_ s: String) -> [String] {
        for i in s {
            intArray.append(Int(String(i))!)
        }
        var result_int = [[Int]]()
        var path = [Int]()
        restoreIpAddresses_helper(start: 0, end: intArray.count, path: &path, result: &result_int)
        var result = [String]()
        for nums in result_int {
            result.append("\(nums[0]).\(nums[1]).\(nums[2]).\(nums[3])")
        }
        return result
    }
}
func q0093(){
    let solution = q0093Solution()
    let string = "010010"
    let result = solution.restoreIpAddresses(string)
    print(result)
}
