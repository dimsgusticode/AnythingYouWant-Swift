//
//  Spinner.swift
//  AnythingYouWant
//
//  Created by Gusti Dimas on 11/02/24.
//

import SwiftUI

import SwiftUI

struct Spinner: View {
    @State private var itemsInput: String = ""
    @State private var items: [String] = []
    @State private var selectedItem: String = ""

    var body: some View {
        VStack {
            Text("Enter items separated by space")
            TextField("Enter items", text: $itemsInput)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: {
                self.items = self.itemsInput.components(separatedBy: " ").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
                if !self.items.isEmpty {
                    self.selectedItem = self.items.randomElement() ?? ""
                }
            }) {
                Text("Pick Random Item")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
            }
            .padding()

            Divider()

            Text("Selected Item: \(selectedItem)")
                .font(.title)
                .padding()

            if !items.isEmpty {
                List(items, id: \.self) { item in
                    Text(item)
                }
                .padding()
            }
        }
        .padding()
    }
}

struct Spinner_Previews: PreviewProvider {
    static var previews: some View {
        Spinner()
    }
}
