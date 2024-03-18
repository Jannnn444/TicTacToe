//
//  LeaderEntryRowView.swift
//  TicTacToe
//
//  Created by yucian huang on 2024/3/14.
//

import SwiftUI

struct LeaderEntryRowView: View {
    
    let rowLeaderEntry: LeaderEntry
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text(rowLeaderEntry.winner)
                Text("-")
                Text(rowLeaderEntry.mood)
                    .lineLimit(1)
                    .foregroundStyle(.secondary)
            }
            .padding(.bottom, 1)
            HStack{
                Text(rowLeaderEntry.date, style: .date)
                    .foregroundStyle(.secondary)
                Text(String(repeating: "⭐️", count: Int(rowLeaderEntry.rating)))
            }
            .font(.caption)
            
        }
    }
}
