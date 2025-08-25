//
//  SearchBarView.swift
//  search-bar-swiftui
//
//  Created by Mr. Kavinda Dilshan on 2024-07-31.
//

import SwiftUI

public struct SearchBarView: View {
    // MARK: - INJECTED PROPERTIES
    @Binding var searchBarText: String
    private let placeholder: String
    private let context: ContextTypes
    private let isSearching: Bool
    
    // MARK: - ASSIGNED PROPERTIES
    @FocusState private var isFocused: Bool
    @State private var vm: SearchBarViewModel
    
    // MARK: - INITIALIZER
    public init(
        searchBarText: Binding<String>,
        placeholder: String,
        context: ContextTypes,
        isSearching: Bool = false
    ) {
        _vm = .init(initialValue: .init(context: context))
        _searchBarText = searchBarText
        self.placeholder = placeholder
        self.context = context
        self.isSearching = isSearching
    }
    
    // MARK: - BODY
    public var body: some View {
        HStack(spacing: 0) {
            SearchIconView()
            TextFieldView(isFocused: $isFocused, placeholder: placeholder)
        }
        .padding(.horizontal, 6)
        .padding(.vertical, 7)
        .overlay(alignment: .trailing) { trailingOverlay_1 }
        .overlay(alignment: .trailing) { trailingOverlay_2 }
        .background(vm.colors.backgroundColor)
        .clipShape(.rect(cornerRadius: 10))
        .padding(.horizontal)
        .overlay(alignment: .trailing) { trailingOverlay_3 }
        .padding(.trailing, vm.searchBarTrailingPadding)
        .environment(vm)
        .onChange(of: searchBarText) { vm.setSearchText($1) }
        .onChange(of: isSearching) { vm.setIsSearching($1) }
        .onChange(of: context) { vm.setColors(context: $1) }
    }
}

// MARK: - PREVIEWS
#Preview("SearchBarView - .sheet") {
    @Previewable @State var text: String = ""
    
    Color.clear
        .sheet(isPresented: .constant(true)) {
            NavigationStack {
                VStack {
                    SearchBarView(
                        searchBarText: $text,
                        placeholder: "Search",
                        context: .sheet
                    )
                    .padding(.top, 20)
                    
                    Spacer()
                }
                .presentationDragIndicator(.visible)
                .searchable(text: $text)
            }
        }
}

#Preview("SearchBarView - .navigation") {
    @Previewable @State var text: String = ""
    
    NavigationStack {
        VStack {
            SearchBarView(
                searchBarText: $text,
                placeholder: "Search",
                context: .navigation
            )
            .padding(.top, 20)
            
            Spacer()
        }
        .searchable(text: $text)
    }
}

#Preview("SearchBarView - .custom") {
    @Previewable @State var text: String = ""
    
    NavigationStack {
        VStack {
            SearchBarView(
                searchBarText: $text,
                placeholder: "Search",
                context: .custom(.init(
                    backgroundColor: .yellow,
                    searchIconTextColor: .blue,
                    placeholderTextColor: .green,
                    textColor: .red
                ))
            )
            .tint(.purple)
            .padding(.top, 20)
            
            Spacer()
        }
        .searchable(text: $text)
    }
}

// MARK: - EXTENSIONS
extension SearchBarView {
    // MARK: - trailingOverlay_1
    private var trailingOverlay_1: some View {
        TrailingFadeEffectView(isFocused: $isFocused)
    }
    
    // MARK: - trailingOverlay_2
    @ViewBuilder
    private var trailingOverlay_2: some View {
        CircularProgressView()
        XButtonView(isFocused: $isFocused)
    }
    
    // MARK: - trailingOverlay_3
    private var trailingOverlay_3: some View {
        CancelButtonView(isFocused: $isFocused)
    }
}
