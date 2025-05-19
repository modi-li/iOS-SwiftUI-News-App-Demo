//
//  ContentView.swift
//  iOS-SwiftUI-News-App-Demo
//
//  Created by Modi (Victor) Li.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithDefaultBackground()
        
        appearance.backgroundColor = .systemBackground.withAlphaComponent(0.2)
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor(Color.gray4)
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor(Color.gray4)]
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        TabView {
            Tab("Home", systemImage: "square.text.square") {
                HomeView()
            }
            Tab("Watch", systemImage: "play.rectangle") {
                WatchView()
            }
            Tab("Listen", systemImage: "headphones") {
                ListenView()
            }
            Tab("Me", systemImage: "person") {
                MeView()
            }
        }
        .accentColor(Color.tint)
    }
}

#Preview {
    ContentView()
}
