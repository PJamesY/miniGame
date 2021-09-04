//
//  Tetris.swift
//  miniGame
//
//  Created by james on 2021/09/04.
//

import SwiftUI

struct TetrisGameView: View {
    
    @ObservedObject var tetrisGame = TetrisGameViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct TetrisGameView_Previews: PreviewProvider {
    static var previews: some View {
        TetrisGameView()
    }
}
