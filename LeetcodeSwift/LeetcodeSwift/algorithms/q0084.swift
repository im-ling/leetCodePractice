//
//  q0084.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 12/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//84. Largest Rectangle in Histogram
//Hard
//
//2905
//
//72
//
//Add to List
//
//Share
//Given n non-negative integers representing the histogram's bar height where the width of each bar is 1, find the area of largest rectangle in the histogram.
//
//Above is a histogram where width of each bar is 1, given height = [2,1,5,6,2,3].
//
//The largest rectangle is shown in the shaded area, which has area = 10 unit.
//
//Example:
//
//Input: [2,1,5,6,2,3]
//Output: 10
//Accepted
//227,586
//Submissions
//678,127

class q0084Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        if heights.count < 1 {
            return 0
        }
        var result = heights[0]
        var stack = [[Int]]()
        stack.append([result, 0])
        for index in 1..<heights.count {
            if stack.last![0] < heights[index] {
                stack.append([heights[index], index])
                if heights[index] > result {
                    result = heights[index]
                }
            }else if stack.last![0] > heights[index]{
                for item in stack {
                    let value = item[0] * (index - item[1] + 1)
                    if value > result {
                        result = value
                    }
                }
                var tempIndex = index
                while stack.last != nil && stack.last![0] > heights[index] {
                    tempIndex = stack.last![1]
                    stack.removeLast()
                }
                stack.append([heights[index], tempIndex])
            }
        }
        for item in stack {
            let value = item[0] * (heights.count - item[1])
            if value > result {
                result = value
            }
        }
        return result
    }
    
    func largestRectangleArea2(_ heights: [Int]) -> Int {
        guard !heights.isEmpty else { return 0 }
        
        var maxArea = 0
        
        // hold the index
        var stack = [-1]
        for i in 0..<heights.count {
            while stack.count > 1, heights[stack.last!] > heights[i] {
                maxArea = max(maxArea,
                             heights[stack.removeLast()] * (i - stack.last! - 1))
            }
            stack.append(i)
        }
        
        while stack.count > 1 {
            maxArea = max(maxArea,
                         heights[stack.removeLast()] * (heights.count - stack.last! - 1))
        }
        return maxArea
    }
}


func q0084(){
    let solution = q0084Solution()
    let numbers = [1,2,2]
    let result = solution.largestRectangleArea(numbers)
    print(result)
}
