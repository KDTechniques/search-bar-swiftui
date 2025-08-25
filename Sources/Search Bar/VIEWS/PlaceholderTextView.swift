//
//  PlaceholderTextView.swift
//  search-bar-swiftui
//
//  Created by Mr. Kavinda Dilshan on 2024-07-31.
//

import SwiftUI

struct PlaceholderTextView: View {
    // MARK: - INJECTED PROPERTIES
    @Environment(SearchBarViewModel.self) private var vm
    let placeholder: String
    
    // MARK: - INITIALIZER
    init(_ placeholder: String) {
        self.placeholder = placeholder
    }
    
    // MARK: - BODY
    var body: some View {
        Text(placeholder)
            .foregroundColor(vm.colors.placeholderTextColor)
            .opacity(vm.searchText.isEmpty ? 1 : 0)
            .allowsHitTesting(false)
    }
}

//MARK: - PREVIEWS
#Preview("PlaceholderTextView") {
    PlaceholderTextView("Search")
        .environment(SearchBarViewModel(context: .sheet))
}

