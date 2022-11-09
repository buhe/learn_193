@_private(sourceFile: "ContentView.swift") import learn
import SwiftUI
import SwiftUI

extension ContentView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/guyanhua/code/github/learn/learn/ContentView.swift", line: 24)
        ContentView()
    
#sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/guyanhua/code/github/learn/learn/ContentView.swift", line: 12)
        ZStack {
            RoundedRectangle(cornerRadius: __designTimeInteger("#9918.[1].[0].property.[0].[0].arg[0].value.[0].arg[0].value", fallback: 25)).stroke(lineWidth: __designTimeInteger("#9918.[1].[0].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value", fallback: 3))
                .padding(.vertical)
            Text(__designTimeString("#9918.[1].[0].property.[0].[0].arg[0].value.[1].arg[0].value", fallback: "Hello, world!1"))
        }
        .padding()
        .foregroundColor(.red)
    
#sourceLocation()
    }
}

import struct learn.ContentView
import struct learn.ContentView_Previews
