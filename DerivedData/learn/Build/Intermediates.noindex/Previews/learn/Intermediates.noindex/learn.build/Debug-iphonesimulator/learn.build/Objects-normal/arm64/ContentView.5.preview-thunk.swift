@_private(sourceFile: "ContentView.swift") import learn
import SwiftUI
import SwiftUI

extension ContentView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/guyanhua/code/github/learn/learn/ContentView.swift", line: 24)
        __designTimeSelection(ContentView(), "#9918.[2].[0].property.[0].[0]")
    
#sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/guyanhua/code/github/learn/learn/ContentView.swift", line: 12)
        __designTimeSelection(VStack {
            __designTimeSelection(Image(systemName: __designTimeString("#9918.[1].[0].property.[0].[0].arg[0].value.[0].arg[0].value", fallback: "globe"))
                .imageScale(.large)
                .foregroundColor(.accentColor), "#9918.[1].[0].property.[0].[0].arg[0].value.[0]")
            __designTimeSelection(Text(__designTimeString("#9918.[1].[0].property.[0].[0].arg[0].value.[1].arg[0].value", fallback: "Hello, world!")), "#9918.[1].[0].property.[0].[0].arg[0].value.[1]")
        }
        .padding(), "#9918.[1].[0].property.[0].[0]")
    
#sourceLocation()
    }
}

import struct learn.ContentView
import struct learn.ContentView_Previews
