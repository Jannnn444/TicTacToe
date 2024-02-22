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
    @State private var selectionGame = false
    
    @State var navigation: NavState = .home
    
//  @State var username = ""  -> use the username from dataModel instead
    
    @State var joinGameMessage = "Set your game settings."
    @State private var showAlert = false
    
    @State var selection: String = "Easy"
    let filterOptions: [String] = ["Easy", "Difficult", "Random"]
    
    //["2 Player", "AI robot", "Annonymous"]
    
    // Access the shared data model through the environment
    @EnvironmentObject var gameBoardDM: GameBoardDataModel
    
    var body: some View {
        
        ZStack{
            VStack{
                
                Spacer()
                
                // MARK: Game Greetings
                
                Text("Welcome")
                    .font(.system(size: 28, weight:  .bold))
                    .fontDesign(.monospaced)
                    .padding(.top, 70)
                
                Text("Tic-Tac-Toe")
                    .font(.system(size: 34, weight:  .bold))
                    .fontDesign(.monospaced)
                    .padding(.top, 10)
                
                
               
                Spacer()
                Spacer()
                Spacer()
                
                
                // MARK: Game Board
                switch navigation {
                    
                case .home:
                    
                    VStack{
                        ZStack {
                            
                            if selectionGame {
                                //MARK: Choose Game Level
                                
                                Picker(
                                    selection: $selectionGame,
                                    label:
                                        Text(selection)
                                    ,content: {
                                        ForEach(filterOptions, id: \.self) { option in
                                            Text(option)
                                                .tag(option)
                                        }
                                    }
                                    
                                )
                                
                                .pickerStyle(WheelPickerStyle())
                                //                            .animation( .easeOut )
                                .menuActionDismissBehavior(.automatic)
                                .onTapGesture {
                                    selectionGame = false
                                    joinGameMessage = "Press for Join!"
                                }
                            }
                            
                        }
                        
                        // MARK: Select Avatars
                        VStack {
                            
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
                                            selectionGame = true
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
                                            selectionGame = true
                                        }
                                    }
                                Spacer()
                                
                            }
                            
                            // MARK: Loading/Join Game Button + NameUpdate
                            
                            TextField(" Enter your name", text: $gameBoardDM.username)
                                .textFieldStyle(.roundedBorder)
                                .font(.headline)
                                .padding(.horizontal)
                                .frame(width: 200, height: 100, alignment: .center)
                            
                            if gameBoardDM.username == "" {
                                Text("Loading...")
                                Text(joinGameMessage)
                                
                            } else if !gameBoardDM.username.isEmpty  {
                                
                                Text("hi \(gameBoardDM.username) ")
                                Text(joinGameMessage)
                                
                                    .onTapGesture {
                                        showAlert = true
                                    }
                                    .alert(isPresented: $showAlert) {
                                        Alert(
                                            title: Text("Current Settings Not Available"),
                                            message: Text("Your current Settings can’t be " +
                                                          "determined at this time." + " \(gameBoardDM.username) please make sure you selected your Avatar before join game.")
                            
                                        )
                                    }
                            }
                            
                        }
                       
                        
                    }
                case .game:
                    GameView()
                    
                case .leaderboard:
                    Text("this is leaderboard")
                    
                    
                    // MARK: Leaderboard Sharing Scores
                    Button {
                        selectionGame.toggle()
                    } label: {
                        Label("home", systemImage: "arcade.stick")
                            .frame(width: 100, height: 30, alignment: .center)
                            .padding(5)
                            .font(.headline)
                        
                    }
                    .buttonStyle(.borderedProminent)
                    .frame(width: 100, height: 30, alignment: .center)
                    .cornerRadius(20)
                    .tint(.yellow)
                    
                }
                
                
                    Spacer()
                
                
                    // MARK: Navigation Menu
                    NavigationView(navigationState: $navigation)
                    .colorMultiply(.black)
                    .fontDesign(.rounded)
                    //$ this means this state been read & changable
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
                
                
                
                // mark: show SelectGameMode Module on ZStack
                //            if selectionGame {
                //                SelectGameModeView()
                //            }
                
                
                
            }
        }
        
    }




#Preview {
    HomeView().environmentObject(GameBoardDataModel())
}
