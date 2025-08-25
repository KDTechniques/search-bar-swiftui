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
    
    // MARK: - ASSIGNED PROPERTIES
    @FocusState.Binding var isFocused: Bool
    
    // MARK: - BODY
    var body: some View {
        let color: Color = vm.colors.backgroundColor
        
        color
            .frame(width: 35)
            .blur(radius: 1)
            .background(alignment: .trailing) { TrailingBackground_1(color: color) }
            .background(alignment: .trailing) { TrailingBackground_2(color: color) }
            .opacity(isFocused ? 0 : 1)
    }
}

// MARK: - PREVEIWS
#Preview("TrailingFadeEffectView") {
    @Previewable @FocusState var isFocused: Bool
    TrailingFadeEffectView(isFocused: $isFocused)
        .environment(SearchBarViewModel(context: .sheet))
}

// MARK: - SUBVIEWS

// MARK: - TrailingBackground_1
fileprivate struct TrailingBackground_1: View {
    // MARK: - PROPERTIES
    let color: Color
    
    // MARK: - INITIALIZER
    init(color: Color) {
        self.color = color
    }
    
    //  MARK: - BODY
    var body: some View {
        color
            .frame(width: 62)
            .blur(radius: 10)
    }
}

// MARK: - TrailingBackground_2
fileprivate struct TrailingBackground_2: View {
    // MARK: - PROPERTIES
    let color: Color
    
    // MARK: - INITIALIZER
    init(color: Color) {
        self.color = color
    }
    
    //  MARK: - BODY
    var body: some View {
        color.frame(width: 30)
    }
}
