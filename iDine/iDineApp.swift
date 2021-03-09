//
//  iDineApp.swift
//  iDine
//
//  Created by Daniel Luo on 3/8/21.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(order)
        }
    }
}
