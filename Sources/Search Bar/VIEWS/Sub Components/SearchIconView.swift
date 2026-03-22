//
//  SearchIconView.swift
//  search-bar-swiftui
//
//  Created by Mr. Kavinda Dilshan on 2024-07-31.
//

import SwiftUI

struct SearchIconView: View {
    // MARK: - INJECTED PROPERTIES
    @Environment(SearchBarViewModel.self) private var vm
    @Environment(\.iOSVersion) private var iOSVersion
    @FocusState.Binding var isFocused: Bool
    
    // MARK: - BODY
    var body: some View {
        Image(systemName: "magnifyingglass")
            .resizable()
            .scaledToFit()
            .frame(height: SearchBarValues.horizontalIconsSize)
            .foregroundColor(vm.colors.searchIconTextColor)
            .onTapGesture { isFocused = true }
    }
}

// MARK: - PREVIEWS
#Preview("SearchIconView") {
    @Previewable @FocusState var isFocused: Bool
    
    NavigationStack {
        SearchIconView(isFocused: $isFocused)
    }
    .searchable(text: .constant("Search"))
    .previewModifier(context: .navigation)
}
