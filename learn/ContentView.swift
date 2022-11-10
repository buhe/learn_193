//
//  ContentView.swift
//  learn
//
//  Created by 顾艳华 on 2022/11/9.
//

import SwiftUI

struct ContentView: View {
    let e = ["😜", "😀", "😄", "😆", "🥹", "🥰"]
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(e, id: \.self){
                        emo in CardView(c: emo).aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .foregroundColor(.red)
            }
            Spacer()
            HStack {
                Button(action: {
                    
                }, label: {
                    Text("Remove")
                })
                Spacer()
                Button(action: {
                    
                }, label: {
                    Text("Add")
                })
            }.padding(.horizontal)
         
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
    }
}

struct CardView: View {
    @State var isFaceup = true
    var c = ""
    var body: some View {
        ZStack {
            if isFaceup {
                RoundedRectangle(cornerRadius: 25).fill().foregroundColor(.white)
                RoundedRectangle(cornerRadius: 25).stroke(lineWidth: 3)
                    
                Text(c)
            } else {
                RoundedRectangle(cornerRadius: 25).fill()
                    
            }
        }
        .onTapGesture {
            isFaceup = !isFaceup
        }
    }
}
