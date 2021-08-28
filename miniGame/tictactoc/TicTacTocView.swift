//
//  TicTacTocView.swift
//  miniGame
//
//  Created by james on 2021/08/28.
//

import SwiftUI

struct TicTacTocView: View {
    
    @State private var selectedCircleColor: GameColor = .red
    @State private var selectedLevel: Level = .easy
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                PickerColorView(selectedCircleColor: $selectedCircleColor)
                PickerLevelView(selectedLevel: $selectedLevel)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle("TIC TAC TOC")        
    }
}

struct TicTacTocView_Previews: PreviewProvider {
    static var previews: some View {
        TicTacTocView()
    }
}
