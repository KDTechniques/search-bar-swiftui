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
    @FocusState.Binding var isFocused: Bool
    
    // MARK: - BODY
    var body: some View {
        Image(systemName: "magnifyingglass")
            .foregroundColor(vm.colors.searchIconTextColor)
            .onTapGesture { isFocused = true }
    }
}

// MARK: - PREVIEWS
#Preview("SearchIconView") {
    @Previewable @FocusState var isFocused: Bool
    
    SearchIconView(isFocused: $isFocused)
        .environment(SearchBarViewModel(context: .sheet))
}
