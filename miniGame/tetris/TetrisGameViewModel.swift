//
//  TetrisGameViewModel.swift
//  miniGame
//
//  Created by james on 2021/09/04.
//

import SwiftUI

class TetrisGameViewModel: ObservableObject {
    var numRows: Int
    var numColumns: Int
    @Published var gameBoard: [[TetrisGameSquare]]
    
    init(numRows: Int = 23, numColumns: Int = 10) {
        self.numRows = numRows
        self.numColumns = numColumns
        
        gameBoard = Array(repeating: Array(repeating: TetrisGameSquare(color: Color.black), count: numRows), count: numColumns)
    }
}

struct TetrisGameSquare {
    var color: Color
}
