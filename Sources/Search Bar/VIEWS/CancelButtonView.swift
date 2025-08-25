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
    
    CancelButtonView(isFocused: $isFocused)
        .onAppear { vm.setCancelButtonOpacity(1.0) }
        .environment(vm)
}

// MARK: - EXTENSIONS
extension CancelButtonView {
    // MARK: - handleTap
    private func handleTap() {
        vm.setSearchText("")
        vm.setSearchBarAnimation(false)
        isFocused = false
    }
}
