//
//  GameBoardDataModel.swift
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
    
   @Published var board: [BlockState] = []  // []
    @Published var turn = PlayerState.circle
    
    
    
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
    
    
    //calculate
    //calCoins
}
