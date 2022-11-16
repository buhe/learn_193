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
    @Namespace var ns
    
    func d(_ card: Model<String>.Card) {
        deal.insert(card.id)
    }
    
    func un(_ c: Model<String>.Card) -> Bool{
        !deal.contains(c.id)
    }
    
    func delay(_ c: Model<String>.Card) -> Animation {
        var delay = 0.0
        if let i = viewModel.model.cards.firstIndex(where: {$0.id == c.id}) {
            delay = Double(i) * 3 / Double(viewModel.model.cards.count)
        }
        return Animation.easeInOut(duration: 1).delay(delay)
    }
    var body: some View {
        VStack {
            AspectView(cards: viewModel.model.cards) { card in
                if un(card) || (card.isMacthed && !card.isFaceUp) {
                    Rectangle().opacity(0)
                } else {
                    CardView(card: card)
//                        .transition(AnyTransition.scale)
                        .matchedGeometryEffect(id: card.id, in: ns)
                        .onTapGesture {
                        withAnimation() {
                            viewModel.select(card)
                        }
                        
                    }
                }
            }.onAppear {
                
                    for c in viewModel.model.cards {
                        withAnimation(delay(c)) {
                            d(c)
                        }
                    }
             
            }
//            Circle()
            ZStack {
                ForEach(viewModel.model.cards.filter(un)) {
                    c in CardView(card: c)
                        .frame(width: 60, height: 90)
                        .matchedGeometryEffect(id: c.id, in: ns)
//                        .transition(AnyTransition.scale)
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
