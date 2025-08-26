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
    
    // MARK: - BODY
    var body: some View {
        Image(systemName: "magnifyingglass")
            .foregroundColor(vm.colors.searchIconTextColor)
    }
}

// MARK: - PREVIEWS
#Preview("SearchIconView") {
    SearchIconView()
        .environment(SearchBarViewModel(context: .sheet))
}
