//
//  HomeView.swift
//  TicTacToe
//
//  Created by yucian huang on 2024/2/18.

import SwiftUI


struct HomeView: View {
    
    // UI layout goes here
    // This view may contain various SwiftUI components such as VStack, HStack, Text, etc.
    
    @State private var selected: Bool = false
    @State private var selected2: Bool = false
    
    @State var navigation: NavState = .home
    
    // Access the shared data model through the environment
    @EnvironmentObject var gameBoardDM: GameBoardDataModel
    
    var body: some View {
        
        
        ZStack{
            VStack{
                
                Spacer()
                
                // MARK: Game Title
                
                Text("Welcome")
                    .font(.system(size: 28, weight:  .bold))
                    .fontDesign(.monospaced)
                    .padding(.top, 70)
                
                Text("Tic-Tac-Toe")
                    .font(.system(size: 34, weight:  .bold))
                    .fontDesign(.monospaced)
                    .padding(.top,30)
            
                
                Spacer()
                
                // MARK: Game Board
                switch navigation {
                case .home:
                    
                    Text("Select Game Mode")
                        .font(.system(size: 28, weight:  .bold))
                        .fontDesign(.monospaced)
                    
                    
                    Text("Select Your Avatar")
                        .font(.system(size: 28, weight:  .bold))
                        .fontDesign(.monospaced)
                        
                    HStack{
                        Spacer()
                        Image("cat")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .shadow(radius: 5)
                            .scaleEffect(selected ? 1.3 : 0.9)
                            .scaleEffect(selected ? 0.9 : 1.3)
                            .onTapGesture {
                                withAnimation {
                                    selected.toggle()
                                    gameBoardDM.avatar = .cat
                                    
                                }
                            }
                        Spacer()
                        Image("dog")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .shadow(radius: 5)
                            .scaleEffect(selected2 ? 1.3 : 0.9)
                            .scaleEffect(selected2 ? 0.9 : 1.3)
                            .onTapGesture {
                                withAnimation {
                                    selected2.toggle()
                                    gameBoardDM.avatar = .dog
                                }
                            }
                        Spacer()
                        
                    }
                    
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

