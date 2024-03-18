//
//  LeaderListView.swift
//  TicTacToe
//
//  Created by yucian huang on 2024/3/14.
//

import SwiftUI


struct LeaderEntryListView: View {
    
    let leaderEntrydata: LeaderEntry
    
    @EnvironmentObject var gameBoardDM: GameBoardDataModel
    var winnersLists: [String] = []
    
    
    var body: some View {
        
        VStack{
            HStack{
                
                Text("Winners List")
                    .font(.title)
                ForEach(winnersLists, id: \.self) { winner in
                    
                    Text(winner)
                }
            }
            .padding()
            
                
                     }
        }
      
        
        
    }
    

