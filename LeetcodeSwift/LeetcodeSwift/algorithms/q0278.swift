//
//  q0278.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 01/05/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//278. First Bad Version
//Easy
//
//1104
//
//590
//
//Add to List
//
//Share
//You are a product manager and currently leading a team to develop a new product. Unfortunately, the latest version of your product fails the quality check. Since each version is developed based on the previous version, all the versions after a bad version are also bad.
//
//Suppose you have n versions [1, 2, ..., n] and you want to find out the first bad one, which causes all the following ones to be bad.
//
//You are given an API bool isBadVersion(version) which will return whether version is bad. Implement a function to find the first bad version. You should minimize the number of calls to the API.
//
//Example:
//
//Given n = 5, and version = 4 is the first bad version.
//
//call isBadVersion(3) -> false
//call isBadVersion(5) -> true
//call isBadVersion(4) -> true
//
//Then 4 is the first bad version.
//Accepted
//323,161
//Submissions
//955,344
class VersionControl: NSObject {
    func isBadVersion(_ version: Int) -> Bool{
        let result = false
        return result
    }
}
class q0278Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        var left = 0
        var right = n
        var result = n
        while left <= right {
            let mid = (left + right) / 2
            if isBadVersion(mid) {
                result = mid
                right = mid - 1
            }else{
                left = mid + 1
            }
        }
        return result
    }
}
