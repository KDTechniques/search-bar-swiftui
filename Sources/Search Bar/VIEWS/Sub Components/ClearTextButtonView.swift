//
//  ClearTextButtonView.swift
//  search-bar-swiftui
//
//  Created by Mr. Kavinda Dilshan on 2024-07-31.
//

import SwiftUI

struct ClearTextButtonView: View {
    // MARK: - INJECTED PROPERTIES
    @Environment(SearchBarViewModel.self) private var vm
    @Environment(\.iOSVersion) private var iOSVersion
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
            let iconSize: CGFloat = SearchBarValues.horizontalIconsSize
            
            Image(systemName: "xmark.circle.fill")
                .symbolRenderingMode(.monochrome)
                .resizable()
                .scaledToFit()
                .frame(width: iconSize, height: iconSize)
                .foregroundStyle(vm.colors.searchIconTextColor)
                .padding(.trailing, SearchBarValues.clearTextButtonTrailingPadding(iOSVersion))
                .animation(.none, value: vm.searchText)
        }
    }
}

// MARK: - PREVIEWS
#Preview("ClearTextButtonView") {
    @Previewable @FocusState var isFocused: Bool
    
    ClearTextButtonView(text: .constant(""), isFocused: $isFocused)
        .environment(SearchBarViewModel(context: .sheet))
        .environment(\.iOSVersion, .random())
}

// MARK: - EXTENSIONS
extension ClearTextButtonView {
    private func handleTap() {
        text = ""
        vm.setSearchText("")
        isFocused = true
    }
}


struct TestingPreferenceKey: PreferenceKey {
    static let defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
