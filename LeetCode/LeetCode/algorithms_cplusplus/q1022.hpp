//
//  q1022.hpp
//  LeetCode
//
//  Created by NowOrNever on 09/09/2020.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#ifndef q1022_hpp
#define q1022_hpp

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

void question1022(){
    struct TreeNode {
        int val;
        TreeNode *left;
        TreeNode *right;
        TreeNode() : val(0), left(nullptr), right(nullptr) {}
        TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
        TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
    };
    class Solution {
    private:
        int sum = 0;
        void sumRootToLeaf(TreeNode* root, int lastNumber) {
            if (root) {
                lastNumber = (lastNumber << 1) + root->val;
                if (root->left || root->right) {
                    sumRootToLeaf(root->left, lastNumber);
                    sumRootToLeaf(root->right, lastNumber);
                }else{
                    sum += lastNumber;
                }
            }
        }
    public:
        int sumRootToLeaf(TreeNode* root) {
            sum = 0;
            sumRootToLeaf(root, 0);
            return sum;
        }
    };
}

#endif /* q1022_hpp */
