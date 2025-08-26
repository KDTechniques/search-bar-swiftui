//
//  ColorContextTypes.swift
//  search-bar-swiftui
//
//  Created by Mr. Kavinda Dilshan on 2024-07-31.
//

import SwiftUI

@MainActor
public enum ColorContextTypes {
    static let sheet: ColorContextModel = .init(
        backgroundColor: .backgroundColor_Sheet,
        searchIconTextColor: .searchIconsTextColor_Sheet,
        placeholderTextColor: .secondary,
        textColor: .primary
    )
    
    static let navigation: ColorContextModel = .init(
        backgroundColor: .backgroundColor_Navigation,
        searchIconTextColor: .searchIconsTextColor_Navigation,
        placeholderTextColor: .secondary,
        textColor: .primary
    )
}

public struct ColorContextModel: Hashable {
    let backgroundColor: Color
    let searchIconTextColor: Color
    let placeholderTextColor: Color
    let textColor: Color
}
