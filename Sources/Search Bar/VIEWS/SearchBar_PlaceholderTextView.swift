//
//  SearchBar_PlaceholderTextView.swift
//  search-bar-swiftui
//
//  Created by Mr. Kavinda Dilshan on 2024-07-31.
//

import SwiftUI

struct SearchBar_PlaceholderTextView: View {
    // MARK: - PROPERTIES
    @Environment(SearchBarViewModel.self) private var vm
    
    let placeholder: String
    let text: String
    
    // MARK: - INITIALIZER
    init(placeholder: String, text: String) {
        self.placeholder = placeholder
        self.text = text
    }
    
    // MARK: - BODY
    var body: some View {
        Text(placeholder)
            .foregroundColor(vm.colors.placeholderTextColor)
            .opacity(text.isEmpty ? 1 : 0)
            .allowsHitTesting(false)
    }
}

//MARK: - PREVIEWS
#Preview("SearchBar_PlaceholderTextView") {
    SearchBar_PlaceholderTextView(placeholder: "Search", text: "")
        .environment(SearchBarViewModel(colors: ColorContextTypes.sheet))
}

