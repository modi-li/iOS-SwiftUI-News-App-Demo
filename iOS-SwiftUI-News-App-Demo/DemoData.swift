//
//  DemoData.swift
//  iOS-SwiftUI-News-App-Demo
//
//  Created by Modi (Victor) Li.
//

import SwiftUI

class DemoData {
    
    static let newsItemPictureColor1 = Color.fromRGB(red: 255, green: 246, blue: 246)
    static let newsItemPictureColor2 = Color.fromRGB(red: 243, green: 252, blue: 244)
    static let newsItemPictureColor3 = Color.fromRGB(red: 251, green: 247, blue: 255)
    static let newsItemPictureColor4 = Color.fromRGB(red: 242, green: 247, blue: 255)
    static let newsItemPictureColor5 = Color.fromRGB(red: 255, green: 250, blue: 246)
    
    static let allNews = [
        NewsCategory(name: "For You", newsItems: [
            NewsItem(author: NewsAuthor(name: "Author 1"), date: "Sep 25", pictureColor: newsItemPictureColor1),
            NewsItem(author: NewsAuthor(name: "Author 2"), date: "Sep 22", pictureColor: newsItemPictureColor2),
            NewsItem(author: NewsAuthor(name: "Author 2"), date: "Sep 22", pictureColor: newsItemPictureColor3),
            NewsItem(author: NewsAuthor(name: "Author 3"), date: "Sep 21", pictureColor: newsItemPictureColor4),
            NewsItem(author: NewsAuthor(name: "Author 5"), date: "Sep 18", pictureColor: newsItemPictureColor5),
        ]),
        NewsCategory(name: "Business", newsItems: [
            NewsItem(author: NewsAuthor(name: "Author 2"), date: "Sep 25", pictureColor: newsItemPictureColor1),
            NewsItem(author: NewsAuthor(name: "Author 4"), date: "Sep 25", pictureColor: newsItemPictureColor3),
            NewsItem(author: NewsAuthor(name: "Author 4"), date: "Sep 24", pictureColor: newsItemPictureColor5),
            NewsItem(author: NewsAuthor(name: "Author 5"), date: "Sep 24", pictureColor: newsItemPictureColor2),
            NewsItem(author: NewsAuthor(name: "Author 6"), date: "Sep 23", pictureColor: newsItemPictureColor4),
        ]),
        NewsCategory(name: "Technology", newsItems: [
            NewsItem(author: NewsAuthor(name: "Author 3"), date: "Sep 25", pictureColor: newsItemPictureColor2),
            NewsItem(author: NewsAuthor(name: "Author 2"), date: "Sep 25", pictureColor: newsItemPictureColor4),
            NewsItem(author: NewsAuthor(name: "Author 6"), date: "Sep 23", pictureColor: newsItemPictureColor1),
            NewsItem(author: NewsAuthor(name: "Author 1"), date: "Sep 23", pictureColor: newsItemPictureColor3),
            NewsItem(author: NewsAuthor(name: "Author 1"), date: "Sep 21", pictureColor: newsItemPictureColor5),
        ]),
        NewsCategory(name: "Local", newsItems: []),
        NewsCategory(name: "World", newsItems: []),
        NewsCategory(name: "Health", newsItems: [])
    ]
    
    static let streamNewsItems = [allNews[0].newsItems[0], allNews[0].newsItems[1], allNews[0].newsItems[2]]
    
    static let newsItemTitle = "Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit"
    
    static let newsItemContent = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    
}
