//
//  q0859.hpp
//  LeetCode
//
//  Created by 李凌 on 2020/10/12.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#ifndef q0859_hpp
#define q0859_hpp

#include <iostream>
#include <queue>
#include <algorithm>
#include <vector>
#include <unordered_map>
#include <unordered_set>
#include <set>
#include <numeric>
#include <stack>
#include <string>

using namespace std;
void question0859(){
    class Solution {
    public:
        bool buddyStrings(string A, string B) {
            if (A.size() != B.size()) {
                return false;
            }
            
            int diff_count = 0;
            for (int i = 0; i < A.size(); i++) {
                if (A[i] != B[i]) {
                    diff_count++;
                }
            }
            
            if (!diff_count) {
                int records_a[26] = {0};
                for (auto c : A) {
                    records_a[c - 'a']++;
                    if (records_a[c - 'a'] > 1) {
                        return true;
                    }
                }
                return false;
            }
            
            if (diff_count != 2) {
                return false;
            }
            
            
            int records_a[26] = {0};
            for (auto c : A) {
                records_a[c - 'a']++;
            }
            for (auto c : B) {
                records_a[c - 'a']--;
            }
            
            for (int i = 0; i < 26; i++) {
                if (records_a[i]) {
                    return false;
                }
            }
            return true;
        }
    };
    
    string A = "aa";
    string B = "aa";
    bool result = Solution().buddyStrings(A, B);
    printf("result %d", result);
}

#endif /* q0859_hpp */
