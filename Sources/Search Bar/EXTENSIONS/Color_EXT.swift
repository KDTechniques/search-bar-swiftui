//
//  Color_EXT.swift
//  search-bar-swiftui
//
//  Created by Mr. Kavinda Dilshan on 2024-07-31.
//

import SwiftUI

extension Color {
    // For Sheets
    static let backgroundColor_Sheet: Color = .init("BackgroundColor_Sheet", bundle: .module)
    static let searchIconsTextColor_Sheet: Color = .init("SearchIconsTextColor_Sheet", bundle: .module)
    
    // For Navigation
    static let backgroundColor_Navigation: Color = .init("BackgroundColor_Navigation", bundle: .module)
    static let searchIconsTextColor_Navigation: Color = .init("SearchIconsTextColor_Navigation", bundle: .module)
    
    static var debug: Self {
        let red = Double.random(in: 0...1)
        let green = Double.random(in: 0...1)
        let blue = Double.random(in: 0...1)
        
        return Color(red: red, green: green, blue: blue)
    }
}
