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
    //@Pubished for models, @State for views
    
    @Published var board: [BlockState] = []  // []                   ->a state u clicked somewhere
    @Published var turn: PlayerState? // = PlayerState.cross
    @Published var winner: PlayerState? // nil
    
    // MARK: Beginging
    init() {
        newGame()
    }
    
    //MARK: New Game SetUp
    func newGame()  {
        
        // clear the board, reset the winner
        board = []
        winner = nil
        
        // creating the initial board , loop thru 9 times
        for _ in 0..<9 {
            board.append(.empty)
        }

        // let the user start the game with the random circle or cross
        
        // decides a random player to start the game
        let coinFlip = Bool.random() // gives true / false randomly
        
        if coinFlip {
            turn = .circle
        } else {
            turn = .cross
        }
    }
    
    // MARK: - Make move logic
    // Update board based on the player's turn
    
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
            
            //board[2] = .circle
            //after we draw the circle,change the turn
            turn = .cross
            
        } else if (turn == .cross) {
            
            board[forIndex] = .cross
            turn = .circle
        
        }
        checkWinner()
        // check for winner
        
        // [ 0, 0, 0,
        //   0, 0, 0,
        //   0, 0, 0 ]
                
    }
    
    func checkWinner() {
        // board
        // [ .empty, .empty, .empty,
        //   .empty, .empty, .empty,
        //   .empty, .empty, .empty]
        // board[0] == .cross & board[1] == .cross & board[2] == .cross
        /*
          Listing Winner States
         0, 1 ,2
         3, 4 ,5
         6, 7, 8
         0, 3, 6
         1, 4, 7
         2, 5, 8
         0, 4, 8
         2, 4, 6
         */
        
        // check if circle is the winner
        
        
        // MARK : Homework
        
        if (board[0] == .circle && board[1] == .circle && board[2] == .circle) {
            winner = .circle
        }
        // check if cross is the winner
    }

    //calculate
    //calCoins
}






















