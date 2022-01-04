//
//  ContentView.swift
//  Text
//
//  Created by pulinghao on 2022/1/4.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Text("Hello, world!")
                .padding()
            Text("This is some longer text that is limited to three lines maximum, so anything more than that will cause the text to clip.")
                .lineLimit(3)
                .frame(width: 200)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
