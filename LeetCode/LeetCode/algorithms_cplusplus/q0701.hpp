//
//  q0701.hpp
//  LeetCode
//
//  Created by NowOrNever on 08/10/2020.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#ifndef q0701_hpp
#define q0701_hpp

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

void question0701(){
    struct TreeNode {
        int val;
        TreeNode *left;
        TreeNode *right;
        TreeNode() : val(0), left(nullptr), right(nullptr) {}
        TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
        TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
    };
    class Solution {
    public:
        TreeNode* insertIntoBST(TreeNode* root, int val) {
            if (root) {
                if (root->val > val)
                    root->left = insertIntoBST(root->left, val);
                else
                    root->right = insertIntoBST(root->right, val);
                return root;
            }
            TreeNode *node = new TreeNode(val);
            return node;
        }
    };
}
#endif /* q0701_hpp */
