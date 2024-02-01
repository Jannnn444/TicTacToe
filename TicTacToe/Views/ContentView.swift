//
//  ContentView.swift
//  TicTacToe
//
//  Created by yucian huang on 2024/1/26.
//

import SwiftUI

struct ContentView: View {
    
    
    
    @State var showModel = false   // set my state
    @StateObject var gameBoardDM = GameBoardDataModel()
    
    init() {
        print(gameBoardDM.board)
    }
    
    var body: some View {
        
        ZStack{
            
            VStack{
                // MARK: Game Tietle
                Text("Tic-Tac-Toe")
                    .font(.system(size: 28, weight:  .medium))
                    .padding(.bottom, 22)
                
                Spacer()
                
                // MARK: Game Board
                ForEach(gameBoardDM.board, id: \.self) { block in
                    Color(.systemPink)
                        .frame(width: 80, height: 80)
                }
                
                Spacer()
            }
            
            // Game Result Modal
            
            if (showModel == true) {
                GameResultView()
            }
            
        }
        
    }
    }


#Preview {
    ContentView()
}
