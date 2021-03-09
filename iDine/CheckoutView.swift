//
//  CheckoutView.swift
//  iDine
//
//  Created by Daniel Luo on 3/8/21.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    let paymentTypes = ["Cash", "Credit Card", "iDinePoints"]
    let tipAmounts = [10, 15, 20, 25, 0]
    @State private var selectedTip = 15
    @State private var paymentType = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    private var totalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let total = Double(order.total)
        let tipValue = total * Double(selectedTip) / 100
        
        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
    }
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
                Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
                
                if addLoyaltyDetails {
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }
            }
            Section(header: Text("Add a tip?")) {
                Picker("Percentage:", selection: $selectedTip) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("Total: \(totalPrice)")) {
                Button("Confirm order") {
                    
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView().environmentObject(Order())
    }
}
