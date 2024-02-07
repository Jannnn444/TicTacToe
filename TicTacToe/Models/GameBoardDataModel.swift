//
//  GameBoardDataModel.swift  //manage all the data we need
//  TicTacToe
//
//  Created by yucian huang on 2024/1/31.
//
import SwiftUI



class GameBoardDataModel: ObservableObject {
    // array to represent the grid blocks on aa tictactoe gtid
    
    // [ 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
    // where 0 - empty
    
    //@Pubished for models, State for views
    
    @Published var board: [BlockState] = []  // []                   ->a state u clicked somewhere
    @Published var turn = PlayerState.cross

    
    
    // MARK: Beginging
    init() {
        newGame()
    }
    
    //MARK: New Game SetUp
    func newGame()  {
        
        // creating the initial board , loop thru 9 times
        for _ in 0..<9 {
            board.append(.empty)
        }
       
    }
    
    //MARK: - Make a move on a player's turn
    
    func makeMove(forIndex: Int) {
        // check if board index is occupied
        
        if board[forIndex] != .empty {  
        // we stop the function
            return
        }
        
        //on circle's turn
        if (turn == .circle) {
            //draw the circle
            board[forIndex] = .circle 
            //after we draw the circle,change the turn
            turn = .cross
            
            
        } else if (turn == .cross) {
            
            board[forIndex] = .cross
            turn = .circle
            
        }
    }
   
    
    //calculate
    //calCoins
}



