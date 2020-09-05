//
//  q0763.hpp
//  LeetCode
//
//  Created by NowOrNever on 05/09/2020.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#ifndef q0763_hpp
#define q0763_hpp

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

void question0763(){
    class Solution {
    public:
        vector<int> partitionLabels(string S) {
            int size = (int) S.size();
            unordered_map<char, int> end_map;
            for (int i = size - 1; i >= 0; i--) {
                if (end_map.find(S[i]) == end_map.end()) {
                    end_map[S[i]] = i;
                }
            }
            vector<int> result;
            int count = 0;
            unordered_map<char, int> current_map;
            for (int i = 0; i < size; i++) {
                count++;
                current_map[S[i]] = i;
                if (current_map[S[i]] == end_map[S[i]]) {
                    current_map.erase(S[i]);
                }
                if (!current_map.size()) {
                    result.push_back(count);
                    count = 0;
                }
            }
            return result;
        }
    };
}

#endif /* q0763_hpp */
