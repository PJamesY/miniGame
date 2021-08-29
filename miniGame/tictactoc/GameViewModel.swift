//
//  GameViewModel.swift
//  miniGame
//
//  Created by james on 2021/08/29.
//

import SwiftUI

enum Player {
    case human, computer
}

struct Move {
    let player: Player
    let boardIndex: Int
    
    var indicator: String {
        return player == .human ? "xmark" : "circle"
    }
}

let winPatternsForTicTacToc: Set<Set<Int>> = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

final class GameViewModel: ObservableObject {
    
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    @Published var moves: [Move?] = Array(repeating: nil, count: 9)
    @Published var isGameBoardDisabled = false
    @Published var alertItem: AlertItem?
    
    func processPlayerMove (for position: Int) {
        // 이미 차있으면 return
        if isSquareOccupied(in: moves, forIndex: position) {return}
    }
    
    func determinComputerMovePosition(in moves: [Move?]) -> Int {
        // if AI can win, than win
        let computerPositions = getPlayerPostions(for: .computer, in: moves)
        
        for pattern in winPatternsForTicTacToc {
            let winPositions = pattern.subtracting(computerPositions)
            
            if winPositions.count == 1 {
                let isAvailable = !isSquareOccupied(in: moves, forIndex: winPositions.first!)
                if isAvailable {return winPositions.first!}
            }
        }
        
        // if AI can't win then block
        let humanPositions = getPlayerPostions(for: .human, in: moves)
        
        for pattern in winPatternsForTicTacToc {
            let winPositions = pattern.subtracting(humanPositions)
            
            if winPositions.count == 1 {
                let isAvailable = !isSquareOccupied(in: moves, forIndex: winPositions.first!)
                if isAvailable {return winPositions.first!}
            }
        }
        
        // if AI can't block then take middle square
        let centerSquare = 4
        if !isSquareOccupied(in: moves, forIndex: centerSquare) {
            return centerSquare
        }
        
        var movePosition = Int.random(in: 0..<9)
        
        while isSquareOccupied(in: moves, forIndex: movePosition) {
            movePosition = Int.random(in: 0..<9)
        }
        
        return movePosition
        
    }
    
    func getPlayerPostions(for player: Player, in moves: [Move?]) -> Set<Int> {
        let playerMoves = moves.compactMap{$0}.filter{$0.player == player}
        return Set(playerMoves.map{$0.boardIndex})
    }
    
    func isSquareOccupied(in moves: [Move?], forIndex index: Int) -> Bool {
        return moves.contains(where: {$0?.boardIndex == index})
    }
    
    func checkWinCondition(for player: Player, in moves: [Move?]) -> Bool {
        let playerPositon = getPlayerPostions(for: player, in: moves)
        for pattern in winPatternsForTicTacToc where pattern.isSubset(of: playerPositon) {return true}
        
        return false
    }
    
    func checkForDraw(in moves: [Move?]) -> Bool {
        return moves.compactMap {$0}.count == 9
    }
    
    func resetGame() {
        moves = Array(repeating: nil, count: 9)
    }
}

