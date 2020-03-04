//
//  q0065.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 04/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//65. Valid Number
//Hard
//
//613
//
//4280
//
//Add to List
//
//Share
//Validate if a given string can be interpreted as a decimal number.
//
//Some examples:
//"0" => true
//" 0.1 " => true
//"abc" => false
//"1 a" => false
//"2e10" => true
//" -90e3   " => true
//" 1e" => false
//"e3" => false
//" 6e-1" => true
//" 99e2.5 " => false
//"53.5e93" => true
//" --6 " => false
//"-+3" => false
//"95a54e53" => false
//
//Note: It is intended for the problem statement to be ambiguous. You should gather all requirements up front before implementing one. However, here is a list of characters that can be in a valid decimal number:
//
//Numbers 0-9
//Exponent - "e"
//Positive/negative sign - "+"/"-"
//Decimal point - "."
//Of course, the context of these characters also matters in the input.
//
//Update (2015-02-10):
//The signature of the C++ function had been updated. If you still see your function signature accepts a const char * argument, please click the reload button to reset your code definition.
//
//Accepted
//153,706
//Submissions
//1,039,873
class q0065Solution {
    func isNumber(_ s: String) -> Bool {
        var numberFlag = false
        var decimalPointFlag = false
        var exponentFlag = false
        var signalFlag = false
        var blankFlag = false
        for i in s {
            switch i {
            case " ":
                if numberFlag || decimalPointFlag || exponentFlag || signalFlag {
                    blankFlag = true
                }
            case "0":numberFlag = true
                if blankFlag {
                    return false
                }
            case "1": numberFlag = true
                if blankFlag {
                    return false
                }
            case "2": numberFlag = true
                if blankFlag {
                    return false
                }
            case "3": numberFlag = true
                if blankFlag {
                    return false
                }
            case "4": numberFlag = true
                if blankFlag {
                    return false
                }
            case "5": numberFlag = true
                if blankFlag {
                    return false
                }
            case "6": numberFlag = true
                if blankFlag {
                    return false
                }
            case "7": numberFlag = true
                if blankFlag {
                    return false
                }
            case "8": numberFlag = true
                if blankFlag {
                    return false
                }
            case "9": numberFlag = true
                if blankFlag {
                    return false
                }
            case ".":
                if blankFlag || decimalPointFlag || exponentFlag{
                    return false
                }
                decimalPointFlag = true
            case "+":
                if blankFlag || signalFlag || numberFlag || decimalPointFlag {
                    return false
                }
                signalFlag = true
            case "-":
                if blankFlag || signalFlag || numberFlag || decimalPointFlag{
                    return false
                }
                signalFlag = true
            case "e":
                if blankFlag || exponentFlag || !numberFlag{
                    return false
                }
                exponentFlag = true
                numberFlag = false
                signalFlag = false
                decimalPointFlag = false
            default:
                return false
            }
        }
        if numberFlag {
            return true
        }
        return false
    }
}

func q0065(){
    let solution = q0065Solution()
    let s = " 0.1 "
    let result = solution.isNumber(s)
    print(result)
}
