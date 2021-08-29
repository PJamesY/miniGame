//
//  TicTacTocView.swift
//  miniGame
//
//  Created by james on 2021/08/28.
//

import SwiftUI

struct TicTacTocView: View {
    
    @StateObject private var vieModel = GameViewModel()
    @State private var selectedCircleColor: GameColor = .red
    @State private var selectedLevel: Level = .easy
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                PickerColorView(selectedCircleColor: $selectedCircleColor)
                PickerLevelView(selectedLevel: $selectedLevel)
                
                LazyVGrid(columns: vieModel.columns, spacing: 5) {
                    ForEach(0..<9) {i in
                        ZStack{
                            GameSquareView(proxy: geometry, selectedSide: selectedCircleColor)
                        }
                        .onTapGesture {
                            vieModel.processPlayerMove(for: i)
                        }
                    }
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

struct TicTacTocView_Previews: PreviewProvider {
    static var previews: some View {
        TicTacTocView()
    }
}
