//
//  Moodel.swift
//  learn
//
//  Created by 顾艳华 on 2022/11/11.
//

import Foundation
struct Model<T: Equatable> {
    var num: Int
    var before: Int? {
        get {
            var faceUps = [Int]()
            for i in cards.indices {
                if cards[i].isFaceUp {
                    faceUps.append(i)
                }
            }
            return faceUps.onlyOne
        }
        set {
            for idx in cards.indices {
                if idx != newValue {
                    cards[idx].isFaceUp = false
                } else {
                    cards[idx].isFaceUp = true
                }
                
            }
        }
    }
    mutating func select(_ card: Card) {
        let selectIdx = cards.firstIndex(where: { $0.id == card.id })
        if let i = selectIdx,
           !cards[i].isMacthed,
           !cards[i].isFaceUp
        {
            if let b = before {
                if cards[b].c == cards[i].c {
                    cards[b].isMacthed = true
                    cards[i].isMacthed = true
                }
                cards[i].isFaceUp = true
            } else {
                before = i
            }
            
        }
    }
    init(num: Int, makeCard: (Int) -> T) {
        self.num = num
        cards = Array()
        for i in 0..<num {
            cards.append(Card(isFaceUp: false, isMacthed: false, c: makeCard(i), id: i*2))
            cards.append(Card(isFaceUp: false, isMacthed: false, c: makeCard(i), id: i*2+1))
        }
    }
    var cards: Array<Card>
    struct Card: Identifiable {
        var isFaceUp: Bool
        var isMacthed: Bool
        var c: T
        var id:Int
    }
}

extension Array {
    var onlyOne: Element? {
        if self.count == 1 {
            return self.first
        } else {
            return nil
        }
    }
}
