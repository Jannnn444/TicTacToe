//
//  LeaderboardView.swift
//  TicTacToe
//
//  Created by yucian huang on 2024/3/28.
//

import Foundation
import SwiftUI

struct LeaderboardView: View {
    
    @EnvironmentObject var gameBoardDM: GameBoardDataModel
    
    var body: some View {
        
        VStack{
 
                Text("Welcome \(gameBoardDM.username)")
                    .padding(.bottom, 100)
            
        }
        
    }
}


#Preview {
    HomeView().environmentObject(GameBoardDataModel())
}
