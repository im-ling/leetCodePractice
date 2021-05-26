//
//  q0134.hpp
//  LeetCode
//
//  Created by NowOrNever on 26/05/2021.
//  Copyright © 2021 DoubleL. All rights reserved.
//

#ifndef q0134_hpp
#define q0134_hpp

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
void question0134(){
    class Solution {
    public:
        int canCompleteCircuit(vector<int>& gas, vector<int>& cost) {
            int total = 0;
            int result = -1;
            int current = 0;
            for (int i = 0; i < gas.size(); i++){
                total += gas[i] - cost[i];
                current += gas[i] - cost[i];
                if (current >= 0) {
                    if (result < 0){
                        result = i;
                    }
                } else {
                    current = 0;
                    result = -1;
                }
            }
            if (total < 0){
                result = -1;
            }
            return result;
        }
    };
}

#endif /* q0134_hpp */
