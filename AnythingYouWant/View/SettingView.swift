//
//  SettingView.swift
//  AnythingYouWant
//
//  Created by Gusti Dimas on 10/02/24.
//

import SwiftUI

struct SettingView: View {
    @State private var eraseDataAlert = false
    var body: some View {
        List {
            Button(action: testAja) {
                Text("Choose currencies")
            }
            Button(action: testAja) {
                Text("")
            }
        }
    }
    func testAja() {
        
    }
}

#Preview {
    SettingView()
}
