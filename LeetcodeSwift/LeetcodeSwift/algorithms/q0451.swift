//
//  q0451.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 22/05/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation

//451. Sort Characters By Frequency
//Medium
//
//1249
//
//99
//
//Add to List
//
//Share
//Given a string, sort it in decreasing order based on the frequency of characters.
//
//Example 1:
//
//Input:
//"tree"
//
//Output:
//"eert"
//
//Explanation:
//'e' appears twice while 'r' and 't' both appear once.
//So 'e' must appear before both 'r' and 't'. Therefore "eetr" is also a valid answer.
//Example 2:
//
//Input:
//"cccaaa"
//
//Output:
//"cccaaa"
//
//Explanation:
//Both 'c' and 'a' appear three times, so "aaaccc" is also a valid answer.
//Note that "cacaca" is incorrect, as the same characters must be together.
//Example 3:
//
//Input:
//"Aabb"
//
//Output:
//"bbAa"
//
//Explanation:
//"bbaA" is also a valid answer, but "Aabb" is incorrect.
//Note that 'A' and 'a' are treated as two different characters.
//Accepted
//143,649
//Submissions
//239,365


class q0451Solution {
    func partition(arr: inout [Int], low:Int, high: Int, customerArr: inout [Character]) -> Int{
        var low = low
        var high = high
        let key = arr[low]
        let char = customerArr[low]
        while low < high {
            while low < high && arr[high] >= key{
                high -= 1
            }
            arr[low] = arr[high]
            customerArr[low] = customerArr[high]
            while low < high &&  arr[low] <= key {
                low += 1
            }
            arr[high] = arr[low]
            customerArr[high] = customerArr[low]
        }
        arr[low] = key
        customerArr[low] = char
        return low
    }
    
    func qsortWithCustomerArray(arr: inout [Int], low: Int, high: Int, customerArr: inout [Character]){
        if low < high {
            let mid = partition(arr: &arr, low: low, high: high, customerArr: &customerArr)
            qsortWithCustomerArray(arr: &arr, low: low, high: mid - 1, customerArr: &customerArr)
            qsortWithCustomerArray(arr: &arr, low: mid + 1, high: high, customerArr: &customerArr)
        }
    }
    
    func frequencySort(_ s: String) -> String {
        var result = ""
        var dic = [Character: Int]()
        for i in s {
            dic[i] = (dic[i] ?? 0) + 1
        }
        
        var keys = [Character]()
        var values = [Int]()
        for key in dic.keys {
            keys.append(key)
            values.append(dic[key]!)
        }
        
        qsortWithCustomerArray(arr: &values, low: 0, high: values.count - 1, customerArr: &keys)
        for i in (0..<values.count).reversed() {
            result += String.init(repeating: keys[i], count: values[i])
        }
        return result
    }
}

func q0451(){
    let solu = q0451Solution()
    let string = "Aabb"
    let result = solu.frequencySort(string)
    print(result)
}
