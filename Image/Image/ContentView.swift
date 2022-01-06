//
//  ContentView.swift
//  Image
//
//  Created by pulinghao on 2022/1/6.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            Image(systemName: "cloud.heavyrain.fill")
                .font(.largeTitle)
            Image(systemName: "cloud.sun.rain.fill")
                .renderingMode(.original)
                .font(.largeTitle)
                .padding()
                .background(Color.black)
                .clipShape(Circle())
            Text("Hacking with Swift")
                .font(.largeTitle)
                .padding()
                .background(
                    Circle()
                        .fill(Color.red)
                        .frame(width: 50, height: 50)
                )
//                .clipped()
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
