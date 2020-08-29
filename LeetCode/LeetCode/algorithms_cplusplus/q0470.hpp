//
//  q0470.hpp
//  LeetCode
//
//  Created by NowOrNever on 28/08/2020.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#ifndef q0470_hpp
#define q0470_hpp

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
static int rand7(){
    return rand() % 7 + 1;
}
void question0470(){
    class Solution {
    public:
        int rand10() {
            int randow_number = (rand7() * 7 + rand7()) * 7 + rand7();
            while (randow_number < 60) {
                randow_number = (rand7() * 7 + rand7()) * 7 + rand7();
            }
            return randow_number % 10 + 1;
        }
        int rand10_2() {
            int randow_number = rand7();
            int result = 0;
            while (randow_number == 4) {
                randow_number = rand7();
            }
            if (randow_number > 4) {
                result = 5;
            }
            do {
                randow_number = rand7() % 7;
            } while (randow_number > 4);
            result += randow_number + 1;
            return result;
        }
    };
    cout << endl;
}

#endif /* q0470_hpp */
