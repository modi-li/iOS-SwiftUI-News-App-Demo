//
//  Color+Extension.swift
//  iOS-SwiftUI-News-App-Demo
//
//  Created by Modi (Victor) Li.
//

import SwiftUI

extension Color {
    
    static func fromRGB(red: Double, green: Double, blue: Double) -> Color {
        return Color(red: red / 255.0, green: green / 255.0, blue: blue / 255.0)
    }
    
    static let tint = fromRGB(red: 255, green: 93, blue: 93)
    
    static let gray1 = fromRGB(red: 31, green: 31, blue: 31)
    
    static let gray2 = fromRGB(red: 60, green: 60, blue: 60)
    
    static let gray3 = fromRGB(red: 126, green: 126, blue: 126)
    
    static let gray4 = fromRGB(red: 192, green: 192, blue: 192)
    
    static let gray5 = fromRGB(red: 225, green: 225, blue: 225)
    
    static let gray6 = fromRGB(red: 244, green: 244, blue: 244)
    
    static let gray7 = fromRGB(red: 250, green: 250, blue: 250)
}
