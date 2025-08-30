//
//  TextFieldView.swift
//  search-bar-swiftui
//
//  Created by Mr. Kavinda Dilshan on 2024-07-31.
//

import SwiftUI

struct TextFieldView: View {
    // MARK: - INJECTED PROPERTIES
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
        .overlay(alignment: .leading) { PlaceholderTextView(placeholder) }
        .padding(.leading, 5)
        .padding(.trailing, isFocused ? 28 : 0)
    }
}

// MARK: - PREVIEWS
#Preview("TextFieldView") {
    @Previewable @State var text: String = ""
    @Previewable @FocusState var isFocused: Bool
    
    TextFieldView(
        text: $text,
        isFocused: $isFocused,
        placeholder: text.isEmpty ? "Search" : ""
    )
    .previewModifier(context: .sheet)
}

// MARK: - EXTENSIONS
extension TextFieldView {
    private func handleOnFocus(_ boolean: Bool) {
        vm.handleAnimatedCancelButtonOnSearchTextNFocusChange(isFocused: boolean)
    }
    
    private func handleOnCommit() {
        /// On commit, the TextField API automatically sets `isFocused` to false by default,
        /// so there’s no need to pass `isFocused` here.
        vm.handleAnimatedCancelButtonOnSearchTextNFocusChange(isFocused: false)
        
        // Dismiss the keyboard
        UIApplication.shared
            .sendAction(
                #selector(UIResponder.resignFirstResponder),
                to: nil, from: nil, for: nil
            )
    }
}
