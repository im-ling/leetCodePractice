//
//  q0468.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 16/06/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//468. Validate IP Address
//Medium
//
//230
//
//1195
//
//Add to List
//
//Share
//Write a function to check whether an input string is a valid IPv4 address or IPv6 address or neither.
//
//IPv4 addresses are canonically represented in dot-decimal notation, which consists of four decimal numbers, each ranging from 0 to 255, separated by dots ("."), e.g.,172.16.254.1;
//
//Besides, leading zeros in the IPv4 is invalid. For example, the address 172.16.254.01 is invalid.
//
//IPv6 addresses are represented as eight groups of four hexadecimal digits, each group representing 16 bits. The groups are separated by colons (":"). For example, the address 2001:0db8:85a3:0000:0000:8a2e:0370:7334 is a valid one. Also, we could omit some leading zeros among four hexadecimal digits and some low-case characters in the address to upper-case ones, so 2001:db8:85a3:0:0:8A2E:0370:7334 is also a valid IPv6 address(Omit leading zeros and using upper cases).
//
//However, we don't replace a consecutive group of zero value with a single empty group using two consecutive colons (::) to pursue simplicity. For example, 2001:0db8:85a3::8A2E:0370:7334 is an invalid IPv6 address.
//
//Besides, extra leading zeros in the IPv6 is also invalid. For example, the address 02001:0db8:85a3:0000:0000:8a2e:0370:7334 is invalid.
//
//Note: You may assume there is no extra space or special characters in the input string.
//
//Example 1:
//Input: "172.16.254.1"
//
//Output: "IPv4"
//
//Explanation: This is a valid IPv4 address, return "IPv4".
//Example 2:
//Input: "2001:0db8:85a3:0:0:8A2E:0370:7334"
//
//Output: "IPv6"
//
//Explanation: This is a valid IPv6 address, return "IPv6".
//Example 3:
//Input: "256.256.256.256"
//
//Output: "Neither"
//
//Explanation: This is neither a IPv4 address nor a IPv6 address.
//Accepted
//48,168
//Submissions
//213,837

class q0468Solution {
    func matches(for regex: String, in text: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text,
                                        range: NSRange(text.startIndex..., in: text))
            return results.map {
                String(text[Range($0.range, in: text)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
    
    func validIPAddress(_ IP: String) -> String {
        let neither = "Neither"
        if IP.count > 39 {
            return neither
        }
        let ipv6 = "IPv6"
        let ipv4 = "IPv4"
        // 非(0-9 . : a-f A-F )字符退出
        let matchedOtherChar = matches(for: ".*[^0-9a-fA-F.:]+.*", in: IP)
        if matchedOtherChar.count > 0 {
            return neither
        }
        let matchedIpv4 = matches(for: ".*\\..*", in: IP)
        let matchedIpv6 = matches(for: ".*\\:.*", in: IP)
        // 没有ipv4分割线，或者没有ipv6分割线，或者两者都有
        if (matchedIpv4.count > 0 && matchedIpv6.count > 0) || (matchedIpv4.count == 0 && matchedIpv6.count == 0){
            return neither
        }
        if matchedIpv4.count > 0 {
            // 非0-9 . 的字符，退出
            var matched = matches(for: ".*[^0-9\\.].*", in: IP)
            if matched.count > 0 {
                return neither
            }
            matched = matches(for: "0[0-9]+.*|.*\\.0[0-9]+.*|.*\\.\\..*|^\\..*|.*\\.$", in: IP)
            if matched.count > 0 {
                return neither
            }
            let numbers = IP.split(separator: ".")
            if numbers.count != 4 {
                return neither
            }
            for number in numbers {
                if Int(String(number)) ?? 256 > 255 {
                    return neither
                }
            }
            return ipv4
        }
        if matchedIpv6.count > 0 {
            if matches(for: ".*\\:\\:.*|^\\:.*|.*\\:$", in: IP).count > 0 {
                return neither
            }
            let numbers = IP.split(separator: ":")
            if numbers.count != 8 {
                return neither
            }
            for number in numbers {
                if number.count > 4 || number.count == 0 {
                    return neither
                }
            }
            return ipv6
        }
        return neither
    }
}

func q0468(){
    let ip = "172.16.254.1"
    let solu = q0468Solution()
    let result = solu.validIPAddress(ip)
    print(result)
}
