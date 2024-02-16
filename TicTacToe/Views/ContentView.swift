//
//  ContentView.swift
//  TicTacToe
//
//  Created by yucian huang on 2024/1/26.
//
import SwiftUI
struct ContentView: View {
    @State var showModel = false   // set my state
    @EnvironmentObject var gameBoardDM: GameBoardDataModel
    var gridBlockSize: CGFloat = 60
    var blockSpacing: CGFloat = 4
    //source
//    var firendList = [
//        Friend(name: "22"),
//        Friend(name: "23"),
//        Friend(name: "47")
//    ]
//    var title = "example"
    // friendsList[1] = Friend(name: "30"),
    // title = "33"
    // Here for changing the UI, data u need to change at the source
//    var body: some View {
//        ForEach(firendList) { friend in
//            HStack {
//                Image(systemName: "person")
//                Text("friend.name")
//            }
//        }
//    }
    var body: some View {
        ZStack{
            VStack{
                
                Spacer()
                
                // MARK: Game Tietle
                Text("Tic-Tac-Toe")
                    .font(.system(size: 34, weight:  .bold))
                    .fontDesign(.monospaced)
//                    .padding(.bottom, 70)
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
                                            .foregroundColor(.green)
                                            .frame(width: gridBlockSize - 5, height: gridBlockSize - 5)
                                    }
                                }
                                //runs on clicking this block
                                .onTapGesture {
                                    
                                    //detector
                                    //change the turn
                                    //put the logic function we need inside gmbdDM
                                    
                                    gameBoardDM.makeMove(forIndex: rowIndex*3 + columnIndex)
    
                                    //                                if (gameBoardDM.turn == .circle) {
                                    //
                                    //                                    gameBoardDM.board[rowIndex*3 + columnIndex] = .circle
                                    //
                                    //                                } else if (gameBoardDM.turn == .cross) {
                                    //
                                    //                                    gameBoardDM.board[rowIndex*3 + columnIndex] = .cross
                                    //
                                    //                                }
                                }
                                
                            }
                            
                        }
                    }
                }
                Spacer()
                Spacer()
            }
            
            // MARK: Show Game Result Module
            if gameBoardDM.winner == .circle {
                GameResultView()
            } else if gameBoardDM.winner == .cross {
                GameResultViewCross()
            }
        }
    }
    
}
    #Preview {
        ContentView().environmentObject(GameBoardDataModel())
    }










