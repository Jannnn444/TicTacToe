//
//  NavigationView.swift
//  TicTacToe
//
//  Created by yucian huang on 2024/2/19.
//
import SwiftUI

// This is main navigation menu for the app
struct NavigationView: View {
    
    // pass it down from another state  // state control 
    @Binding var navigation: NavState
    
    var body: some View {
        HStack {
            
            Button {
                navigation = .home
            } label: {
                Image(systemName: "house.fill")
                Text("Home")
                    .font(.system(size: 20, weight: .medium))
            }
            
            Button {
                navigation = .game
            } label: {
                Image(systemName: "trophy.fill")
                Text("Game")
                    .font(.system(size: 20, weight: .medium))
            }
            
            Button {
                
                navigation = .leaderboard
            } label: {
                Image(systemName: "gamecontroller.fill")
                Text("Leaderboard")
                    .font(.system(size: 20, weight: .medium))
            }
            
        }


    }
}

