//
//  PLHSwiftProjectApp.swift
//  PLHSwiftProject
//
//  Created by pulinghao on 2021/12/29.
//

import SwiftUI

@main
struct PLHSwiftProjectApp: App {
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
