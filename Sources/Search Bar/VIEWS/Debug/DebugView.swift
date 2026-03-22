//
//  DebugView.swift
//  search-bar-swiftui
//
//  Created by Mr. Kavinda Dilshan on 2025-08-26.
//

import SwiftUI

public struct DebugView: View {
    // MARK: - INJECTED PROPERTIES
    let iOSVersion: iOSVersions
    
    // MARK: - ASSIGNED PROPERTIES
    @State private var searchText: String = ""
    @State private var isSearching: Bool = false
    @FocusState private var isFocused: Bool
    
    // MARK: - INITIALIZER
    public init(iOSVersion: iOSVersions) {
        self.iOSVersion = iOSVersion
    }
    
    // MARK: - BODY
    public var body: some View {
        VStack(spacing: 20) {
            SearchBarView(
                iOSVersion: iOSVersion,
                searchBarText: $searchText,
                placeholder: "Debug Search",
                context: .navigation,
                isSearching: isSearching
            )
            .focused($isFocused)
            
            Button("Toggle: `isSearching`") {
                isSearching.toggle()
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            
            VStack(alignment: .leading) {
                Text("isFocused: \(isFocused.description)")
                Text("Search Text: \(searchText)")
            }
        }
    }
}

// MARK: - PREVIEWS
#Preview("DebugView") {
    @Previewable @State var searchText: String = ""
    
    let iOSVersion: iOSVersions = {
        if #available(iOS 26.0, *) {
            return .iOS26
        } else {
            return .iOS17
        }
    }()
    
    NavigationStack {
        DebugView(iOSVersion: iOSVersion)
            .padding(.horizontal, 5)
            .padding(.bottom, 500)
    }
    .searchable(
        text: $searchText,
        placement: .navigationBarDrawer,
        prompt: .init("Debug Search")
    )
}
