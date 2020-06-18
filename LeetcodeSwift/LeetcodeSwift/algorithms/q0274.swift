//
//  q0274.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 18/06/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//274. H-Index
//Medium
//
//575
//
//969
//
//Add to List
//
//Share
//Given an array of citations (each citation is a non-negative integer) of a researcher, write a function to compute the researcher's h-index.
//
//According to the definition of h-index on Wikipedia: "A scientist has index h if h of his/her N papers have at least h citations each, and the other N − h papers have no more than h citations each."
//
//Example:
//
//Input: citations = [3,0,6,1,5]
//Output: 3
//Explanation: [3,0,6,1,5] means the researcher has 5 papers in total and each of them had
//             received 3, 0, 6, 1, 5 citations respectively.
//             Since the researcher has 3 papers with at least 3 citations each and the remaining
//             two with no more than 3 citations each, her h-index is 3.
//Note: If there are several possible values for h, the maximum one is taken as the h-index.
//
//Accepted
//148,808
//Submissions
//419,818
class q0274Solution {
    func hIndex(_ citations: [Int]) -> Int {
        let citations = citations.sorted()
        var result = Int.max
        let len = citations.count
        var left = 0
        var right = len - 1
        while left <= right {
            let mid = (left + right) / 2
            if citations[mid] >= len - mid {
                result = len - mid
                right = mid - 1
            }else{
                left = mid + 1
            }
        }
        if result == Int.max {
            return 0
        }
        return result
    }
}
