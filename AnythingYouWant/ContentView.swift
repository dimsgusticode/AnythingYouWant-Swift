//
//  ContentView.swift
//  AnythingYouWant
//
//  Created by Gusti Dimas on 10/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                HomeView()
                Spacer()
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            NavigationView {
                SettingView()
                    .navigationTitle("Setting")
            }
            .tabItem {
                Image(systemName: "gear")
                Text("Setting")
            }
        }
    }
}

#Preview {
    ContentView()
}
