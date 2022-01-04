//
//  ContentView.swift
//  Text
//
//  Created by pulinghao on 2022/1/4.
//

import SwiftUI

struct ContentView: View {
    let alignments : [TextAlignment] = [.leading, .center, .trailing]
    @State private var alignment = TextAlignment.leading
    var body: some View {
        VStack{
            Text("Hello, world!")
                .padding()
            Text("This is some longer text that is limited to three lines maximum, so anything more than that will cause the text to clip.")
                .lineLimit(3)
                .frame(width: 200)
                .font(.largeTitle)
            Text("The best laid plans")
                .padding()
                .background(Color.yellow)
                .foregroundColor(.white)
                .font(.headline)
            
            Picker("text alignment", selection: $alignment){
                ForEach(alignments, id:\.self){ alignment in
                    Text(String(describing: alignment))
                }
            }
            Text("This is an extremely long text string that will never fit even the widest of phones without wrapping")
                    .font(.largeTitle)
                    .multilineTextAlignment(alignment)
                    .frame(width: 300)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
