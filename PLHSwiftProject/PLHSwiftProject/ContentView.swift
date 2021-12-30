//
//  ContentView.swift
//  PLHSwiftProject
//
//  Created by pulinghao on 2021/12/29.
//

import SwiftUI

struct ContentView: View {
    
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationView {
            List{
                ForEach(menu){section in
                    Section(header: Text(section.name)){   // 类似于设置section 的header
                        ForEach(section.items){ item in
                            // 跳转链接
                            NavigationLink(destination: ItemDetail(item:item)){
                                ItemRow(item:item)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Menu")
            .listStyle(GroupedListStyle()) //平铺布局
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
