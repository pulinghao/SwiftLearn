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
    
    @State private var ingredienst = [String]()
    
    @State private var rolls = [Int]()
    
    @State private var amount : CGFloat = 50
    
    @State private var name = "Paul"
    
    @Environment(\.redactionReasons) var redactionReasons
    let bio = "The rain in Spain falls mainly on the Spaniards"

    var body: some View {
        VStack{
           
            Text("This is placeholder text")
                .font(.title)
                .redacted(reason: .placeholder)
            
            if redactionReasons == .placeholder {
                Text("Loading…")
            } else {
                Text(bio)
                    .redacted(reason: redactionReasons)
            }
            
            Label {
                Text("Paul Hudson")
                    .foregroundColor(.primary)
                    .font(.largeTitle)
                    .padding()
                    .background(.gray.opacity(0.2))
                    .clipShape(Capsule())
            } icon: {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.blue)
                    .frame(width: 64, height: 64)
            }
            
            
            
            TextField("Shout your name", text: $name)
                .textFieldStyle(.roundedBorder)
                .textCase(.uppercase)
                .padding(.horizontal)
            /**
             设置行数还有宽度
             Text("This is some longer text that is limited to three lines maximum, so anything more than that will cause the text to clip.")
                 .lineLimit(3)
                 .frame(width: 200)
                 .font(.largeTitle)
             */

//            Text("The best laid plans")
//                .padding()
//                .background(Color.yellow)
//                .foregroundColor(.white)
//                .font(.headline)
            
//            Text(Date()...Date().addingTimeInterval(600))
//            // show just the date
//            Text(Date().addingTimeInterval(600), style: .date)
//
//            // show just the time
//            Text(Date().addingTimeInterval(600), style: .time)
//
//            // show the relative distance from now, automatically updating
//            Text(Date().addingTimeInterval(600), style: .relative)
//
//            // make a timer style, automatically updating
//            Text(Date().addingTimeInterval(600), style: .timer)
            
//            Picker("text alignment", selection: $alignment){
//                ForEach(alignments, id:\.self){ alignment in
//                    Text(String(describing: alignment))
//                }
//            }
//            Text("This is an extremely long text string that will never fit even the widest of phones without wrapping")
//                    .font(.largeTitle)
//                    .multilineTextAlignment(alignment)
//                    .frame(width: 300)
//
            
//            Text(ingredienst, format: .list(type: .and))
//            Button("Add Ingredient") {
//                let possibles = ["egg","sausage","bacon","spam"]
//                if let newIngredient = possibles.randomElement(){
//                    ingredienst.append(newIngredient)
//                }
//            }
            
//            Text(rolls, format: .list(memberStyle: .number, type: .and))
//            Button("Roll Dice"){
//                let result = Int.random(in: 1...6)
//                rolls.append(result)
//            }
            
//            Text("ffi")
//                .font(.custom("AmericanTypewriter", size: 72))
//                .kerning(amount)
//
//            Text("ffi")
//                .font(.custom("AmericanTypewriter", size: 72))
//                .tracking(amount)
//
//            Slider(value: $amount, in: 0...100) {
//                Text("Adjust the amount of spacing")
//            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
