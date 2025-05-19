//
//  Models.swift
//  iOS-SwiftUI-News-App-Demo
//
//  Created by Modi (Victor) Li.
//

import SwiftUI

struct NewsCategory: Identifiable {
    let id: UUID
    let name: String
    let newsItems: [NewsItem]
    
    init(name: String, newsItems: [NewsItem]) {
        self.id = UUID()
        self.name = name
        self.newsItems = newsItems
    }
}

struct NewsAuthor {
    let id: UUID
    let name: String
    
    init(name: String) {
        self.id = UUID()
        self.name = name
    }
}

struct NewsItem: Identifiable {
    let id: UUID
    let author: NewsAuthor
    let date: String
    let pictureColor: Color
    
    init(author: NewsAuthor, date: String, pictureColor: Color) {
        self.id = UUID()
        self.author = author
        self.date = date
        self.pictureColor = pictureColor
    }
}
