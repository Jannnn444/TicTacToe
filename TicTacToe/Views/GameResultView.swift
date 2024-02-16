//
//  GameResultView.swift
//  TicTacToe
//
//  Created by yucian huang on 2024/1/26.
//


import SwiftUI

//@State var title: String = "My Title" 
struct GameResultView: View {
    @EnvironmentObject var gameBoardDM: GameBoardDataModel
    let myModuleDimension: CGFloat = 250
    var body: some View {
        ZStack{
            Color(.black)
                .opacity(0.4)
                .ignoresSafeArea()
            // MARK: Module
            VStack{
                HStack{
                    Text("Circle won!")
                    Image(systemName: "trophy.fill")}
                Text("Retry ?")
                    .padding(.top)
                    .onTapGesture {
                        // RESET GAME
                        gameBoardDM.newGame()
                    }
            }
                .frame(width: myModuleDimension, height: myModuleDimension)
                .background(.white)
                .font(.system(size: 22, weight: .bold))
                .cornerRadius(20)
        }
    }
}

struct GameResultViewCross: View {
    @EnvironmentObject var gameBoardDM: GameBoardDataModel
    let myModuleDimension: CGFloat = 250
    var body: some View {
        ZStack{
            Color(.black)
                .opacity(0.4)
                .ignoresSafeArea()
            // MARK: Module
            VStack{
                HStack{
                    Text("Cross won!")
                    Image(systemName: "trophy.fill")}
                Text("Retry ?")
                    .padding(.top)
                    .onTapGesture {
                        // RESET GAME
                        gameBoardDM.newGame()
                    }
            }
                .frame(width: myModuleDimension, height: myModuleDimension)
                .background(.white)
                .font(.system(size: 22, weight: .bold))
                .cornerRadius(20)
        }
    }
}





#Preview {
    GameResultView()
}






















