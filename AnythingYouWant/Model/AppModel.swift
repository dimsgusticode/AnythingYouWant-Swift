//
//  AppModel.swift
//  AnythingYouWant
//
//  Created by Gusti Dimas on 10/02/24.
//

import SwiftUI

class AppItem {
    var name: String
    var description: String
    var color: Color
    var destination: AnyView
    
    init(name: String, description: String, color: Color, destination: AnyView) {
        self.name = name
        self.description = description
        self.color = color
        self.destination = destination
    }
}

class AppModel {
    static let shared = AppModel()
    
    let apps: [AppItem] = [
        AppItem(name: "Todolist", description: "", color: .blue, destination: AnyView(Todolist())),
        AppItem(name: "Discount Calculator", description: "", color: .yellow, destination: AnyView(DiscountCalculator())),
        AppItem(name: "Random Picker", description: "", color: .orange, destination: AnyView(Spinner())),
        AppItem(name: "Expense Tracker", description: "", color: .purple, destination: AnyView(ExpenseTracker()))
    ]
}
