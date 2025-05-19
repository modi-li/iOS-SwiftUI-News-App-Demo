//
//  WatchView.swift
//  iOS-SwiftUI-News-App-Demo
//
//  Created by Modi (Victor) Li.
//

import SwiftUI

struct WatchView: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray7
                    .ignoresSafeArea()
                
            }
            .navigationTitle("Watch")
            .navigationBarTitleDisplayMode(.inline)
        }
        .foregroundStyle(Color.gray1)
    }
    
}

#Preview {
    WatchView()
}
