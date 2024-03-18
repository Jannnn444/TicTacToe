//
//  EditJournalEntryView.swift
//  TicTacToe
//
//  Created by yucian huang on 2024/3/14.
//

import SwiftUI

struct EditJournalEntryVIew: View {
    
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State var editingJournalEntry: LeaderEntry
    @State var editMode = true
    
    
    var body: some View {
       
        if editMode {
            
                List {
                    TextField("Title", text: $editingJournalEntry.winner)
                    DatePicker("Date", selection: $editingJournalEntry.date, displayedComponents: .date)
                    Text(String(repeating: "🌷", count: Int(editingJournalEntry.rating)))
                    Slider(value: $editingJournalEntry.rating, in: 1...5, step: 1)
                    TextEditor(text: $editingJournalEntry.mood)
                }
            
                .navigationTitle("Edit Mode")
                    .toolbar {
                        Button("Delete") {
                            modelContext.delete(editingJournalEntry)
                            dismiss()
                        }
                        .foregroundStyle(.red)
                        
                        Button("Done") {
                            editMode = false
                        }
                        .bold()
                    }
            
            } else {
                LeaderEntryDetailView(detailLeaderEntry: editingJournalEntry)
                    .toolbar {
                        Button("Edit") {
                            editMode = true
                        }
                    }
            }
        
    }
}
