//
//  TicTacToeApp.swift
//  TicTacToe
//
//  Created by yucian huang on 2024/1/26.
//

import SwiftUI

@main

struct TicTacToeApp: App {

    @StateObject var gameBoardDM = GameBoardDataModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(gameBoardDM)
            
        }
    }
}





















