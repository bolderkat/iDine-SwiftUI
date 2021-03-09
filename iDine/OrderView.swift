//
//  OrderView.swift
//  iDine
//
//  Created by Daniel Luo on 3/8/21.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        List {
            Section {
                ForEach(order.items) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        Text("$\(item.price)")
                    }
                }
            }
            Section {
                NavigationLink(destination: Text("Check Out")) {
                    Text("Place Order")
                }
            }
        }
        .navigationTitle("Order")
        .listStyle(InsetGroupedListStyle())
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView().environmentObject(Order())
    }
}
