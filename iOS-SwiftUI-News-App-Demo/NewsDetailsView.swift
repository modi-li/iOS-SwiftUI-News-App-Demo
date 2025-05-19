//
//  NewsDetailsView.swift
//  iOS-SwiftUI-News-App-Demo
//
//  Created by Modi (Victor) Li.
//

import SwiftUI

struct NewsDetailsView: View {
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    let newsItem: NewsItem
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    Rectangle()
                        .frame(width: .infinity, height: horizontalSizeClass == .compact ? 260 : 300)
                        .foregroundStyle(newsItem.pictureColor)
                    
                    Text(DemoData.newsItemTitle)
                        .font(.system(size: 25, weight: .medium))
                        .padding(.top, 15)
                        .padding(.horizontal, 14)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                    
                    HStack(spacing: 6) {
                        Image(systemName: "person.crop.circle.fill")
                            .font(.system(size: 28))
                            .foregroundStyle(Color.gray4)
                            .clipShape(Circle())
                        Text(newsItem.author.name)
                            .font(.system(size: 17, weight: .medium))
                        Spacer()
                        Text(newsItem.date)
                            .font(.system(size: 15, weight: .medium))
                            .foregroundStyle(Color.gray3)
                    }
                    .padding(.top, 6)
                    .padding(.leading, 12)
                    .padding(.trailing, 20)
                    
                    Text(DemoData.newsItemContent)
                        .font(.system(size: 17, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 15)
                        .padding(.horizontal, 15)
                        .padding(.bottom, 5)
                }
            }
            .contentMargins(.bottom, 20)
        }
        .toolbar(.hidden, for: .tabBar)
        .foregroundStyle(Color.gray1)
    }
    
}

#Preview {
    NewsDetailsView(newsItem: DemoData.allNews[0].newsItems[0])
}
