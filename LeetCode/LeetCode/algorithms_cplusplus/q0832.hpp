//
//  q0832.hpp
//  LeetCode
//
//  Created by 李凌 on 2020/11/11.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#ifndef q0832_hpp
#define q0832_hpp

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

void question0832(){
    class Solution {
    public:
        vector<vector<int>> flipAndInvertImage(vector<vector<int>>& A) {
            vector<vector<int>> result;
            for (int i = 0; i < A.size(); i++) {
                vector<int> newline;
                vector<int> line = A[i];
                for (int j = (int)line.size() - 1; j >= 0; j--) {
                    newline.push_back(line[j] ^ 1);
                }
                result.push_back(newline);
            }
            return result;
        }
    };
}

#endif /* q0832_hpp */
