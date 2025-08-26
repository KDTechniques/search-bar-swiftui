//
//  XButtonView.swift
//  search-bar-swiftui
//
//  Created by Mr. Kavinda Dilshan on 2024-07-31.
//

import SwiftUI

struct XButtonView: View {
    // MARK: - INJECTED PROPERTIES
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
        Button {
            handleTap()
        } label: {
            Image(systemName: "xmark.circle.fill")
                .symbolRenderingMode(.monochrome)
                .foregroundStyle(vm.colors.searchIconTextColor)
                .padding(.trailing, 6)
                .animation(.none, value: vm.searchText)
        }
    }
}

// MARK: - PREVIEWS
#Preview("XButtonView") {
    @Previewable @FocusState var isFocused: Bool
    
    XButtonView(text: .constant(""), isFocused: $isFocused)
        .environment(SearchBarViewModel(context: .sheet))
}

// MARK: - EXTENSIONS
extension XButtonView {
    private func handleTap() {
        text = ""
        vm.setSearchText("")
        isFocused = true
    }
}
