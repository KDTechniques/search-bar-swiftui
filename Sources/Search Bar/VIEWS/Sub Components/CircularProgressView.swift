//
//  CircularProgressView.swift
//  search-bar-swiftui
//
//  Created by Mr. Kavinda Dilshan on 2025-08-25.
//

import SwiftUI

struct CircularProgressView: View {
    // MARK: - INJECTED PROPERTIES
    @Environment(SearchBarViewModel.self) private var vm
    @Environment(\.iOSVersion) private var iOSVersion
    
    // MARK: - BODY
    var body: some View {
        let iconSize: CGFloat = SearchBarValues.horizontalIconsSize
        
        ProgressView()
            .scaleEffect(0.8)
            .frame(width: iconSize, height: iconSize)
            .padding(.trailing, SearchBarValues.clearTextButtonTrailingPadding(iOSVersion))
    }
}

// MARK: - PREVIEWS
#Preview("CircularProgressView") {
    CircularProgressView()
        .previewModifier(context: .sheet)
        .environment(\.iOSVersion, .random())
}
