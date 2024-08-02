//
//  SearchBar_XButtonView.swift
//  search-bar-swiftui
//
//  Created by Mr. Kavinda Dilshan on 2024-07-31.
//

import SwiftUI

struct SearchBar_XButtonView: View {
    // MARK: - PROPERTIES
    @Environment(SearchBarViewModel.self) private var vm
    
    @Binding var text: String
    @FocusState.Binding var isFocused: Bool
    
    // MARK: - INITIALIZER
    init(text: Binding<String>, isFocused: FocusState<Bool>.Binding) {
        _text = text
        _isFocused = isFocused
    }
    
    // MARK: - BODY
    var body: some View {
        Button { handleTap() } label: {
            Image(systemName: "xmark.circle.fill")
                .symbolRenderingMode(.monochrome)
                .foregroundStyle(vm.colors.searchIconTextColor)
                .opacity(text.isEmpty ? 0 : 1)
                .padding(.trailing, 6)
                .animation(.none, value: text)
        }
    }
}

// MARK: - PREVIEWS
#Preview("SearchBar_XButtonView") {
    @Previewable @FocusState var isFocused: Bool
    SearchBar_XButtonView(text: .constant("123"), isFocused: $isFocused)
        .environment(SearchBarViewModel(colors: ColorContextTypes.sheet))
}

// MARK: - EXTENSIONS
extension SearchBar_XButtonView {
    // MARK: - handleTap
    private func handleTap() {
        text = ""
        isFocused = true
    }
}
