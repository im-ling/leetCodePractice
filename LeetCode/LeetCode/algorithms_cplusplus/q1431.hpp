//
//  q1431.hpp
//  LeetCode
//
//  Created by NowOrNever on 28/08/2020.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#ifndef q1431_hpp
#define q1431_hpp

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
void question1431(){
    class Solution {
    public:
        vector<bool> kidsWithCandies(vector<int>& candies, int extraCandies) {
            vector<bool> result;
            int maxVal = candies[0];
            for (int i = 0; i < candies.size(); i++) {
                if (maxVal < candies[i]){
                    maxVal = candies[i];
                }
            }
            maxVal -= extraCandies;
            for (int i = 0; i < candies.size(); i++) {
                if (candies[i] >= maxVal) {
                    result.push_back(true);
                }else{
                    result.push_back(false);
                }
            }
            return result;
        }
    };
    
    vector<int> candies = {2,3,5,1,3};
    int extraCandies = 3;
    vector<bool> result = Solution().kidsWithCandies(candies, extraCandies);
    for (int i = 0; i < result.size(); i++) {
        cout << result[i] << ' ';
    }
    cout << endl;
}
#endif /* q1431_hpp */
