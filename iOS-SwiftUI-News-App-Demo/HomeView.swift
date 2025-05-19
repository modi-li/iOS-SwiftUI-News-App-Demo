//
//  HomeView.swift
//  iOS-SwiftUI-News-App-Demo
//
//  Created by Modi (Victor) Li.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    @State private var visibility: NavigationSplitViewVisibility = .all
    
    @State var contentColumnWidth: CGFloat = 400
    
    @State private var selectedNewsCategoryUUID: UUID?
    
    @State private var selectedNewsItemUUID: UUID? = nil
    
    @State private var searchText: String = ""
    
    init() {
        _selectedNewsCategoryUUID = .init(initialValue: DemoData.allNews.first!.id)
    }
    
    var body: some View {
        
        if horizontalSizeClass == .compact {
            NavigationStack {
                ZStack {
                    Color.gray7
                        .ignoresSafeArea()
                    
                    VStack(spacing: 0) {
                        HStack {
                            Text("Home")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            Spacer()
                            Button {
                            } label: {
                                Image(systemName: "magnifyingglass")
                                    .font(.system(size: 20))
                                    .padding(4)
                            }
                            .padding(.top, 4)
                            
                            NavigationLink {
                            } label: {
                                Image(systemName: "map")
                                    .font(.system(size: 19))
                                    .padding(4)
                            }
                            .padding(.top, 4)
                        }
                        .padding(.top, 12)
                        .padding(.horizontal, 14)
                        
                        ScrollView(.horizontal) {
                            HStack(spacing: 6) {
                                ForEach(DemoData.allNews) { category in
                                    Button {
                                        selectedNewsCategoryUUID = category.id
                                    } label: {
                                        Text(category.name)
                                            .font(.system(size: 15, weight: .medium))
                                            .foregroundStyle(selectedNewsCategoryUUID == category.id ? Color.white : Color.gray1)
                                    }
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 13)
                                    .background(selectedNewsCategoryUUID == category.id ? Color.tint : Color.white)
                                    .clipShape(.capsule)
                                    .overlay {
                                        Capsule()
                                            .strokeBorder(selectedNewsCategoryUUID == category.id ? Color.tint : Color.gray5, lineWidth: 0.7)
                                    }
                                }
                            }
                        }
                        .contentMargins(.horizontal, 14)
                        .scrollIndicators(.hidden)
                        .padding(.top, 6)
                        .padding(.bottom, 7)
                        
                        Divider()
                        
                        let selectedNewsCategory = DemoData.allNews.first(where: { $0.id == selectedNewsCategoryUUID })!
                        ScrollView {
                            VStack(spacing: 5) {
                                ForEach(selectedNewsCategory.newsItems) { newsItem in
                                    NavigationLink {
                                        NewsDetailsView(newsItem: newsItem)
                                    } label: {
                                        ListNewsView(newsItem: newsItem)
                                    }
                                }
                            }
                        }
                        .background(Color.gray6)
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
            }
            .foregroundStyle(Color.gray1)
            
        } else {
            NavigationSplitView(columnVisibility: $visibility) {
                List(selection: $selectedNewsCategoryUUID) {
                    Section {
                        ForEach(DemoData.allNews, id: \.id) { newsCategory in
                            Text(newsCategory.name)
                                .font(.system(size: 16, weight: .medium))
                                .foregroundStyle(newsCategory.id == selectedNewsCategoryUUID ? Color.tint : Color.gray1)
                                .padding(.leading, 6)
                        }
                    } header: {
                        Text("Categories")
                            .font(.system(size: 15, weight: .medium))
                            .foregroundStyle(Color.gray3)
                    }
                }
                .scrollContentBackground(.hidden)
                .background(Color.gray7)
                .navigationTitle("Home")
                .navigationBarTitleDisplayMode(.inline)
                .searchable(text: $searchText)
                
                HStack {
                    Spacer()
                    Button {
                    } label: {
                        HStack {
                            Image(systemName: "map")
                                .font(.system(size: 17))
                                .foregroundStyle(Color.gray1)
                            Text("Maps")
                                .font(.system(size: 15, weight: .medium))
                                .foregroundStyle(Color.gray1)
                        }
                    }
                }
                .padding(.top, 10)
                .padding(.trailing, 20)
                .padding(.bottom, 15)
                .navigationSplitViewColumnWidth(250)
            } content: {
                if let selectedNewsCategory = DemoData.allNews.first(where: { $0.id == selectedNewsCategoryUUID }) {
                    
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible(), spacing: 5), GridItem(.flexible())], spacing: 5) {
                            ForEach(selectedNewsCategory.newsItems) { newsItem in
                                GridNewsView(newsItem: newsItem, selectedNewsItemUUID: $selectedNewsItemUUID)
                                    .tag(newsItem.id)
                                    .onTapGesture {
                                        selectedNewsItemUUID = newsItem.id
                                    }
                            }
                        }
                        .padding(.horizontal, 8)
                    }
                    .contentMargins(.top, 12)
                    .navigationSplitViewColumnWidth(500)
                    .background(Color.gray7)
                    .navigationTitle(selectedNewsCategory.name)
                    .navigationBarTitleDisplayMode(.inline)
                }
            } detail: {
                let selectedNewsCategory = DemoData.allNews.first(where: { $0.id == selectedNewsCategoryUUID })
                if let selectedNewsItemUUID = selectedNewsItemUUID, let selectedNewsItem = selectedNewsCategory?.newsItems.first(where: {$0.id == selectedNewsItemUUID}) {
                    NewsDetailsView(newsItem: selectedNewsItem)
                } else {
                    ContentUnavailableView {
                        VStack(spacing: 10) {
                            Image(systemName: "newspaper")
                                .font(.system(size: 36, weight: .medium))
                                .foregroundStyle(Color.gray3)
                            Text("Select News to View")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundStyle(Color.gray2)
                        }
                    }
                    .background(Color.gray7)
                }
            }
            .foregroundStyle(Color.gray1)
        }
    }
}


