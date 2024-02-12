//
//  TabTitleView.swift
//  AnythingYouWant
//
//  Created by Gusti Dimas on 10/02/24.
//

import SwiftUI

struct TabTitleView: View {
    var body: some View {
        HStack {
            Text("Welcome, User!")
            Spacer()
            Menu {
                Button("My Profile", action: testAja)
            } label: {
                Label("", systemImage: "person.circle")
                    .font(.title)
            }
        }
    }
    func testAja() {
        
    }
}

#Preview {
    TabTitleView()
}
