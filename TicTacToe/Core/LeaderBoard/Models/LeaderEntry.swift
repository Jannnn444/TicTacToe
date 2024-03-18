//
//  ScoreEntry.swift
//  TicTacToe
//
//  Created by yucian huang on 2024/3/14.
//

import Foundation
import SwiftData

@Model
class LeaderEntry {
    var winner: String = ""
    var mood: String = ""
    var rating: Double = 1
    var date: Date = Date()
    
    init(winner: String, mood: String, rating: Double, date: Date) {
        self.winner = winner
        self.mood = mood
        self.rating = rating
        self.date = date
    }
}



