//
//  SelectGameModeView.swift
//  TicTacToe
//
//  Created by yucian huang on 2024/2/22.
//

import SwiftUI

struct SelectGameModeView: View {
    
    @State var selectionGame: String = "Game Mode"
    @EnvironmentObject var gameBoardDM: GameBoardDataModel

    @State var selection: String = "2 Players"
    
    let filterOptions: [String] = [
        "2 Player", "AI robot", "Annonymous"

    ]
    
    let myModuleDimension: CGFloat = 250
    var body: some View {
        
        ZStack{
            Color(.black)
                .opacity(0.9)
                .ignoresSafeArea()
            
            VStack{
                HStack{
                    
                    //MARK: Dropdown Menu
                    VStack {
                        
                        Picker(
                            selection: $selectionGame,
                            label: 
                                
                                HStack{
                                    Text("Game Picker: ")
                                    Text(selection)
                                }
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .padding(.horizontal)
                                .background(Color.blue)
                                .cornerRadius(10)
                                .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0, y: 10)
                            
                            
                            ,content: {
                                ForEach(filterOptions, id: \.self) { option in
                                    Text(option)
                                        .tag(option)
                                }
                            })
                        
                        .pickerStyle(WheelPickerStyle())
                       
                    }
                }
                
                Button {
                    
                } label: {
                    Text("GO")
                        .onTapGesture {
                            
//                            NavigationLink(destination: HomeView()) {
//                                Text("Navigation to home")
//                            }
                        }
                }
            }
            
            
            .frame(width: myModuleDimension, height: myModuleDimension)
            .background(.white)
            .font(.system(size: 22, weight: .bold))
            .cornerRadius(20)
        }
    }
}



#Preview {
    SelectGameModeView().environmentObject(GameBoardDataModel())
}
