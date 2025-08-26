//
//  DebugView.swift
//  search-bar-swiftui
//
//  Created by Mr. Kavinda Dilshan on 2025-08-26.
//

import SwiftUI

public struct DebugView: View {
    // MARK: - ASSIGNED PROPERTIES
    @State private var searchText: String = ""
    @State private var isSearching: Bool = false
    @FocusState private var isFocused: Bool
    
    // MARK: - INITIALIZER
    public init() { }
    
    // MARK: - BODY
    public var body: some View {
        VStack(spacing: 20) {
            SearchBarView(
                searchBarText: $searchText,
                placeholder: "Debug Search",
                context: .sheet,
                isSearching: isSearching
            )
            .focused($isFocused)
            
            Button("Toggle: `isSearching`") {
                isSearching.toggle()
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.extraLarge)
            
            Text("isFocused: \(isFocused)")
            
            Text("Search Text: \(searchText)")
        }
    }
}

// MARK: - PREVIEWS
#Preview("DebugView") {
    DebugView()
}
