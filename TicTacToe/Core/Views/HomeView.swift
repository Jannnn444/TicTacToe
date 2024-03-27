//
//  HomeView.swift
//  TicTacToe
//
//  Created by yucian huang on 2024/2/18.

import SwiftUI
import SwiftData


struct HomeView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    // UI layout goes here
    // This view contains various SwiftUI components such as VStack, HStack, Text, etc.
    
    @State private var selectedCat: Bool = false
    @State private var selectedDog: Bool = false
    @State private var selectionGame = false
    
    @State var navigation: NavState = .home
    
    //  @State var username = ""  -> use the username from dataModel instead
    
    @State var joinGameMessage = "Set your game settings."
    @State private var showAlert = false
    
    @State var selection: String = "Easy"
    let filterOptions: [String] = ["Easy Cake", "Difficult Boss", "Random Tea", "Practice Mode"]
    
    //["2 Player", "AI robot", "Annonymous"]
    
    // Access the shared data model through the environment
    @EnvironmentObject var gameBoardDM: GameBoardDataModel
    
    var body: some View {
        
        ZStack{
            VStack{
                
                // MARK: Greetings
                
                Text("Welcome")
                    .font(.system(size: 25, weight: .regular))
                    .fontDesign(.monospaced)
                    .padding(.top, 10)
                
                Text("Tic-Tac-Toe")
                    .font(.system(size: 34, weight: .bold))
                    .fontDesign(.monospaced)
                    .padding(.top, 5)
                    .padding(.bottom, 70)
                
                Spacer()
                
                // MARK: Page Navigation
                switch navigation {
                    
                case .home:
    
                        VStack {
                            
                            // MARK: Name TextField
                            
                            Text("1.Type Your Name")
                                .font(.system(size: 25, weight:  .regular))
                                .fontDesign(.monospaced)
 
                            TextField(" Enter name here", text: $gameBoardDM.username)
                                .textFieldStyle(.roundedBorder)
                                .font(.headline)
                                .padding(.bottom, 10)
                                .frame(width: 200, height: 100, alignment: .center)
                            
                            // MARK: Avatar
                            Text("2.Select Your Avatar")
                                .font(.system(size: 25, weight:  .regular))
                                .fontDesign(.monospaced)
                            
                            
                            HStack{
                                Spacer()
                                Image("cat")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                    .shadow(radius: 5)
                                    .scaleEffect(selectedCat ? 1.2 : 0.9)
                                //                                    .scaleEffect(selected ? 0.9 : 1.3)
                                    .onTapGesture {
                                        withAnimation {
                                            selectedCat = true
                                            selectedDog = false
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
                                    .scaleEffect(selectedDog ? 1.2 : 0.9)
                                //                                    .scaleEffect(selected2 ? 0.9 : 1.3)
                                    .onTapGesture {
                                        withAnimation {
                                            selectedDog = true
                                            selectedCat = false
                                            gameBoardDM.avatar = .dog
                                            selectionGame = true
                                        }
                                    }
                                Spacer()
                                
                            }
                            
                            // MARK: Game Mode
                            // when tap on avatar, the selectGame mode = true, pop the picker
                            Text("3.Select Game Mode")
                                .font(.system(size: 25, weight:  .regular))
                                .fontDesign(.monospaced)
                                .padding(.top, 20)
                            
                            ZStack {
                                Spacer()
                                
                                //MARK: Picker- Game Level
                                if selectionGame {
                                    Picker(
                                        selection: $selectionGame,
                                        label:
                                            Text(selection)
                                        ,content: {
                                            ForEach(filterOptions, id: \.self) { option in
                                                Text(option)
                                                    .tag(option)
                                            }
                                        })
                                    .pickerStyle(WheelPickerStyle())
                                    // .animation( .easeOut )
                                    .menuActionDismissBehavior(.automatic)
                                    .onTapGesture {
                                        joinGameMessage = "Press for Join!"
                                        navigation = .game
                                    }
                                }
                            }
                            
                            // MARK: Loading Message
                            
                            if gameBoardDM.username == "" {
                                Text("Loading...")
                                Text(joinGameMessage)
                                
                            } else if !gameBoardDM.username.isEmpty  {
                                
                                Text("hi \(gameBoardDM.username) ")
                                Text("Join TicTacToe World Cup")
                                    .fontDesign(.monospaced)
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

                case .game:
                    GameView()
                    
                case .leaderboard:
                    LeaderboardView()
                    
                    // MARK: Leaderboard
                    Button {
                        selectionGame.toggle()
                    } label: {
                        Label("home", systemImage: "arcade.stick")
                            .frame(width: 100, height: 30, alignment: .center)
                            .padding(5)
                            .font(.headline)
                        
                            .onTapGesture {
                                navigation = .home
                                gameBoardDM.username = ""
                                selectedCat = false
                                selectedDog = false
                                selectionGame = false
                            }
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
            
            if gameBoardDM.winner == .circle {
                GameResultView()
                
            } else if gameBoardDM.winner == .cross {
                GameResultViewCross()
                
            } else if gameBoardDM.winner == .noOne  {
                GameResultViewNoOneWon()
            }
        }
    }
    
}



#Preview {
    HomeView().environmentObject(GameBoardDataModel())
}
