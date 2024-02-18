//
//  ContentView.swift
//  TicTacToe
//
//  Created by yucian huang on 2024/1/26.
//
import SwiftUI
struct ContentView: View {
    
    // Define a state variable to control the visibility of a modal view
    @State var showModel = false   // set my state
    
    // Access the shared data model through the environment
    @EnvironmentObject var gameBoardDM: GameBoardDataModel
    
    // Define constants for the size of grid blocks and the spacing between blocks
    var gridBlockSize: CGFloat = 80
    var blockSpacing: CGFloat = 5
   
    var body: some View {
        
        // Your UI layout goes here
        // This view may contain various SwiftUI components such as VStack, HStack, Text, etc.
        // The @State variable `showModel` can be used to conditionally present a modal view
        
        ZStack{
            VStack{
                
                Spacer()
                
                // MARK: Game Title
                Text("Tic-Tac-Toe")
                    .font(.system(size: 34, weight:  .bold))
                    .fontDesign(.monospaced)
                    .padding(.top, 70)
                
                Spacer()
                if gameBoardDM.turn == .circle {
                    Text("Player O")
                        .font(.system(size: 28, weight: .medium))
                        .fontDesign(.monospaced)
                } else {
                    Text("Player X")
                        .font(.system(size: 28, weight: .medium))
                        .fontDesign(.monospaced)
                }
                // MARK: Game Board
                
                Grid(horizontalSpacing: blockSpacing, verticalSpacing: blockSpacing) {
                    
                    //loop down
                    ForEach(0..<3, id: \.self) { rowIndex in
                        GridRow {
                            //loop right
                            ForEach(0..<3, id: \.self) { columnIndex in   //print every 9
                                // Block Background
                                // we var the grid as variable
                          
                                ZStack{
                                    
                                    Color(.systemPink)
                                        .frame(width: gridBlockSize, height: gridBlockSize)
  
                                    //gameBoardDM.board - [BlockState.empty...]
                                    //gameBoard.title = "Circle"
                                    //[BlockState.empty, BlockState.empty, 3, 4, 5]
                                    // grid row 0, 1, 2 *3
                                    // col row 0, 1, 2  (from left to right)
                                    
                                    // check the correspomding index equals cross to a certain
                                    // BlockState
                                    
                                    if (gameBoardDM.board[rowIndex*3 + columnIndex] == BlockState.circle)
                                        
                                        
                                    {  Image(systemName: "circle")
                                            .resizable()
                                            .foregroundColor(.blue)
                                            .frame(width: gridBlockSize - 5, height: gridBlockSize - 5)
                                    }
                                    
                                    else if (gameBoardDM.board[rowIndex*3 + columnIndex] == BlockState.cross)
                                                
                                    {  Image(systemName: "xmark")   //createImage here
                                            .resizable()
                                            .foregroundColor(.yellow)
                                            .frame(width: gridBlockSize - 5, height: gridBlockSize - 5)
                                    }
                                }
                                //runs on clicking this block
                                .onTapGesture {
                                    
                                    //detector
                                    //change the turn
                                    //put the logic function we need inside gmbdDM
                                    
                                    gameBoardDM.makeMove(forIndex: rowIndex*3 + columnIndex)
                                }
                            }
                        }
                    }
                }
                Spacer()
                Spacer()
            }
            
            // MARK: Show Game Result Module on ZStack
            if gameBoardDM.winner == .circle {
                GameResultView()
            } else if gameBoardDM.winner == .cross {
                GameResultViewCross()
            } else if gameBoardDM.winner == PlayerState.noOne  {
                GameResultViewNoOneWon()
            }
        }
    }
    
}
    #Preview {
        ContentView().environmentObject(GameBoardDataModel())
    }










