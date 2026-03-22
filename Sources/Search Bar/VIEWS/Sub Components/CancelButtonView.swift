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
    @Environment(\.iOSVersion) private var iOSVersion
    @Binding var text: String
    @FocusState.Binding var isFocused: Bool
    
    // MARK: - INITIALIZER
    init(text: Binding<String>, isFocused: FocusState<Bool>.Binding) {
        _text = text
        _isFocused = isFocused
    }
    
    let xMarkSize: CGFloat = 18
    let circleSize: CGFloat = 50
    
    // MARK: - BODY
    var body: some View {
        Button(role: .cancel) {
            handleTap()
        } label: {
            switch iOSVersion {
            case .iOS17:
                Text("Cancel")
                
            case .iOS26:
                Image(systemName: "xmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: xMarkSize, height: xMarkSize)
                    .font(.title2)
                    .foregroundStyle(.black)
                    .frame(width: circleSize, height: circleSize)
            }
        }
        .glassEffect(iOSVersion)
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
        .environment(\.iOSVersion, .random())
}

// MARK: - EXTENSIONS
extension CancelButtonView {
    private func handleTap() {
        isFocused = false
        text = ""
        vm.setSearchText("")
        vm.handleAnimatedCancelButtonOnSearchTextNFocusChange(isFocused: false)
    }
}

fileprivate extension View {
    @ViewBuilder
    func glassEffect(_ iOSVersion: iOSVersions) -> some View {
        switch iOSVersion {
        case .iOS17:
            self
        case .iOS26:
            if #available(iOS 26.0, *) {
                self
                    .glassEffect(.regular, in: .circle)
            } else {
                self
            }
        }
    }
}
