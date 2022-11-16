//
//  Cardify.swift
//  learn
//
//  Created by 顾艳华 on 2022/11/15.
//

import SwiftUI

struct Cardify: Animatable, ViewModifier{
    
    var ro: Double
    init(isFaceUp: Bool) {
        self.ro = isFaceUp ? 0 : 180
    }
    var animatableData: Double {
        get {
            ro
        }
        set {
            ro = newValue
        }
    }
    func body(content: Content) -> some View {
        ZStack {
            if ro < 90 {
                RoundedRectangle(cornerRadius: 25).fill().foregroundColor(.white)
                RoundedRectangle(cornerRadius: 25).stroke(lineWidth: 3)
            } else {
                RoundedRectangle(cornerRadius: 25).fill()
            }
            content.opacity(ro < 90 ? 1 : 0)
        }.rotation3DEffect(Angle(degrees: ro), axis: (0,1,0))
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View{
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
