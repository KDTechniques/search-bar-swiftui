//
//  Color_EXT.swift
//  search-bar-swiftui
//
//  Created by Mr. Kavinda Dilshan on 2024-07-31.
//

import SwiftUI

extension Color {
    // For Sheets
    static func backgroundColor_Sheet(_ iOSVersion: iOSVersions) -> Color {
        switch iOSVersion {
        case .iOS17:
            return .init("BackgroundColor_Sheet_iOS17", bundle: .module)
        case .iOS26:
            return .init("BackgroundColor_Sheet_iOS26", bundle: .module)
        }
    }
    
    static func ForegroundColor_Sheet(_ iOSVersion: iOSVersions) -> Color {
        switch iOSVersion {
        case .iOS17:
            return .init("ForegroundColor_Sheet_iOS17", bundle: .module)
        case .iOS26:
            return .init("ForegroundColor_Sheet_iOS26", bundle: .module)
        }
    }
    
    // For Navigation
    static func backgroundColor_Navigation(_ iOSVersion: iOSVersions) -> Color {
        switch iOSVersion {
        case .iOS17:
            return .init("BackgroundColor_Navigation_iOS17", bundle: .module)
        case .iOS26:
            return .init("BackgroundColor_Navigation_iOS26", bundle: .module)
        }
    }
    
    static func ForegroundColor_Navigation(_ iOSVersion: iOSVersions) -> Color {
        switch iOSVersion {
        case .iOS17:
            return .init("ForegroundColor_Navigation_iOS17", bundle: .module)
        case .iOS26:
            return .init("ForegroundColor_Navigation_iOS26", bundle: .module)
        }
    }
    
    static var debug: Self {
        let red = Double.random(in: 0...1)
        let green = Double.random(in: 0...1)
        let blue = Double.random(in: 0...1)
        
        return Color(red: red, green: green, blue: blue)
    }
}
