//
//  Utilities.swift
//  search-bar-swiftui
//
//  Created by Mr. Kavinda Dilshan on 2025-08-26.
//

import Foundation

@MainActor
struct Utilities {
    static func setColors(context: ContextTypes, iOSVersion: iOSVersions) -> ColorContextModel {
        switch context {
        case .sheet:
            return ColorContextTypes.sheet(iOSVersion)
            
        case .navigation:
            return ColorContextTypes.navigation(iOSVersion)
            
        case .custom(let colors):
            return colors
        }
    }
}
