//
//  SearchBar_CancelButtonView.swift
//  search-bar-swiftui
//
//  Created by Mr. Kavinda Dilshan on 2024-07-31.
//

import SwiftUI

struct SearchBar_CancelButtonView: View {
    // MARK: - PROPERTIES
    @Binding var text: String
    @FocusState.Binding var isFocused: Bool
    let vm: SearchBarViewModel
    
    // MARK: - INITIALIZER
    init(text: Binding<String>, isFocused: FocusState<Bool>.Binding, vm: SearchBarViewModel) {
        _text = text
        _isFocused = isFocused
        self.vm = vm
    }
    
    // MARK: - BODY
    var body: some View {
        Button {
            handleTap()
        } label: {
            Text("Cancel")
        }
        .offset(x: vm.cancelButtonOffsetX)
        .opacity(vm.cancelButtonOpacity)
    }
}

// MARK: - PREVIEWS
#Preview("SearchBar_CancelButtonView") {
    @Previewable @FocusState var isFocused: Bool
    let vm: SearchBarViewModel = .init(colors: ColorContextTypes.sheet)
    
    SearchBar_CancelButtonView(
        text: .constant("123"),
        isFocused: $isFocused,
        vm: vm
    )
    .onAppear { vm.cancelButtonOpacity = 1.0 }
}

// MARK: - EXTENSIONS
extension SearchBar_CancelButtonView {
    // MARK: - FUNCTIONS
    
    // MARK: - handleTap
    private func handleTap() {
        text = ""
        vm.searchBarAnimation = (text: text, state: false)
        isFocused = false
    }
}
