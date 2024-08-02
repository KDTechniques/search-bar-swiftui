//
//  SearchBar_TextFieldView.swift
//  search-bar-swiftui
//
//  Created by Mr. Kavinda Dilshan on 2024-07-31.
//

import SwiftUI

struct SearchBar_TextFieldView: View {
    // MARK: - PROPERTIES
    @Environment(SearchBarViewModel.self) private var vm
    
    @Binding var text: String
    @FocusState.Binding var isFocused: Bool
    let placeholder: String
    
    // MARK: - INITIALIZER
    init(
        text: Binding<String>,
        isFocused: FocusState<Bool>.Binding,
        placeholder: String
    ) {
        _text = text
        _isFocused = isFocused
        self.placeholder = placeholder
    }
    
    // MARK: - BODY
    var body: some View {
        TextField("", text: $text) {
            handleOnFocus($0)
        } onCommit: {
            handleOnCommit()
        }
        .focused($isFocused)
        .foregroundStyle(vm.colors.textColor)
        .overlay(alignment: .leading) {
            SearchBar_PlaceholderTextView(
                placeholder: placeholder,
                text: text
            )
        }
        .padding(.leading, 5)
        .padding(.trailing, isFocused ? 28 : 0)
    }
}

// MARK: - PREVIEWS
#Preview("SearchBar_TextFieldView") {
    @Previewable @State var text: String = ""
    @Previewable @FocusState var isFocused: Bool
    SearchBar_TextFieldView(
        text: $text,
        isFocused: $isFocused,
        placeholder: "Search"
    )
    .environment(SearchBarViewModel(colors: ColorContextTypes.sheet))
}

// MARK: - EXTENSIONS
extension SearchBar_TextFieldView {
    // MARK: - FUNCTIONS
    
    // MARK: - handleOnFocus
    private func handleOnFocus(_ state: Bool) {
        vm.searchBarAnimation = (text: text, state: state)
    }
    
    // MARK: - handleOnCommit
    private func handleOnCommit() {
        UIApplication.shared
            .sendAction(
                #selector(UIResponder.resignFirstResponder),
                to: nil, from: nil, for: nil
            )
    }
}
