//
//  q0316.hpp
//  LeetCode
//
//  Created by 李凌 on 2020/10/12.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#ifndef q0316_hpp
#define q0316_hpp

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
void question0316(){
    class Solution {
    public:
        string removeDuplicateLetters(string s) {
            string res = "";
            int last[26] = {}, seen[26] = {}, n = (int)s.size();
            for (int i = 0; i < n; i++) {
                last[s[i] - 'a'] = i;
            }
            for (int i = 0; i < n; i++) {
                if (seen[s[i] - 'a']++) continue;
                while (!res.empty() && res.back() > s[i] && i < last[res.back() - 'a']) {
                    seen[res.back() - 'a'] = 0;
                    res.pop_back();
                }
                res.push_back(s[i]);
            }
            return res;
        }
    };
}

#endif /* q0316_hpp */
