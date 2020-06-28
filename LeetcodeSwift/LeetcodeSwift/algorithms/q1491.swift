//
//  q5432.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 27/06/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//1491. Average Salary Excluding the Minimum and Maximum Salary
//User Accepted:0
//User Tried:0
//Total Accepted:0
//Total Submissions:0
//Difficulty:Easy
//Given an array of unique integers salary where salary[i] is the salary of the employee i.
//
//Return the average salary of employees excluding the minimum and maximum salary.
//
//
//
//Example 1:
//
//Input: salary = [4000,3000,1000,2000]
//Output: 2500.00000
//Explanation: Minimum salary and maximum salary are 1000 and 4000 respectively.
//Average salary excluding minimum and maximum salary is (2000+3000)/2= 2500
//Example 2:
//
//Input: salary = [1000,2000,3000]
//Output: 2000.00000
//Explanation: Minimum salary and maximum salary are 1000 and 3000 respectively.
//Average salary excluding minimum and maximum salary is (2000)/1= 2000
//Example 3:
//
//Input: salary = [6000,5000,4000,3000,2000,1000]
//Output: 3500.00000
//Example 4:
//
//Input: salary = [8000,9000,2000,3000,6000,1000]
//Output: 4750.00000
//
//
//Constraints:
//
//3 <= salary.length <= 100
//10^3 <= salary[i] <= 10^6
//salary[i] is unique.
//Answers within 10^-5 of the actual value will be accepted as correct.
class q1491Solution {
    func average(_ salary: [Int]) -> Double {
        var minVal = Int.max
        var maxVal = 0
        var sum = 0
        for number in salary {
            if minVal > number {
                minVal = number
            }
            if maxVal < number {
                maxVal = number
            }
            sum += number
        }
        return  Double(Double(sum - minVal - maxVal) / Double(salary.count - 2))
    }
}

func q1491(){
    let solu = q1491Solution()
    let nums = [48000,59000,99000,13000,78000,45000,31000,17000,39000,37000,93000,77000,33000,28000,4000,54000,67000,6000,1000,11000]
    let result = solu.average(nums)
    print(result)
}
