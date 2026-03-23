//
//  DismissButtonView.swift
//  search-bar-swiftui
//
//  Created by Mr. Kavinda Dilshan on 2024-07-31.
//

import SwiftUI

struct DismissButtonView: View {
    // MARK: - INJECTED PROPERTIES
    @Environment(SearchBarViewModel.self) private var vm
    @Environment(\.iOSVersion) private var iOSVersion
    @Environment(\.colorScheme) private var colorScheme
    @Binding var text: String
    @FocusState.Binding var isFocused: Bool
    
    // MARK: - INITIALIZER
    init(text: Binding<String>, isFocused: FocusState<Bool>.Binding) {
        _text = text
        _isFocused = isFocused
    }
    
    // MARK: - BODY
    var body: some View {
        Button(role: .cancel) {
            handleTap()
        } label: {
            switch iOSVersion {
            case .iOS17:
                Text("Cancel")
                
            case .iOS26:
                let xMarkSize: CGFloat = SearchBarValues.horizontalIconsSize
                let circleSize: CGFloat = SearchBarValues.containerHeight(iOSVersion)
                
                Image(systemName: "xmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: xMarkSize, height: xMarkSize)
                    .font(.title2)
                    .tint(.primary)
                    .frame(width: circleSize, height: circleSize)
            }
        }
        .glassEffectViewModifier(iOSVersion, vm: vm, colorScheme: colorScheme)
        .offset(x: vm.cancelButtonOffsetX)
        .opacity(vm.cancelButtonOpacity)
    }
}

// MARK: - PREVIEWS
#Preview("DismissButtonView") {
    @Previewable @FocusState var isFocused: Bool
    let vm: SearchBarViewModel = .init(context: .sheet, iOSVersion: .random())
    
    NavigationStack {
        DismissButtonView(text: .constant(""), isFocused: $isFocused)
            .onAppear { vm.setCancelButtonOpacity(1.0) }
            .environment(vm)
            .previewModifier(context: .navigation)
    }
    .searchable(text: .constant("Search"))
}

// MARK: - EXTENSIONS
extension DismissButtonView {
    private func handleTap() {
        isFocused = false
        text = ""
        vm.setSearchText("")
        vm.handleAnimatedCancelButtonOnSearchTextNFocusChange(isFocused: false)
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
                    .glassEffect(glass.tint(vm.colors.backgroundColor).interactive(), in: .circle)
            } else {
                self
            }
        }
    }
}
