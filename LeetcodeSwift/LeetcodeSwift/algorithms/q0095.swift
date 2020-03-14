//
//  q0095.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 14/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//95. Unique Binary Search Trees II
//Medium
//
//1781
//
//145
//
//Add to List
//
//Share
//Given an integer n, generate all structurally unique BST's (binary search trees) that store values 1 ... n.
//
//Example:
//
//Input: 3
//Output:
//[
//  [1,null,3,2],
//  [3,2,null,1],
//  [3,1,null,null,2],
//  [2,1,3],
//  [1,null,2,null,3]
//]
//Explanation:
//The above output corresponds to the 5 unique BST's shown below:
//
//   1         3     3      2      1
//    \       /     /      / \      \
//     3     2     1      1   3      2
//    /     /       \                 \
//   2     1         2                 3
//Accepted
//172,628
//Submissions
//446,347

class q0095Solution {
    func generateTrees_helper(min: Int, max: Int) -> [TreeNode?] {
        if min > max {
            return [nil]
        }
        if min == max {
            return [TreeNode.init(min)]
        }
        var result = [TreeNode?]()
        for i in min...max {
            let leftArray = generateTrees_helper(min: min, max: i - 1)
            let rightArray = generateTrees_helper(min: i + 1, max: max)
            for left in leftArray {
                for right in rightArray {
                    let root = TreeNode.init(i)
                    root.left = left
                    root.right = right
                    result.append(root)
                }
            }
        }
        return result
    }
    func generateTrees(_ n: Int) -> [TreeNode?] {
        if n < 1 {
            return [TreeNode?]()
        }
        return generateTrees_helper(min: 1, max: n)
    }
}
