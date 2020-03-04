//
//  q0068.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 04/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//68. Text Justification
//Hard
//
//549
//
//1373
//
//Add to List
//
//Share
//Given an array of words and a width maxWidth, format the text such that each line has exactly maxWidth characters and is fully (left and right) justified.
//
//You should pack your words in a greedy approach; that is, pack as many words as you can in each line. Pad extra spaces ' ' when necessary so that each line has exactly maxWidth characters.
//
//Extra spaces between words should be distributed as evenly as possible. If the number of spaces on a line do not divide evenly between words, the empty slots on the left will be assigned more spaces than the slots on the right.
//
//For the last line of text, it should be left justified and no extra space is inserted between words.
//
//Note:
//
//A word is defined as a character sequence consisting of non-space characters only.
//Each word's length is guaranteed to be greater than 0 and not exceed maxWidth.
//The input array words contains at least one word.
//Example 1:
//
//Input:
//words = ["This", "is", "an", "example", "of", "text", "justification."]
//maxWidth = 16
//Output:
//[
//   "This    is    an",
//   "example  of text",
//   "justification.  "
//]
//Example 2:
//
//Input:
//words = ["What","must","be","acknowledgment","shall","be"]
//maxWidth = 16
//Output:
//[
//  "What   must   be",
//  "acknowledgment  ",
//  "shall be        "
//]
//Explanation: Note that the last line is "shall be    " instead of "shall     be",
//             because the last line must be left-justified instead of fully-justified.
//             Note that the second line is also left-justified becase it contains only one word.
//Example 3:
//
//Input:
//words = ["Science","is","what","we","understand","well","enough","to","explain",
//         "to","a","computer.","Art","is","everything","else","we","do"]
//maxWidth = 20
//Output:
//[
//  "Science  is  what we",
//  "understand      well",
//  "enough to explain to",
//  "a  computer.  Art is",
//  "everything  else  we",
//  "do                  "
//]
//Accepted
//122,071
//Submissions
//468,041

class q0068Solution {
    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        var result = [String]()
        var sum = 0
        var temp = [String]()
        for word in words {
            if word.count + sum + temp.count > maxWidth {
                var tempStr = ""
                if temp.count > 1 {
                    let blankLen = maxWidth - sum
                    let quotient = blankLen / (temp.count - 1)
                    var blankArray = [String].init()
                    for i in 0..<temp.count - 1{
                        var blank = ""
                        for _ in 0..<quotient {
                            blank += " "
                        }
                        if blankLen % (temp.count - 1) > i  {
                            blank += " "
                        }
                        blankArray.append(blank)
                    }
                    
                    for i in 0..<temp.count - 1{
                        tempStr += temp[i] + blankArray[i]
                    }
                    tempStr += temp.last!
                }else{
                    tempStr += temp[0]
                    for _ in tempStr.count..<maxWidth {
                        tempStr += " "
                    }
                }

                result.append(tempStr)

                sum = 0
                temp.removeAll()
            }
            temp.append(word)
            sum += word.count
        }
        
        var tempStr = ""
        for word in temp {
            tempStr += word
            if tempStr.count < maxWidth {
                tempStr += " "
            }
        }
        for _ in tempStr.count..<maxWidth {
            tempStr += " "
        }
        result.append(tempStr)
        return result
    }
}
func q0068(){
    let solution = q0068Solution()
    let maxWidth = 16
    let words = ["ask","not","what","your","country","can","do","for","you","ask","what","you","can","do","for","your","country"]
    let result = solution.fullJustify(words, maxWidth)
    print(result)
}
