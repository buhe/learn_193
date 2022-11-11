//
//  Moodel.swift
//  learn
//
//  Created by 顾艳华 on 2022/11/11.
//

import Foundation
struct Model<T> {
    
    func select(_ card: Card) {
        
    }
    init(num: Int, makeCard: (Int) -> T) {
        cards = Array()
        for i in 0..<num {
            cards.append(Card(isFaceUp: false, isMacthed: false, c: makeCard(i)))
            cards.append(Card(isFaceUp: false, isMacthed: false, c: makeCard(i)))
        }
    }
    var cards: Array<Card>
    struct Card {
        var isFaceUp: Bool
        var isMacthed: Bool
        var c: T
    }
}
