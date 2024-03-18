//
//  CreateLeaderEntryView.swift
//  TicTacToe
//
//  Created by yucian huang on 2024/3/14.
//

import SwiftUI

struct CreateLeaderEntryView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State var winner: String = ""
    @State var mood: String = ""
    @State var rating: Double = 3.0
    @State var date: Date = Date()
    
    
    var body: some View {
        NavigationStack{
            Form {
                TextField("Winner Name", text: $winner)
                DatePicker("Date", selection: $date, displayedComponents: .date)
                Text(String(repeating: "⭐️", count: Int(rating)))
                Slider(value: $rating, in: 1...5, step: 1)
                
            }
            .navigationTitle("New EntryPage")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        let newLeaderEntry = LeaderEntry(winner: winner, mood: mood, rating: rating, date: date)
                        modelContext.insert(newLeaderEntry)
                        dismiss()
                    }
                }
                
            }
        }
    }
}
