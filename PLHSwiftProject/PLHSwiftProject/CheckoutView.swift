//
//  CheckoutView.swift
//  PLHSwiftProject
//
//  Created by pulinghao on 2021/12/30.
//

import SwiftUI

struct CheckoutView: View {
    // 全局变量
    @EnvironmentObject var order : Order
    
    // 双向绑定变量
    @State private var paymentType = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNum = ""
    
    let tipAmounts = [10, 15, 20, 25, 0]
    @State private var tipAmount = 15
    
    @State private var showingPaymentAlert = false
    
    
    @State private var pickupTime = "Now"
    var totalPrice : String{
        // 也可以省略get方法
        get {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            let total = Double(order.total)
            let tipValue = total / 100 * Double(tipAmount)
            return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
        }
        set {
        }
        
    }
    
    let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    let pickUpTimes = ["Now","Tonight","Tomorrow"]
    var body: some View {
        Form{
            Section{
                Picker("How do you want to pay?",selection: $paymentType){
                    ForEach(paymentTypes,id:\.self){
                        Text($0)
                    }
                }
                
                Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
                
                
                if addLoyaltyDetails {
                    TextField("Enter your iDine ID", text:$loyaltyNum)
                }
            }
            
            Section(header:Text("Add a tip?")){
                Picker("Percentage:",selection: $tipAmount){
                    ForEach(tipAmounts, id:\.self){
                        Text("\($0)%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            
            Section(header:Text("Pick Up Time")){
                Picker("When do you want to pick",selection: $pickupTime){
                    ForEach(pickUpTimes, id:\.self){
                        Text($0)
                    }
                }
                .pickerStyle(WheelPickerStyle())
            }
            
            Section(header:Text("TOTAL:\(totalPrice)")
                        .font(.largeTitle)){
                Button("Confirm order"){
                    showingPaymentAlert.toggle()
                }
            }
            
            
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented:$showingPaymentAlert){
            Alert(title:Text("Order confirmed"), message: Text("Your total was \(totalPrice) - thank you"), dismissButton: .default(Text("OK")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView().environmentObject(Order())
    }
}
