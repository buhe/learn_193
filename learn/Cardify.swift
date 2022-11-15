//
//  Cardify.swift
//  learn
//
//  Created by 顾艳华 on 2022/11/15.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUp: Bool
    func body(content: Content) -> some View {
        
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 25).fill().foregroundColor(.white)
                RoundedRectangle(cornerRadius: 25).stroke(lineWidth: 3)
                
                content
                
                
            } else {
                RoundedRectangle(cornerRadius: 25).fill()
                
            }
        }
    }
    
    
}

extension View {
    func cardify(isFaceUp: Bool) -> some View{
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
