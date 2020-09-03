//
//  q0459.hpp
//  LeetCode
//
//  Created by NowOrNever on 03/09/2020.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#ifndef q0459_hpp
#define q0459_hpp

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
void question0459(){
    class Solution {
    private:
        bool isVaildNumber(string s, int len, int times){
            for (int i = 0; i < len; i++) {
                for (int j = 1; j < times; j++) {
                    if (s[i] != s[j * len + i]) {
                        return false;
                    }
                }
            }
            return true;
        }
    public:
        bool repeatedSubstringPattern(string s) {
            int length = (int)s.size();
            vector<bool> flags(length + 1, true);
            for (int i = 2; i <= length; i++) {
                if (flags[i]){
                    if (length % i == 0 && isVaildNumber(s, length / i, i)) {
                        return true;
                    }
                    for (int j = 2; j * i <= length; j++) {
                        flags[i * j] = false;
                    }
                }
            }
            return false;
        }
    };
    bool result = Solution().repeatedSubstringPattern("ababababab");
    cout << result << endl;
}

#endif /* q0459_hpp */
