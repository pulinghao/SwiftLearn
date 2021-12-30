//
//  OrderView.swift
//  PLHSwiftProject
//
//  Created by pulinghao on 2021/12/30.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order : Order
    var body: some View {
        NavigationView{
            List{
                Section{
                    ForEach(order.items) { item in
                        HStack{
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                }
                
                Section{
                    NavigationLink(destination: Text("Check out")){
                        Text("Place Order")
                    }
                }
            }
            .navigationTitle("Order")
            .listStyle(InsetGroupedListStyle()) //If you’re using Xcode 12 you need to use InsetGroupedListStyle() rather than .insetGrouped.
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView().environmentObject(Order())
    }
}
