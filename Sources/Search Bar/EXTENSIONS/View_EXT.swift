//
//  View_EXT.swift
//  search-bar-swiftui
//
//  Created by Mr. Kavinda Dilshan on 2025-08-25.
//

import SwiftUI

extension View {
    func previewModifier(context: ContextTypes) -> some View {
        self
            .environment(SearchBarViewModel(context: context))
    }
}
