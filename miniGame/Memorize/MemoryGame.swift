//
//  MemoryGame.swift
//  miniGame
//
//  Created by james on 2021/09/11.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter{ cards[$0].isFaceUp}.oneAneOnly }
        set { cards.indices.forEach{ cards[$0].isFaceUp = ($0 == newValue)} }
        
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
//        cards.shuffle()
    }
    
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        
        // add numberofPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2 + 1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent // never changed
        let id: Int // never changed
    }
    
    // MARK: - Bonus Time
    
    // this could give matching bonus points
    // if the user matches the card
    // before a certain amount of time passess during which the card is face up
    
    // can be zero which means "no bonus available" for this card
    var bonusTimeLimit: TimeInterval = 6
    
    // how long this card has ever been face up
    private var faceUpTime: TimeInterval {
        if let lastFaceUpDate = self.lastFaceUpDate {
            return pastFaceUpTime + Date().timeIntervalSince(lastFaceUpDate)
        } else {
            return pastFaceUpTime
        }
    }
    
    // the last time this card was turned face up (and is still face up)
    var lastFaceUpDate: Date?
    // the accumulated time this card has been face up in the past
    // (i.e. not including the current time it's been face up if it is currently so)
    var pastFaceUpTime: TimeInterval = 0
    
    // how much time left before the bonus opportunity runs out
    var bonusTimeRemaining: TimeInterval {
        max(0, bonusTimeLimit - faceUpTime)
    }
    
}

extension Array {
    var oneAneOnly: Element? {
        if self.count == 1 {
            return self.first
        } else {
            return nil
        }
    }
}
