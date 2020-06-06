//
//  q0406.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 06/06/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//406. Queue Reconstruction by Height
//Medium
//
//2591
//
//300
//
//Add to List
//
//Share
//Suppose you have a random list of people standing in a queue. Each person is described by a pair of integers (h, k), where h is the height of the person and k is the number of people in front of this person who have a height greater than or equal to h. Write an algorithm to reconstruct the queue.
//
//Note:
//The number of people is less than 1,100.
//
//
//Example
//
//Input:
//[[7,0], [4,4], [7,1], [5,0], [6,1], [5,2]]
//
//Output:
//[[5,0], [7,0], [5,2], [6,1], [4,4], [7,1]]
//
//
//Accepted
//124,541
//Submissions
//193,626

// dic
// {0:[5,7], 1:[6,7]}
// 排好 零后，  insert

class q0406Solution {
    
    func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
        var sortedPeople = people
        sortedPeople.sort { (a, b) -> Bool in
            if a[0] == b[0] {
                return a[1] > b[1] ? false : true
            }
            return b[0] > a[0] ? false : true
        }
//        print(sortedPeople)
        var result = [[Int]]()
        
        for i in 0..<sortedPeople.count {
            result.insert(sortedPeople[i], at: sortedPeople[i][1])
        }
        
        return result
    }
    
    func reconstructQueue2(_ people: [[Int]]) -> [[Int]] {
        if people.count < 2 {
            return people
        }
        var result = [[Int]]()
        var dic = [Int: [Int]]()
        for pair in people{
            if dic[pair[1]] == nil {
                dic[pair[1]] = [Int]()
            }
            dic[pair[1]]!.append(pair[0])
        }
        for key in dic.keys {
            dic[key] = dic[key]!.sorted()
        }
        
        // 处理0
        for item in dic[0]! {
            result.append([item, 0])
        }
        dic.removeValue(forKey: 0)
        
        
        let keys = dic.keys.sorted()
        for key in keys {
            for number in dic[key]!.reversed() {
                var count = 0
                for i in 0..<result.count {
                    if number <= result[i][0] {
                        count += 1
                        if count == key {
//                            print("\(i) ---  \(key)")
//                            print(result)
                            result.insert([number, key], at: i + 1)
                            break;
                        }
                    }
                }
            }
        }
//        print(result)
        return result
    }
}

func q0406(){
    let solu = q0406Solution()
    let people = [[7,0],[4,4],[7,1],[5,0],[6,1],[5,2]]
    let result = solu.reconstructQueue(people)
    print(result)
}
