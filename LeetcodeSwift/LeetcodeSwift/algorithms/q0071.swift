//
//  q0071.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 04/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//71. Simplify Path
//Medium
//
//630
//
//1559
//
//Add to List
//
//Share
//Given an absolute path for a file (Unix-style), simplify it. Or in other words, convert it to the canonical path.
//
//In a UNIX-style file system, a period . refers to the current directory. Furthermore, a double period .. moves the directory up a level. For more information, see: Absolute path vs relative path in Linux/Unix
//
//Note that the returned canonical path must always begin with a slash /, and there must be only a single slash / between two directory names. The last directory name (if it exists) must not end with a trailing /. Also, the canonical path must be the shortest string representing the absolute path.
//
//
//
//Example 1:
//
//Input: "/home/"
//Output: "/home"
//Explanation: Note that there is no trailing slash after the last directory name.
//Example 2:
//
//Input: "/../"
//Output: "/"
//Explanation: Going one level up from the root directory is a no-op, as the root level is the highest level you can go.
//Example 3:
//
//Input: "/home//foo/"
//Output: "/home/foo"
//Explanation: In the canonical path, multiple consecutive slashes are replaced by a single one.
//Example 4:
//
//Input: "/a/./b/../../c/"
//Output: "/c"
//Example 5:
//
//Input: "/a/../../b/../c//.//"
//Output: "/c"
//Example 6:
//
//Input: "/a//b////c/d//././/.."
//Output: "/a/b/c"
//Accepted
//187,215
//Submissions
//602,118
class q0071Solution {
    func simplifyPath(_ path: String) -> String {
        var array = path.split(separator: "/")
        print(array)
        var index = 0
        while index < array.count {
            if array[index] == "." {
                array.remove(at: index)
                index -= 1
            }else if array[index] == ".."{
                array.remove(at: index)
                index -= 1
                if index >= 0 {
                    array.remove(at: index)
                    index -= 1
                }
            }
            index += 1
        }
        var result = ""
        for item in array {
            result += "/" + item
        }
        if result.count == 0 {
            return "/"
        }
        return result
    }
}

func q0071(){
    let solution = q0071Solution()
    let path = "/a/../../b/../c//.//"
    
    let result = solution.simplifyPath(path)
    print(result)
}
