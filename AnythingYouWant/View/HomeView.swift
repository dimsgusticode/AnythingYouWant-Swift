//
//  HomeView.swift
//  AnythingYouWant
//
//  Created by Gusti Dimas on 10/02/24.
//

import SwiftUI

struct HomeView: View {
    let apps = AppModel.shared.apps
    
    let columns: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 10), count: 2) // Change the count as needed
    
    var body: some View {
        NavigationView {
            VStack {
                TabTitleView()
                    .padding()
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(apps, id: \.name) { app in
                            NavigationLink(destination: app.destination) {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(Color(app.color))
                                        .cornerRadius(10)
                                        .aspectRatio(1.5, contentMode: .fit)
                                    VStack {
                                        Text(app.name)
                                            .foregroundColor(.white)
                                            .font(.headline)
                                        Text(app.description)
                                            .foregroundColor(.white)
                                            .font(.subheadline)
                                    }
                                    .padding()
                                }
                                .padding(EdgeInsets(top: 1, leading: 10, bottom: 1, trailing: 10))
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationBarTitle("Home")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
