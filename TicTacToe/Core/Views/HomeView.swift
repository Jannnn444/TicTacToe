//
//  HomeView.swift
//  TicTacToe
//
//  Created by yucian huang on 2024/2/18.

import SwiftUI

struct HomeView: View {
    
    // UI layout goes here
    // This view may contain various SwiftUI components such as VStack, HStack, Text, etc.
    
    @State var navigation: NavState = .home
    
    // Access the shared data model through the environment
    @EnvironmentObject var gameBoardDM: GameBoardDataModel
    
    var body: some View {
        ZStack{
            VStack{
                
                Spacer()
                
                // MARK: Game Title
                Text("Tic-Tac-Toe")
                    .font(.system(size: 34, weight:  .bold))
                    .fontDesign(.monospaced)
                    .padding(.top, 70)
                
                Spacer()
                
                // MARK: Game Board
                switch navigation {
                case .home:
                    Text("home")
                case .game:
                    GameView()
                case .leaderboard:
                    Text("this is leaderboard")
                }
                
                Spacer()
                
                // MARK: Navigation Menu
                NavigationView(navigation: $navigation)  //$ this means this state been read & changable
            }
            
            // MARK: Show Game Result Module on ZStack
            // The data modal variable.winner `winner` can be used to conditionally present a modal view
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
    HomeView() .environmentObject(GameBoardDataModel())
}

