//
//  SearchBarView.swift
//  search-bar-swiftui
//
//  Created by Mr. Kavinda Dilshan on 2024-07-31.
//

import SwiftUI

public struct SearchBarView: View {
    // MARK: - PROPERTIES
    @Binding var searchBarText: String
    let placeholder: String
    
    // MARK: - PRIVATE PROPERTIES
    @FocusState.Binding var isFocused: Bool
    @State private var vm: SearchBarViewModel
    
    // MARK: - INITIALIZER
    public init(
        searchBarText: Binding<String>,
        placeholder: String,
        context: ContextTypes,
        customColors: ColorContext?,
        isFocused: FocusState<Bool>.Binding
    ) {
        _searchBarText = searchBarText
        self.placeholder = placeholder
        
        var colors: ColorContext {
            switch context {
            case .sheet: ColorContextTypes.sheet
            case .navigation: ColorContextTypes.navigation
            case .custom: customColors ?? ColorContextTypes.navigation
            }
        }
        
        _vm = .init(initialValue: .init(colors: colors))
        _isFocused = isFocused
    }
    
    // MARK: - BODY
    public var body: some View {
        HStack(spacing: 0) {
            SearchBar_SearchIconView()
            
            SearchBar_TextFieldView(
                text: $searchBarText,
                isFocused: $isFocused,
                placeholder: placeholder
            )
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
    }
}

// MARK: - PREVIEWS
#Preview("SearchBarView - .sheet") {
    @Previewable @State var text: String = ""
    @FocusState var isFocused: Bool
    
    Color.clear
        .sheet(isPresented: .constant(true)) {
            NavigationStack {
                VStack {
                    SearchBarView(
                        searchBarText: $text,
                        placeholder: "Search",
                        context: .sheet,
                        customColors: nil,
                        isFocused: $isFocused
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
    @FocusState var isFocused: Bool
    
    NavigationStack {
        VStack {
            SearchBarView(
                searchBarText: $text,
                placeholder: "Search",
                context: .navigation,
                customColors: nil,
                isFocused: $isFocused
            )
            .padding(.top, 20)
            
            Spacer()
        }
        .searchable(text: $text)
    }
}

#Preview("SearchBarView - .custom") {
    @Previewable @State var text: String = ""
    @FocusState var isFocused: Bool
    
    NavigationStack {
        VStack {
            SearchBarView(
                searchBarText: $text,
                placeholder: "Search",
                context: .custom,
                customColors: .init(
                    backgroundColor: .yellow,
                    searchIconTextColor: .blue,
                    placeholderTextColor: .green,
                    textColor: .red
                ),
                isFocused: $isFocused
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
        SearchBar_TrailingFadeEffectView(isFocused: $isFocused)
    }
    
    // MARK: - trailingOverlay_2
    private var trailingOverlay_2: some View {
        SearchBar_XButtonView(text: $searchBarText, isFocused: $isFocused)
    }
    
    // MARK: - trailingOverlay_3
    private var trailingOverlay_3: some View {
        SearchBar_CancelButtonView(
            text: $searchBarText,
            isFocused: $isFocused,
            vm: vm
        )
    }
}
