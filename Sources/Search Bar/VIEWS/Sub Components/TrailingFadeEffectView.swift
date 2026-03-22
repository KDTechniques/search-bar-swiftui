//
//  TrailingFadeEffectView.swift
//  search-bar-swiftui
//
//  Created by Mr. Kavinda Dilshan on 2024-07-31.
//

import SwiftUI

struct TrailingFadeEffectView: View {
    // MARK: INJECTED PROPERTIES
    @Environment(SearchBarViewModel.self) private var vm
    @Environment(\.iOSVersion) private var iOSVersion
    
    // MARK: - ASSIGNED PROPERTIES
    @FocusState.Binding var isFocused: Bool
    
    // MARK: - BODY
    var body: some View {
        let color: Color = vm.colors.backgroundColor
        
        color
            .frame(width: 35)
            .blur(radius: 1)
            .background(alignment: .trailing) { blurColor(color) }
            .background(alignment: .trailing) { plainColor(color) }
            .opacity(isFocused ? 0 : 1)
    }
}

// MARK: - PREVEIWS
#Preview("TrailingFadeEffectView") {
    @Previewable @FocusState var isFocused: Bool
    
    TrailingFadeEffectView(isFocused: $isFocused)
        .previewModifier(context: .navigation)
}

// MARK: - EXTENSIONS
extension TrailingFadeEffectView {
    private func blurColor(_ color: Color) -> some View {
        color
            .frame(width: SearchBarValues.blurEffectBlurColorWidth)
            .blur(radius: SearchBarValues.blurEffectBlurColorRadius(iOSVersion))
    }
    
    private func plainColor(_ color: Color) -> some View {
        color.frame(width: SearchBarValues.blurEffectPlainColorWidth(iOSVersion))
    }
}
