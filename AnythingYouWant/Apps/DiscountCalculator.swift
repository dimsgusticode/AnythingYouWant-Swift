//
//  DiscountCalculator.swift
//  AnythingYouWant
//
//  Created by Gusti Dimas on 10/02/24.
//

import SwiftUI

struct DiscountCalculator: View {
    @State private var originalPrice = ""
    @State private var discountPercentage = ""
    @State private var selectedCurrencyIndex = 0
    
    let currencies = ["USD", "EUR", "GBP", "JPY", "IDR"]
    
    var discountedPrice: Double {
        let price = Double(originalPrice) ?? 0
        let discount = Double(discountPercentage) ?? 0
        let discountAmount = price * (discount / 100)
        return price - discountAmount
    }
    
    var formattedDiscountedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currencies[selectedCurrencyIndex]
        return formatter.string(from: NSNumber(value: discountedPrice)) ?? ""
    }
    
    var body: some View {
        VStack {
            Text("Original Price")
                .font(.title3)
            TextField("Price", text: $originalPrice)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .keyboardType(.decimalPad)
            Text("Discount Percentage")
                .font(.title3)
            TextField("Percentage", text: $discountPercentage)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .keyboardType(.decimalPad)
            
            Picker("Currency", selection: $selectedCurrencyIndex) {
                ForEach(currencies.indices, id: \.self) { index in
                    Text(self.currencies[index]).tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            Text("""
            Discounted Price:
            \(formattedDiscountedPrice)
            """)
            .font(.title2)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    DiscountCalculator()
}
