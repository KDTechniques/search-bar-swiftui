//
//  CircularProgressView.swift
//  search-bar-swiftui
//
//  Created by Mr. Kavinda Dilshan on 2025-08-25.
//

import SwiftUI

struct CircularProgressView: View {
    // MARK: - INJECTED PROPERTIES
    @Environment(SearchBarViewModel.self) private var vm
    
    // MARK: - BODY
    var body: some View {
        ProgressView()
            .scaleEffect(0.8)
            .padding(.trailing, 6)
    }
}

// MARK: - PREVIEWS
#Preview("CircularProgressView") {
    CircularProgressView()
        .previewModifier(context: .sheet)
}
