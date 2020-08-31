//
//  q0450.hpp
//  LeetCode
//
//  Created by NowOrNever on 31/08/2020.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#ifndef q0450_hpp
#define q0450_hpp

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
void question0450(){
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
        int maxVal = 0;
        int minVal = 0;
        void findMax(TreeNode* root){
            if (root) {
                if (root->right) {
                    return findMax(root->right);
                }
                if (maxVal < root->val) {
                    maxVal = root->val;
                }
            }
        }
        
        void findMin(TreeNode* root){
            if (root) {
                if (root->left) {
                    return findMin(root->left);
                }
                if (minVal > root->val) {
                    minVal = root->val;
                }
            }
        }

    public:
        TreeNode* deleteNode(TreeNode* root, int key) {
            if (!root) {
                return NULL;
            }
            if (root->val == key) {
                if (root->left) {
                    maxVal = root->left->val;
                    findMax(root->left);
                    root->val = maxVal;
                    root->left = deleteNode(root->left, maxVal);
                }else if (root->right){
                    minVal = root->right->val;
                    findMin(root->right);
                    root->val = minVal;
                    root->right = deleteNode(root->right, minVal);
                }else{
                    return NULL;
                }
            }else if (root->val < key){
                root->left = deleteNode(root->left, key);
            }else{
                root->right = deleteNode(root->right, key);
            }
            return root;
        }
    };
}

#endif /* q0450_hpp */
