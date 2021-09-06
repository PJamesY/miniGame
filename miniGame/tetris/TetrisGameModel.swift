//
//  TetrisGameModel.swift
//  miniGame
//
//  Created by james on 2021/09/04.
//

import SwiftUI

class TetrisGameModel: ObservableObject {
    var numRows: Int
    var numColumns: Int
    @Published var gameBoard: [[TetrisGameBlock?]]
    @Published var tetromino: Tetromino?
    var timer: Timer?
    var speed: Double
    
    init(numRows: Int = 23, numColumns: Int = 10) {
        self.numRows = numRows
        self.numColumns = numColumns
        
        gameBoard = Array(repeating: Array(repeating: nil, count: numRows), count: numColumns)
        tetromino = Tetromino(origin: BlockLocation(row: 22, column: 2), blockType: .i)
        speed = 0.1
        resumeGame()
    }
    
    func blockClicked(row:Int, column:Int) {
        print("row : \(row)")
        if gameBoard[column][row] == nil {
            gameBoard[column][row] = TetrisGameBlock(blockType: BlockType.allCases.randomElement()!)
        } else {
            gameBoard[column][row] = nil
        }
    }
    
    func resumeGame() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: speed, repeats: true, block: runEngine)
    }
    
    func pauseGame() {
        timer?.invalidate()
    }
    
    func runEngine(timer: Timer) {
        // spawn a new block if we need to
        guard let currentTetromino = tetromino else {
            print("Spawning new tetromino")
            tetromino = Tetromino.createNewTetromino(numRows: numRows, numColumns: numColumns)
            if !isValidTetromino(testTetromino: tetromino!) {
                print("GAME OVER")
                pauseGame()
            }
            return
        }
        
        // See about moving block down
        let newTetromino = currentTetromino.moveBy(row: -1, column: 0)
        if isValidTetromino(testTetromino: newTetromino) {
            tetromino = newTetromino
            return
        }
        
        // see if we need to place the block
        placeTetromino()
    }
    
    func isValidTetromino(testTetromino: Tetromino) -> Bool {
        for block in testTetromino.blocks {
            let row = testTetromino.origin.row + block.row
            if row < 0 || row >= numRows { return false }
            
            let column = testTetromino.origin.column + block.column
            if column < 0 || column >= numColumns { return false }
            
            if gameBoard[column][row] != nil { return false }
        }
        
        return true
    }
    
    func placeTetromino() {
        guard let currentTetromino = tetromino else {
            return
        }
        
        for block in currentTetromino.blocks {
            let row = currentTetromino.origin.row + block.row
            if row < 0 || row >= numRows { break }
            
            let column = currentTetromino.origin.column + block.column
            if column < 0 || column >= numColumns { break }
            
            gameBoard[column][row] = TetrisGameBlock(blockType: currentTetromino.blockType)
        }
        
        tetromino = nil
    }
    
    
    
    
}

struct TetrisGameBlock {
    var blockType: BlockType
}

enum BlockType: CaseIterable {
    case i, t, o, j, l, s, z
}



struct Tetromino {
    var origin: BlockLocation
    var blockType: BlockType
    
    var blocks: [BlockLocation] {
        return Tetromino.getBlocks(blockType: blockType)
    }
    
    func moveBy(row: Int, column: Int) -> Tetromino {
        let newOrigin = BlockLocation(row: origin.row + row, column: origin.column + column)
        return Tetromino(origin: newOrigin, blockType: blockType)
    }
    
    static func getBlocks(blockType: BlockType) -> [BlockLocation] {
        switch blockType {
        case .i:
            return [
                BlockLocation(row: 0, column: -1),
                BlockLocation(row: 0, column: 0),
                BlockLocation(row: 0, column: 1),
                BlockLocation(row: 0, column: 2)
            ]
        default:
            return [
                BlockLocation(row: 0, column: -1),
                BlockLocation(row: 0, column: 0),
                BlockLocation(row: 0, column: 1),
                BlockLocation(row: 0, column: 2)
            ]
        }
    }
    
    static func createNewTetromino(numRows: Int, numColumns: Int) -> Tetromino {
        let blockType = BlockType.allCases.randomElement()!
        
        var maxRow = 0
        for block in getBlocks(blockType: blockType) {
            maxRow = max(maxRow, block.row)
        }
        
        let origin = BlockLocation(row: numRows - 1 - maxRow, column: (numColumns-1)/2)
        return Tetromino(origin: origin, blockType: blockType)
    }
    
    
}

struct BlockLocation {
    var row: Int
    var column: Int
}
