//
//  SearchBarView.swift
//  search-bar-swiftui
//
//  Created by Mr. Kavinda Dilshan on 2024-07-31.
//

import SwiftUI

public struct SearchBarView: View {
    // MARK: - INJECTED PROPERTIES
    @Environment(\.colorScheme) private var colorScheme
    @Binding var searchBarText: String
    private let iOSVersion: iOSVersions
    private let placeholder: String
    private let isSearching: Bool
    
    // MARK: - ASSIGNED PROPERTIES
    @FocusState private var isFocused: Bool
    @State private var vm: SearchBarViewModel
    
    // MARK: - INITIALIZER
    public init(
        iOSVersion: iOSVersions,
        searchBarText: Binding<String>,
        placeholder: String,
        context: ContextTypes,
        isSearching: Bool = false
    ) {
        _vm = .init(initialValue: .init(context: context, iOSVersion: iOSVersion))
        _searchBarText = searchBarText
        self.iOSVersion = iOSVersion
        self.placeholder = placeholder
        self.isSearching = isSearching
    }
    
    // MARK: - BODY
    public var body: some View {
        HStack(spacing: 0) {
            SearchIconView(isFocused: $isFocused)
            TextFieldView(text: $searchBarText, isFocused: $isFocused, placeholder: placeholder)
        }
        .padding(.leading, SearchBarValues.magnifierLeadingPadding(iOSVersion))
        .padding(.trailing, SearchBarValues.TextFieldTrailingPadding(iOSVersion))
        .frame(height: SearchBarValues.containerHeight(iOSVersion))
        .overlay(alignment: .trailing) { trailingOverlay_1 } /// Trailing Fade Effect
        .overlay(alignment: .trailing) { trailingOverlay_2 } /// Clear Text Button / Circular Progress
        .glassEffectViewModifier(iOSVersion, vm: vm, colorScheme: colorScheme)
        .containerBackgroundWithClipShape(iOSVersion, vm: vm)
        .padding(.horizontal)
        .overlay(alignment: .trailing) { trailingOverlay_3 } /// Dismiss Button
        .padding(.trailing, vm.searchBarTrailingPadding)
        .environment(vm)
        .environment(\.iOSVersion, iOSVersion)
        .onChange(of: searchBarText) { onSearchTextChange($1) }
        .onChange(of: isSearching) { vm.setIsSearching($1) }
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
                        iOSVersion: .random(),
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
                iOSVersion: .random(),
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
                iOSVersion: .random(),
                searchBarText: $text,
                placeholder: "Search",
                context: .custom(.init(
                    backgroundColor: .yellow,
                    magnifierIconColor: .blue,
                    placeholderTextColor: .green,
                    textColor: .red,
                    clearTextButtonColor: .purple
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
    private var trailingOverlay_1: some View {
        TrailingFadeEffectView(isFocused: $isFocused)
    }
    
    @ViewBuilder
    private var trailingOverlay_2: some View {
        if vm.showXButton() {
            ClearTextButtonView(text: $searchBarText, isFocused: $isFocused)
        } else if vm.showCircularProgress() {
            CircularProgressView()
        }
    }
    
    private var trailingOverlay_3: some View {
        DismissButtonView(text: $searchBarText, isFocused: $isFocused)
    }
    
    private func onSearchTextChange(_ value: String) {
        vm.setSearchText(value)
    }
}

fileprivate extension View {
    @ViewBuilder
    func glassEffectViewModifier(_ iOSVersion: iOSVersions, vm: SearchBarViewModel, colorScheme: ColorScheme) -> some View {
        switch iOSVersion {
        case .iOS17:
            self
        case .iOS26:
            if #available(iOS 26.0, *) {
                let glass: Glass = colorScheme == .dark ? .regular : .clear
                
                self
                    .clipShape(.capsule)
                    .glassEffect(glass.tint(vm.colors.backgroundColor).interactive())
            } else {
                self
            }
        }
    }
    
    @ViewBuilder
    func containerBackgroundWithClipShape(_ iOSVersion: iOSVersions, vm: SearchBarViewModel) -> some View {
        switch iOSVersion {
        case .iOS17:
            self
                .background(vm.colors.backgroundColor)
                .clipShape(.rect(cornerRadius: 10))
            
        case .iOS26:
            self
        }
    }
}
