//
//  ColorContextTypes.swift
//  search-bar-swiftui
//
//  Created by Mr. Kavinda Dilshan on 2024-07-31.
//

import SwiftUI

@MainActor
public enum ColorContextTypes {
    static func sheet(_ iOSVersion: iOSVersions) -> ColorContextModel {
        switch iOSVersion {
        case .iOS17:
            return .init(
                backgroundColor: .backgroundColor_Sheet(iOSVersion),
                magnifierIconColor: .ForegroundColor_Sheet(iOSVersion),
                placeholderTextColor: .secondary,
                textColor: .primary,
                clearTextButtonColor: .ForegroundColor_Sheet(iOSVersion)
            )
        case .iOS26:
            return .init(
                backgroundColor: .backgroundColor_Sheet(iOSVersion),
                magnifierIconColor: .ForegroundColor_Sheet(iOSVersion),
                placeholderTextColor: .secondary,
                textColor: .primary,
                clearTextButtonColor: .ForegroundColor_Sheet(iOSVersion)
            )
        }
    }
    
    static func navigation(_ iOSVersion: iOSVersions) -> ColorContextModel {
        switch iOSVersion {
        case .iOS17:
            return .init(
                backgroundColor: .backgroundColor_Navigation(iOSVersion),
                magnifierIconColor: .ForegroundColor_Navigation(iOSVersion),
                placeholderTextColor: .secondary,
                textColor: .primary,
                clearTextButtonColor: .ForegroundColor_Navigation(iOSVersion)
            )
        case .iOS26:
            return .init(
                backgroundColor: .backgroundColor_Navigation(iOSVersion),
                magnifierIconColor: .ForegroundColor_Navigation(iOSVersion),
                placeholderTextColor: .secondary,
                textColor: .primary,
                clearTextButtonColor: .ForegroundColor_Navigation(iOSVersion)
            )
        }
    }
}

public struct ColorContextModel: Hashable {
    let backgroundColor: Color
    let magnifierIconColor: Color
    let placeholderTextColor: Color
    let textColor: Color
    let clearTextButtonColor: Color
    
    public init(backgroundColor: Color, magnifierIconColor: Color, placeholderTextColor: Color, textColor: Color, clearTextButtonColor: Color) {
        self.backgroundColor = backgroundColor
        self.magnifierIconColor = magnifierIconColor
        self.placeholderTextColor = placeholderTextColor
        self.textColor = textColor
        self.clearTextButtonColor = clearTextButtonColor
    }
}
