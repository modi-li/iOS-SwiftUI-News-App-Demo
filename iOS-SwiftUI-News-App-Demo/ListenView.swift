//
//  ListenView.swift
//  iOS-SwiftUI-News-App-Demo
//
//  Created by Modi (Victor) Li.
//

import SwiftUI

struct ListenView: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray7
                    .ignoresSafeArea()
                
            }
            .navigationTitle("Listen")
            .navigationBarTitleDisplayMode(.inline)
        }
        .foregroundStyle(Color.gray1)
    }
    
}

#Preview {
    ListenView()
}
