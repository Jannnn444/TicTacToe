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
    @Binding var navigationState: NavState
    
    
    var body: some View {
        HStack {
            
            Button {
                navigationState = .home
            } label: {
                Image(systemName: "house.fill")
                Text("Home")
                    .font(.system(size: 20, weight: .medium))
                
            }
            
            Button {
                navigationState = .game
            } label: {
                Image(systemName: "trophy.fill")
                Text("Game")
                    .font(.system(size: 20, weight: .medium))
            }
            
            Button {
                navigationState = .leaderboard
            } label: {
                Image(systemName: "gamecontroller.fill")
                Text("Leaderboard")
                    .font(.system(size: 20, weight: .medium))
            }
            
        }


    }
}

