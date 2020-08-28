//
//  q1108.hpp
//  LeetCode
//
//  Created by NowOrNever on 28/08/2020.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#ifndef q1108_hpp
#define q1108_hpp

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
void question1108(){
    
    class Solution {
    public:
        string defangIPaddr(string address) {
            string result;
            for (int i = 0; i < address.size(); i++) {
                if (address[i] == '.'){
                    result += "[.]";
                }else{
                    result += address[i];
                }
            }
            return result;
        }
    };
    string address = "1.1.1.1";
    string result = Solution().defangIPaddr(address);
    cout << result << endl;
    cout << endl;
}

#endif /* q1108_hpp */
