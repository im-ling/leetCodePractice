//
//  q1476.hpp
//  LeetCode
//
//  Created by NowOrNever on 28/08/2020.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#ifndef q1476_hpp
#define q1476_hpp
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

void question1476(){
    class SubrectangleQueries {
    private:
        vector<vector<int>> rect;
    public:
        SubrectangleQueries(vector<vector<int>>& rectangle) {
            rect = rectangle;
        }

        void updateSubrectangle(int row1, int col1, int row2, int col2, int newValue) {
            for (int i = row1; i <= row2; i++) {
                for (int j = col1; j <= col2; j++) {
                    rect[i][j] = newValue;
                }
            }
        }

        int getValue(int row, int col) {
            return rect[row][col];
        }
    };

    //    Your SubrectangleQueries object will be instantiated and called as such:
    vector<vector<int>> rectangle = {{1,2,1},{4,3,4},{3,2,1},{1,1,1}};
    SubrectangleQueries* obj = new SubrectangleQueries(rectangle);
    cout << obj->getValue(0, 2) << endl;
    obj->updateSubrectangle(0, 0, 3, 2, 5);
    cout << obj->getValue(0, 2) << endl;
    cout << obj->getValue(3, 1) << endl;
    obj->updateSubrectangle(3, 0, 3, 2, 10);
    cout << obj->getValue(3, 1) << endl;
    cout << obj->getValue(0, 2) << endl;
    cout << endl;
}

#endif /* q1476_hpp */
