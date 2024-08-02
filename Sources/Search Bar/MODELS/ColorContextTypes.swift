//
//  ColorContextTypes.swift
//  search-bar-swiftui
//
//  Created by Mr. Kavinda Dilshan on 2024-07-31.
//

import SwiftUI

@MainActor
public enum ColorContextTypes {
    static let sheet: ColorContext = .init(
        backgroundColor: .backgroundColor_Sheet,
        searchIconTextColor: .searchIconsTextColor_Sheet,
        placeholderTextColor: .secondary,
        textColor: .primary
    )
    
    static let navigation: ColorContext = .init(
        backgroundColor: .backgroundColor_Navigation,
        searchIconTextColor: .searchIconsTextColor_Navigation,
        placeholderTextColor: .secondary,
        textColor: .primary
    )
}

public struct ColorContext {
    // MARK: - PROPERTIES
    let backgroundColor: Color
    let searchIconTextColor: Color
    let placeholderTextColor: Color
    let textColor: Color
    
    // MARK: - INITIALIZER
    public init(backgroundColor: Color, searchIconTextColor: Color, placeholderTextColor: Color, textColor: Color) {
        self.backgroundColor = backgroundColor
        self.searchIconTextColor = searchIconTextColor
        self.placeholderTextColor = placeholderTextColor
        self.textColor = textColor
    }
}
