//
//  ContentView.swift
//  TicTacToe
//
//  Created by yucian huang on 2024/1/26.
//

import SwiftUI

struct ContentView: View {
    @State var showModel = false   // set my state
    
    var body: some View {
        
        ZStack{
            
            VStack{
                // MARK: Game Tietle
                Text("Tic-Tac-Toe")
                    .font(.system(size: 28, weight:  .medium))
                    .padding(.bottom, 22)
                
                Spacer()
                
                // MARK: Game Board
                Text("Game Board")
                
                Button {
                    
                    //action
                    showModel = true
                    
                } label: {
                    Text("Click Meow")
                        .frame(width:170, height: 50)
                        .cornerRadius(12)
                        .background(.pink)
                        .padding(20)
                        
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
