//
//  q0204.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 18/02/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//204. Count Primes
//Easy
//
//1578
//
//516
//
//Add to List
//
//Share
//Count the number of prime numbers less than a non-negative number, n.
//
//Example:
//
//Input: 10
//Output: 4
//Explanation: There are 4 prime numbers less than 10, they are 2, 3, 5, 7.
//Accepted
//307,908
//Submissions
//1,007,667
class q0204Solution {
    func countPrimes(_ n: Int) -> Int {
        guard n > 2 else { return 0 }
        var array = [Bool](repeating: true, count: n)
        var count = 0
        let upper = Int.init(sqrt(Double.init(n)))
        for i in 2..<n {
            guard array[i] else {
                continue
            }
            count += 1
            if i > upper {
                continue
            }
            var j = i * i
            while j < n {
                array[j] = false
                j += i
            }
        }
        return count
    }
}

func q0204() -> () {
    let result = q0204Solution().countPrimes(10)
    print(result)
}
