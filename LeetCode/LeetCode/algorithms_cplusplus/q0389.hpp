//
//  q0389.hpp
//  LeetCode
//
//  Created by 李凌 on 2020/10/10.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#ifndef q0389_hpp
#define q0389_hpp

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
void question0389(){
    class Solution {
    public:
        char findTheDifference(string s, string t) {
            unordered_map<char, int> map;
            for (auto c : t) {
                if (map.find(c) == map.end()) {
                    map[c] = 1;
                }else{
                    map[c]++;
                }
            }
            for (auto c : s) {
                map[c]--;
                if (map[c] == 0) {
                    map.erase(c);
                }
            }
            for (auto item : map) {
                return item.first;
            }
            return '\0';
        }
    };
}
#endif /* q0389_hpp */
