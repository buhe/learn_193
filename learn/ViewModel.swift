//
//  ViewModel.swift
//  learn
//
//  Created by 顾艳华 on 2022/11/11.
//

import Foundation
class ViewModel: ObservableObject {
    @Published var model: Model<String>
    static let e = ["😜", "😀", "😄", "😆", "🥹", "🥰"]
    init() {
        model = Model(num: ViewModel.e.count) {
            i in ViewModel.e[i]
        }
    }
    
    func select(_ card: Model<String>.Card) {
        model.select(card)
    }
}
