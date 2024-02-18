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
    //@Pubished for dataModels, @State for views
    
    @Published var board: [BlockState] = [] // []                    ->a state u clicked somewhere
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
        // check for winner
        checkWinner()
        // check for draw
        checkDraw()
        
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
        // MARK: Winner Circle Situation
               if (board[0] == .circle && board[1] == .circle && board[2] == .circle) {
            winner = .circle
        } else if (board[3] == .circle && board[4] == .circle && board[5] == .circle) {
            winner = .circle
        } else if (board[6] == .circle && board[7] == .circle && board[8] == .circle) {
            winner = .circle
        } else if (board[0] == .circle && board[3] == .circle && board[6] == .circle) {
            winner = .circle
        } else if (board[1] == .circle && board[4] == .circle && board[7] == .circle) {
            winner = .circle
        } else if (board[2] == .circle && board[5] == .circle && board[8] == .circle) {
            winner = .circle
        } else if (board[0] == .circle && board[4] == .circle && board[8] == .circle) {
            winner = .circle
        } else if (board[2] == .circle && board[4] == .circle && board[6] == .circle) {
            winner = .circle
            
        // MARK: Winner Cross Situation
        } else if (board[0] == .cross && board[1] == .cross && board[2] == .cross) {
            winner = .cross
        } else if (board[3] == .cross && board[4] == .cross && board[5] == .cross) {
            winner = .cross
        } else if (board[6] == .cross && board[7] == .cross && board[8] == .cross) {
            winner = .cross
        } else if (board[0] == .cross && board[3] == .cross && board[6] == .cross) {
            winner = .cross
        } else if (board[1] == .cross && board[4] == .cross && board[7] == .cross) {
            winner = .cross
        } else if (board[2] == .cross && board[5] == .cross && board[8] == .cross) {
            winner = .cross
        } else if (board[0] == .cross && board[4] == .cross && board[8] == .cross) {
            winner = .cross
        } else if (board[2] == .cross && board[4] == .cross && board[6] == .cross) {
            winner = .cross
        }
        
        // MARK: Winner No One Situation
        
    }
    
    
    func checkDraw() {
        // Loop to find if theres no more empties
        // stores draw state
        
        var draw = true  // check if current state is draw 
        //already draw
    
        // flip logic
        // [ .cross, .cross, .cross, .cross, .cross, .cross, .cross, .cross, .cross ]
        for boardItem in board {
            if (boardItem == .empty) {      // if it's empty wiill draw false
                draw = false
            }
        }
        
        // if they all not empty, go the draw = true
        if (draw) {
            winner = .noOne
        }
        // We can use .contains instead, it's shorter
       
    }
    
    
    
    
    //calculate
    //calCoins
}






















