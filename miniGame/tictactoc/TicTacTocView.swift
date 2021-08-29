//
//  TicTacTocView.swift
//  miniGame
//
//  Created by james on 2021/08/28.
//

import SwiftUI

struct TicTacTocView: View {
    
    @StateObject private var viewModel = GameViewModel()
    @State private var selectedCircleColor: GameColor = .red
    @State private var selectedLevel: Level = .easy
//    @State private var isGameStart = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                VStack(spacing:10) {
                    PickerColorView(selectedCircleColor: $selectedCircleColor)
                    PickerLevelView(selectedLevel: $selectedLevel)
                    
                }
                .disabled(viewModel.isGameStart)
                
                Spacer(minLength: 5)
                
                LazyVGrid(columns: viewModel.columns, spacing: 5) {
                    ForEach(0..<9) {i in
                        ZStack{
                            GameSquareView(proxy: geometry, selectedSide: selectedCircleColor)
                            PlayerIndicator(systemImageName: viewModel.moves[i]?.indicator ?? "")
                        }
                        .onTapGesture {
                            viewModel.processPlayerMove(for: i, level: selectedLevel.rawValue)
                        }
                    }
                }
                .disabled(viewModel.isGameBoardDisabled || !viewModel.isGameStart)
                .alert(item: $viewModel.alertItem, content: { alertItem in
                    Alert(title: alertItem.title, message: alertItem.message, dismissButton: .default(alertItem.buttonTitle, action: {viewModel.resetGame()}))
                })
                
                Spacer(minLength: 10)
                
                HStack(spacing:30) {
                    ButtonView(title: "START", buttonAction: viewModel.setGameStart)
                    ButtonView(title: "RESET", buttonAction: viewModel.resetGame)
                }
                
                
            }
            
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle("TIC TAC TOC")        
    }
}



struct CircleBoard: View {
    var proxy: GeometryProxy
    var color: Color
    
    var body: some View {
        let number = proxy.size.width/3 - 15
        Circle()
            .foregroundColor(color)
            .frame(width: number, height: number, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct GameSquareView: View {
    var proxy: GeometryProxy
    var selectedSide: GameColor
    
    var body: some View {
        switch selectedSide {
        case .red:
            CircleBoard(proxy: proxy, color: Color.red)
        case .green:
            CircleBoard(proxy: proxy, color: Color.green)
        case .blue:
            CircleBoard(proxy: proxy, color: Color.blue)
        }
    }
}

struct PlayerIndicator: View {
    var systemImageName: String
    
    var body: some View {
        if (systemImageName != "") {
            Image(systemName: systemImageName)
                .resizable()
                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
        }
        
        Text("")
        
    }
}

struct TicTacTocView_Previews: PreviewProvider {
    static var previews: some View {
        TicTacTocView()
    }
}

struct ButtonView: View {
    
    var title: String
    var buttonAction: ()->Void
    
    
    var body: some View {
        Button(action: buttonAction, label: {
            Text(title)
        })
        .frame(width: 150, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Color.orange)
        .foregroundColor(.white)
        .cornerRadius(10)
    }
}
