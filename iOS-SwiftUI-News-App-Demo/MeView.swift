//
//  MeView.swift
//  iOS-SwiftUI-News-App-Demo
//
//  Created by Modi (Victor) Li.
//

import SwiftUI

struct MeView: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray7
                    .ignoresSafeArea()
                
            }
            .navigationTitle("Me")
            .navigationBarTitleDisplayMode(.inline)
        }
        .foregroundStyle(Color.gray1)
    }
    
}

#Preview {
    MeView()
}
