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
        GeometryReader { (geometry: GeometryProxy) in
//                .background(Color.red)
            drawBoard(boundingRect: geometry.size)
        }
        .navigationBarHidden(true)
    }
    
    func drawBoard(boundingRect: CGSize) -> some View {
        let columns = tetrisGame.numColumns
        let rows = tetrisGame.numRows
        let blockSize = min(boundingRect.width/CGFloat(columns), boundingRect.height/CGFloat(rows))
        let xoffset = (boundingRect.width - blockSize*CGFloat(columns)) / 2
        let yoffset = (boundingRect.height - blockSize*CGFloat(rows)) / 2
        
        return ForEach(0...columns-1, id:\.self) { (column:Int) in
            ForEach(0...rows-1, id:\.self) { (row:Int) in
                Path { path in
                    let x = xoffset + blockSize*CGFloat(column)
                    let y = boundingRect.height - yoffset - blockSize*CGFloat(row+1)
                    
                    let rect = CGRect(x: x, y: y, width: blockSize, height: blockSize)
                    path.addRect(rect)
                }
                .fill(tetrisGame.gameBoard[column][row].color)
                .onTapGesture {
                    tetrisGame.squareClicked(row: row, column: column)
                }
                
            }
            
        }
    }
    
}

struct TetrisGameView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TetrisGameView()
            TetrisGameView()
        }
    }
}