struct ListNewsView: View {
    
    @State var newsItem: NewsItem
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                HStack(spacing: 6) {
                    Image(systemName: "person.crop.circle.fill")
                        .font(.system(size: 29))
                        .foregroundStyle(Color.gray4)
                        .clipShape(Circle())
                    VStack(alignment: .leading) {
                        Text(newsItem.author.name)
                            .font(.system(size: 16, weight: .medium))
                    }
                }
                Spacer()
                Menu {
                    Button("Option 1") {}
                    Button("Option 2") {}
                    Button("Option 3") {}
                } label: {
                    Image(systemName: "ellipsis")
                        .font(.system(size: 19))
                        .foregroundStyle(Color.gray1)
                }
            }
            .padding(.vertical, 6)
            .padding(.leading, 10)
            .padding(.trailing)
            
            Rectangle()
                .frame(width: .infinity, height: 240)
                .foregroundStyle(newsItem.pictureColor)
            
            
            Text(DemoData.newsItemTitle)
                .font(.system(size: 20, weight: .medium))
                .lineLimit(2)
                .padding(.top, 11)
                .padding(.horizontal, 13)
                .padding(.bottom, 5)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
            
            Text(DemoData.newsItemContent)
                .font(.system(size: 16))
                .lineLimit(3)
                .foregroundStyle(Color.gray2)
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 13)
                .padding(.bottom, 7)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 20) {
                Text(newsItem.date)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(Color.gray3)
                    .padding(.bottom, 2)
                
                Spacer()
                
                Button {
                } label: {
                    Image(systemName: "heart")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundStyle(Color.gray2)
                }
                Button {
                } label: {
                    Image(systemName: "message")
                        .font(.system(size: 17, weight: .medium))
                        .foregroundStyle(Color.gray2)
                }
                Button {
                } label: {
                    Image(systemName: "arrowshape.turn.up.forward")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundStyle(Color.gray2)
                }
            }
            .padding(.top, 4)
            .padding(.leading, 14)
            .padding(.trailing, 16)
            .padding(.bottom, 12)
        }
        .background(.white)
        .contentShape(Rectangle())
    }
}

struct GridNewsView: View {
    
    @State var newsItem: NewsItem
    
    @Binding var selectedNewsItemUUID: UUID?
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 6) {
                Image(systemName: "person.crop.circle.fill")
                    .font(.system(size: 21))
                    .foregroundStyle(Color.gray4)
                    .clipShape(Circle())
                VStack(alignment: .leading) {
                    Text(newsItem.author.name)
                        .font(.system(size: 14, weight: .medium))
                }
                Spacer()
                Menu {
                    Button("Option 1") {}
                    Button("Option 2") {}
                    Button("Option 3") {}
                } label: {
                    Image(systemName: "ellipsis")
                        .font(.system(size: 16))
                        .foregroundStyle(Color.gray2)
                }
            }
            .padding(.top, 8)
            .padding(.leading, 10)
            .padding(.trailing, 11)
            .padding(.bottom, 5)
            
            RoundedRectangle(cornerRadius: 4)
                .frame(width: .infinity, height: 150)
                .padding(.horizontal, 7)
                .foregroundStyle(newsItem.pictureColor)
            
            Text(DemoData.newsItemTitle)
                .font(.system(size: 18, weight: .medium))
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .padding(.top, 9)
                .padding(.horizontal, 10)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(DemoData.newsItemContent)
                .font(.system(size: 15))
                .lineLimit(4)
                .foregroundStyle(Color.gray2)
                .multilineTextAlignment(.leading)
                .padding(.top, 2)
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(newsItem.id == selectedNewsItemUUID ? Color.gray6 : .white)
        .contentShape(Rectangle())
        .clipShape(RoundedRectangle(cornerRadius: 6))
    }
}

#Preview {
    HomeView()
}
