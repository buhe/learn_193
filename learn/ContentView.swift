//
//  ContentView.swift
//  learn
//
//  Created by 顾艳华 on 2022/11/9.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel

    @State var deal = Set<Int>()
    
    func d(_ card: Model<String>.Card) {
        deal.insert(card.id)
    }
    
    func un(_ c: Model<String>.Card) -> Bool{
        !deal.contains(c.id)
    }
    var body: some View {
        VStack {
            AspectView(cards: viewModel.model.cards) { card in
                if un(card) || (card.isMacthed && !card.isFaceUp) {
                    Rectangle().opacity(0)
                } else {
                    CardView(card: card)
                        .transition(AnyTransition.scale)
                        .onTapGesture {
                        withAnimation() {
                            viewModel.select(card)
                        }
                        
                    }
                }
            }.onAppear {
                withAnimation(.easeIn(duration: 5)) {
                    for c in viewModel.model.cards {
                        d(c)
                    }
                }
             
            }
//            Circle()
            ZStack {
                ForEach(viewModel.model.cards.filter(un)) {
                    c in CardView(card: c)
                        .frame(width: 60, height: 90)
                        .transition(AnyTransition.scale)
                }
            }
        }
        .padding(.horizontal)
    }
}

struct AspectView<Item: Identifiable, IV: View>: View {
    var cards: [Item]
    var content: (Item) -> IV
    init(cards: [Item], @ViewBuilder content: @escaping (Item) -> IV) {
        self.cards = cards
        self.content = content
    }
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                ForEach(cards){
                    card in content(card).aspectRatio(2/3, contentMode: .fit)
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = ViewModel()
        ContentView(viewModel: vm)
        ContentView(viewModel: vm)
            .preferredColorScheme(.dark)
    }
}

struct CardView: View {
    var card: Model<String>.Card
    var body: some View {
        GeometryReader {
            g in
            ZStack {
                Text(card.c).font(Font.system(size: 32))
                    .scaleEffect(min(g.size.height, g.size.width) / (32 / 0.8) )
                    .rotationEffect(Angle(degrees: card.isMacthed ? 360 : 0))
                    .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: false), value: card.isMacthed)
                Pie(startAngle: Angle(degrees: 0 - 90), endAngle: Angle(degrees: 110 - 90)).opacity(0.4)
            }.cardify(isFaceUp: card.isFaceUp)
        }
    }
}
