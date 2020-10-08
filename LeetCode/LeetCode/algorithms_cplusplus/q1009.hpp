//
//  q1009.hpp
//  LeetCode
//
//  Created by NowOrNever on 08/10/2020.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#ifndef q1009_hpp
#define q1009_hpp


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
void question1009(){
    class Solution {
    public:
        int bitwiseComplement(int N) {
            int number = 1;
            while (N > number) {
                number = (number << 1) + 1;
            }
            return number ^ N;
        }
    };
}

#endif /* q1009_hpp */
