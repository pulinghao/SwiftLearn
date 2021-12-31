//
//  ItemDetail.swift
//  PLHSwiftProject
//
//  Created by pulinghao on 2021/12/30.
//

import SwiftUI

struct ItemDetail: View {
    let item : MenuItem
    @EnvironmentObject var order : Order
    @EnvironmentObject var fav : Favorite
    var body: some View {
        VStack{
            ZStack(alignment: .bottomTrailing){ //底部对齐
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo:\(item.photoCredit)")
                    .padding(4) //和background的顺序不可交换，交换以后，pandding不生效
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            
            Text(item.description)
                .padding()
            Button("Order This") {
                order.add(item: item)
            }
            .font(.system(size: 16, weight: .light, design: .default))
            Spacer()
            Button("Like This"){
                fav.add(item: item)
            }
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)  //防止导航栏特别大
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{  //设置为一个navigation
            ItemDetail(item:MenuItem.example).environmentObject(Order())
                .environmentObject(Favorite())
        }
    }
}
