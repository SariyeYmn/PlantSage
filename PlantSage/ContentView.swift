//
//  ContentView.swift
//  PlantSage
//
//  Created by Sariye Yaman on 22.08.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            //Bottom bar
            Home()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(.ultraThickMaterial, for: .tabBar)
            
            Text("Search View")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Explore")
                }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(.ultraThickMaterial, for: .tabBar)
            
            Text("Profile View")
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(.ultraThickMaterial, for: .tabBar)
            
        }
        .tint(.black)
    }
}

#Preview {
    ContentView()
}
