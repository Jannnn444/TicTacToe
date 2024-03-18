//
//  LeaderDetailView.swift
//  TicTacToe
//
//  Created by yucian huang on 2024/3/14.
//

import SwiftUI


struct LeaderEntryDetailView: View {
    
    let detailLeaderEntry: LeaderEntry
    
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                HStack{
                    Text(detailLeaderEntry.date, style: .date)
                        .bold()
                    Text("-")
                    Text(String(repeating: "⭐️", count: Int(detailLeaderEntry.rating)))
                    Spacer()
                }
                .padding(.bottom)
                Text(detailLeaderEntry.winner)
            }
            .padding()
        }
        .navigationTitle(detailLeaderEntry.winner)
    }
}

