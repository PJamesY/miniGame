//
//  Tetris.swift
//  miniGame
//
//  Created by james on 2021/09/04.
//

import SwiftUI

struct TetrisGameView: View {
    
    @ObservedObject var tetrisGame = TetrisGameViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        print("BACK!!")
        tetrisGame.pause()
    }) {
        
        
        Text("Go back")
        
    }
    }
    
    
    var body: some View {
        
        ZStack {
            GeometryReader { (geometry: GeometryProxy) in
                //            Text("SCroe")
                drawBoard(boundingRect: geometry.size)
            }
            //        .navigationBarHidden(true)
            .gesture(tetrisGame.getMoveGesture())
            .gesture(tetrisGame.getRotateGesture())
            //        .gesture(tetrisGame.res)
            if (!tetrisGame.started) {
                Button {
                    tetrisGame.resume()
                } label: {
                    Text("START")
                }
            } 
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
        
    }
    
    func drawBoard(boundingRect: CGSize) -> some View {
        let columns = tetrisGame.numColumns
        let rows = tetrisGame.numRows
        let blockSize = min(boundingRect.width/CGFloat(columns), boundingRect.height/CGFloat(rows))
        let xoffset = (boundingRect.width - blockSize*CGFloat(columns)) / 2
        //        let yoffset = (boundingRect.height - blockSize*CGFloat(rows)) / 2
        
        return ForEach(0...columns-1, id:\.self) { col in
            ForEach(0...rows-1, id:\.self) { row in
                Path { path in
                    let x = xoffset + blockSize*CGFloat(col)
                    let y = boundingRect.height - blockSize*CGFloat(row+1)
                    
                    let rect = CGRect(x: x, y: y, width: blockSize, height: blockSize)
                    
                    path.addRect(rect)
                }
                
                .fill(tetrisGame.gameBoard[col][row].color)
                
            }
        }
        //        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
    
}

struct TetrisGameView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TetrisGameView()
        }
    }
}
