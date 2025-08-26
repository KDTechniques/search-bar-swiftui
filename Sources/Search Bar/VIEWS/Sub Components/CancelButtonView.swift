//
//  CancelButtonView.swift
//  search-bar-swiftui
//
//  Created by Mr. Kavinda Dilshan on 2024-07-31.
//

import SwiftUI

struct CancelButtonView: View {
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
            Text("Cancel")
        }
        .offset(x: vm.cancelButtonOffsetX)
        .opacity(vm.cancelButtonOpacity)
    }
}

// MARK: - PREVIEWS
#Preview("CancelButtonView") {
    @Previewable @FocusState var isFocused: Bool
    let vm: SearchBarViewModel = .init(context: .sheet)
    
    CancelButtonView(text: .constant(""), isFocused: $isFocused)
        .onAppear { vm.setCancelButtonOpacity(1.0) }
        .environment(vm)
}

// MARK: - EXTENSIONS
extension CancelButtonView {
    private func handleTap() {
        text = ""
        vm.setSearchText("")
        vm.setSearchBarAnimation(false)
        isFocused = false
    }
}
