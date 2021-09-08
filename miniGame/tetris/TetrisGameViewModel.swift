//
//  TetrisGameViewModel.swift
//  miniGame
//
//  Created by james on 2021/09/04.
//

import SwiftUI
import Combine

class TetrisGameViewModel: ObservableObject {
    @Published var tetrisGameModel = TetrisGameModel()
    var numRows: Int { tetrisGameModel.numRows }
    var numColumns: Int { tetrisGameModel.numColumns }
    var started: Bool = false
    
    var gameBoard: [[TetrisGameSquare]] {
        let board = tetrisGameModel.gameBoard.map { $0.map(convertToSquare) }
//        var board = tetrisGameModel.gameBoard.map { $0.map(convertToSquare) }
        
        
        var currentBoard = drawNextTetrominoBoard(board: board)
        
        if let shadow = tetrisGameModel.shadow {
            for blockLocation in shadow.blocks {
                currentBoard[blockLocation.column + shadow.origin.column][blockLocation.row + shadow.origin.row] = TetrisGameSquare(color: getShadowColor(blockType: shadow.blockType))
            }
        }
        
        if let tetromino = tetrisGameModel.tetromino {
            for blockLocation in tetromino.blocks {
                currentBoard[blockLocation.column + tetromino.origin.column][blockLocation.row + tetromino.origin.row] = TetrisGameSquare(color: getColor(blockType: tetromino.blockType))
            }
        }
        
        if let nextTetromino = tetrisGameModel.nextTetromino {
            for blockLocation in nextTetromino.blocks {
                currentBoard[blockLocation.column + tetrisGameModel.numColumns-3][blockLocation.row + tetrisGameModel.numRows-3] = TetrisGameSquare(color: getColor(blockType: nextTetromino.blockType))
            }
        }
        
        return currentBoard
    }
    
    func resume() {
        started = true
        tetrisGameModel.resumeGame()
    }
    
    func pause() {
        
        started = false
        tetrisGameModel.pauseGame()
    }
    
    var anyCancellable: AnyCancellable?
    var lastMoveLocation: CGPoint?
    var lastRoateAngle: Angle?
    
    init() {
        anyCancellable = tetrisGameModel.objectWillChange.sink {
            self.objectWillChange.send()
        }
    }
    
    func drawNextTetrominoBoard(board: [[TetrisGameSquare]]) -> [[TetrisGameSquare]] {
        
        var currentBoard = board
        for row in 1...5 {
            for col in 1...5 {
                currentBoard[tetrisGameModel.numColumns-col][tetrisGameModel.numRows-row] = TetrisGameSquare(color: Color.nextTetrisBoard)
            }
        }
        
        return currentBoard
    }
    
    
    func convertToSquare(block: TetrisGameBlock?) -> TetrisGameSquare {
        return TetrisGameSquare(color: getColor(blockType: block?.blockType))
    }
    
    func getColor(blockType: BlockType?) -> Color {
        switch blockType {
        case .i:
            return .tetrisLightblue
        case .j:
            return .tetrisDarkblue
        case .l:
            return .tetrisOrange
        case .o:
            return .tetrisYellow
        case .s:
            return .tetrisGreen
        case .t:
            return .tetrisPurple
        case .z:
            return .tetrisRed
        case .none:
            return .tetrisBlack
        }
    }
    
    func getShadowColor(blockType: BlockType?) -> Color {
        switch blockType {
        case .i:
            return .tetrisLightBlueShadow
        case .j:
            return .tetrisDarkblueShadow
        case .l:
            return .tetrisOrangeShadow
        case .o:
            return .tetrisYellowShadow
        case .s:
            return .tetrisGreenShadow
        case .t:
            return .tetrisPurpleShadow
        case .z:
            return .tetrisRedShadow
        case .none:
            return .tetrisBlack
        }
    }
    
    func getRotateGesture() -> some Gesture {
        let tap =  TapGesture()
            .onEnded({self.tetrisGameModel.rotateTetromino(clockWise: true)})
        
        let rotate = RotationGesture()
            .onChanged(onRotateChanged(value:))
            .onEnded(onRotateEnd(value:))
        
        return tap.simultaneously(with: rotate)
    }
    
    func onRotateChanged(value: RotationGesture.Value) {
        guard let start = lastRoateAngle else {
            lastRoateAngle = value
            return
        }
        
        let diff = value - start
        if diff.degrees > 10 {
            tetrisGameModel.rotateTetromino(clockWise: true)
            lastRoateAngle = value
            return
        } else if diff.degrees < -10 {
            tetrisGameModel.rotateTetromino(clockWise: false)
            lastRoateAngle = value
            return
        }
    }
    
    func onRotateEnd(value: RotationGesture.Value) {
        lastRoateAngle = nil
    }
    
    func getMoveGesture() -> some Gesture {
        return DragGesture()
            .onChanged(onMoveChanged(value:))
            .onEnded(onMoveEnded(_:))
    }
    
    func onMoveChanged(value: DragGesture.Value) {
        guard let start = lastMoveLocation else {
            lastMoveLocation = value.location
            return
        }
        
        let xDiff = value.location.x - start.x
        if xDiff > 10 {
            print("Moving right")
            let _ = tetrisGameModel.moveTetrominoRight()
            lastMoveLocation = value.location
            return
        }
        if xDiff < -10 {
            print("Moving Left")
            let _ = tetrisGameModel.moveTetrominoLeft()
            lastMoveLocation = value.location
            return
        }
        
        let yDiff = value.location.y - start.y
        if yDiff > 10 {
            print("Moving Down")
            let _ = tetrisGameModel.moveTetrominoDown()
            lastMoveLocation = value.location
            return
        }
        if yDiff < -10 {
            print("Dropping")
            tetrisGameModel.dropTetromino()
            lastMoveLocation = value.location
            return
        }
        
    }
    
    func onMoveEnded(_: DragGesture.Value) {
        lastMoveLocation = nil
    }
}

struct TetrisGameSquare {
    var color: Color
}

