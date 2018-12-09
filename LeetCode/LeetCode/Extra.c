//
//  Extra.c
//  LeetCode
//
//  Created by DoubleL on 2018/12/8.
//  Copyright © 2018 DoubleL. All rights reserved.
//

#include "Extra.h"
#include "stdlib.h"
#include "time.h"
#define DpLength 8
int maxInt(int a,int b){
    return a > b ? a : b;
}
int dpExample(){
    int a[DpLength][DpLength];
    memset(a, 0, sizeof(int) * DpLength * DpLength);
    srand((int) time(0));
    for (int i = 0; i < DpLength; i++) {
        for (int j = 0; j <= i; j++) {
            int randomNumber = rand() % 100;
            a[i][j] = randomNumber;
            printf("%-3d ",randomNumber);
        }
        printf("\n");
    }
    
    int dp[DpLength][DpLength];
    memset(dp, 0, sizeof(int) * DpLength * DpLength);
    for (int i = 0; i < DpLength ; i++) {
        dp[DpLength - 1][i] = a[DpLength - 1][i];
    }
    for (int i = DpLength - 2; i >= 0; i--) {
        for (int j = 0; j <= i; j++) {
            dp[i][j] = a[i][j] + maxInt(dp[i + 1][j], dp[i + 1][j + 1]);
        }
    }
    for (int i = 0; i < DpLength; i++) {
        for (int j = 0; j <= i; j++) {
            printf("%-3d ",dp[i][j]);
        }
        printf("\n");
    }

    return 0;
}



//You are given two eggs, and access to a 100-storey building. Both eggs are identical. The aim is to find out the highest floor from which an egg will not break when dropped out of a window from that floor. If an egg is dropped and does not break, it is undamaged and can be dropped again. However, once an egg is broken, that’s it for that egg.
//
//If an egg breaks when dropped from floor n, then it would also have broken from any floor above that. If an egg survives a fall, then it will survive any fall shorter than that.
//
//The question is: What strategy should you adopt to minimize the number egg drops it takes to find the solution?. (And what is the worst case for the number of drops it will take?)

int googleEggDropProblem(void){
    int deepLen = 15;
    int width = 10; //eggs number
    int resultMap[deepLen][width];
    memset(resultMap, 0, deepLen * width * sizeof(int));
    int powerRecord = 2;
    for (int i = 0; i < width; i++) {
        if (i) {
            for (int j = i; j < deepLen; j++) {
                if (j == i) {
                    powerRecord *= 2;
                    resultMap[j][i] = powerRecord - 1;
                }else{
                    resultMap[j][i] = resultMap[j - 1][i] + resultMap[j - 1][i - 1] + 1;
                }
            }
        }else{
            for (int j = 0; j <deepLen; j++) {
                resultMap[j][i] = j + 1;
            }
        }
    }
    
    for (int i = 0; i < deepLen; i ++) {
        for (int j = 0; j <= i && j < width; j++) {
            printf("%8d",resultMap[i][j]);
        }
        printf("\n");
    }
    return 0;
}
