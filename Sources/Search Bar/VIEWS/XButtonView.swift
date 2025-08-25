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
    @FocusState.Binding var isFocused: Bool
    
    // MARK: - INITIALIZER
    init(isFocused: FocusState<Bool>.Binding) {
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
                .opacity(vm.showXButton() ? 1 : 0)
                .padding(.trailing, 6)
                .animation(.none, value: vm.searchText)
        }
    }
}

// MARK: - PREVIEWS
#Preview("XButtonView") {
    @Previewable @FocusState var isFocused: Bool
    XButtonView(isFocused: $isFocused)
        .environment(SearchBarViewModel(context: .sheet))
}

// MARK: - EXTENSIONS
extension XButtonView {
    // MARK: - handleTap
    private func handleTap() {
        vm.setSearchText("")
        isFocused = true
    }
}
