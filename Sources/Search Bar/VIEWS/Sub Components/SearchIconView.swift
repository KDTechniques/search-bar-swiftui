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
            .fontWeightViewModifier(iOSVersion)
            .onTapGesture { isFocused = true }
    }
}

// MARK: - PREVIEWS
#Preview("SearchIconView") {
    @Previewable @FocusState var isFocused: Bool
    
    NavigationStack {
        SearchIconView(isFocused: $isFocused)
            .padding(.top, 700)
    }
    .searchable(text: .constant("Search"), placement: .toolbar)
    .environment(SearchBarViewModel(context: .sheet))
    .environment(\.iOSVersion, .random())
    .overlay {
        Group {
            Rectangle()
                .foregroundStyle(.red)
                .frame(height: 0.5)
                .offset(y: -2)
            
            Rectangle()
                .foregroundStyle(.red)
                .frame(height: 0.5)
                .offset(y: 15)
        }
        .offset(y: 406)
    }
}

// MARK: - EXTENSIONS
fileprivate extension View {
    @ViewBuilder
    func fontWeightViewModifier(_ iOSVersion: iOSVersions) -> some View {
        switch iOSVersion {
        case .iOS17:
            self
            
        case .iOS26:
            self
                .fontWeight(.medium)
        }
    }
}
