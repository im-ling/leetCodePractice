//
//  q0130.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 17/06/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//130. Surrounded Regions
//Medium
//
//1503
//
//621
//
//Add to List
//
//Share
//Given a 2D board containing 'X' and 'O' (the letter O), capture all regions surrounded by 'X'.
//
//A region is captured by flipping all 'O's into 'X's in that surrounded region.
//
//Example:
//
//X X X X
//X O O X
//X X O X
//X O X X
//After running your function, the board should be:
//
//X X X X
//X X X X
//X X X X
//X O X X
//Explanation:
//
//Surrounded regions shouldn’t be on the border, which means that any 'O' on the border of the board are not flipped to 'X'. Any 'O' that is not on the border and it is not connected to an 'O' on the border will be flipped to 'X'. Two cells are connected if they are adjacent cells connected horizontally or vertically.
//
//Accepted
//210,511
//Submissions
//791,197


class q0130Solution {
    func visit(_ board: inout [[Character]], x: Int, y: Int){
        if x < 0 || x >= board.count || y < 0 || y >= board[0].count || board[x][y] != "O"{
            return
        }
        board[x][y] = "Q"
        visit(&board, x: x - 1, y: y)
        visit(&board, x: x + 1, y: y)
        visit(&board, x: x, y: y - 1)
        visit(&board, x: x, y: y + 1)
    }
    func solve(_ board: inout [[Character]]) {
        if board.count < 1 {
            return
        }
        let xMax = board.count
        let yMax = board[0].count
        for i in 0..<yMax {
            visit(&board, x: 0, y: i)
            visit(&board, x: xMax - 1, y: i)
        }
        for i in 0..<xMax {
            visit(&board, x: i, y: 0)
            visit(&board, x: i, y: yMax - 1)
        }
        
        for i in 0..<xMax {
            for j in 0..<yMax {
                if board[i][j] == "Q" {
                    board[i][j] = "O"
                }else if board[i][j] == "O" {
                    board[i][j] = "X"
                }
            }
        }
    }
}

func q0130(){
    var board:[[Character]] = []
    let solu = q0130Solution()
    solu.solve(&board)
    print(board)
}
