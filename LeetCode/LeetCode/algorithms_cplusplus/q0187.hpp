//
//  q0187.hpp
//  LeetCode
//
//  Created by 李凌 on 2020/10/18.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#ifndef q0187_hpp
#define q0187_hpp

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
void question0187(){
    class Solution {
    public:
        vector<string> findRepeatedDnaSequences(string s) {
            unordered_map<string, int> key_map;
            string key_str = "";
            for (auto c : s) {
                if (key_str.size() >= 10) {
                    key_str.erase(0, 1);
                }
                key_str += c;
                if (key_map.find(key_str) == key_map.end()) {
                    key_map[key_str] = 1;
                }else{
                    key_map[key_str]++;
                }
            }
            vector<string> result;
            for (auto pair : key_map) {
                if (pair.second > 1) {
                    result.push_back(pair.first);
                }
            }
            return result;
        }
    };
}

#endif /* q0187_hpp */
