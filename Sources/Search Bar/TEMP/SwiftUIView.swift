//
//  SwiftUIView.swift
//  search-bar-swiftui
//
//  Created by Mr. Kavinda Dilshan on 2026-03-22.
//

import SwiftUI

struct SwiftUIView: View {
    
    let color: Color = .init(red: 32/255, green: 32/255, blue: 32/255) // <--
    
    var body: some View {
        Color(red: 51/255, green: 51/255, blue: 51/255)
            .overlay {
                ZStack {
                    Color.clear
                        .frame(width: 150, height: 50)
                    
                    Text("Search Here")
                        .overlay(alignment: .trailing) {
                            color
                                .frame(width: 50, height: 50)
                                .blur(radius: 5)
                        }
                }
                .clipped()
                .glassEffectViewModifier(color)
                .padding(.top, 700)
            }
    }
}

#Preview {
    @Previewable @State var searchText: String = " MDSFAFNKNCKSADNFKNDANSBKFNKDSANVKNKASNVKNKNSKDNV"
    
    NavigationStack {
        SwiftUIView()
            .ignoresSafeArea()
    }
    .searchable(text: $searchText, placement: .toolbar)
}

fileprivate extension View {
    @ViewBuilder
    func glassEffectViewModifier(_ color: Color) -> some View {
        if #available(iOS 26.0, *) {
            self
                .glassEffect(.regular.tint(color))
        } else {
            self
        }
    }
}
