//
//  SearchBarViewModel.swift
//  search-bar-swiftui
//
//  Created by Mr. Kavinda Dilshan on 2024-07-30.
//

import SwiftUI
import Combine

@MainActor
@Observable
final class SearchBarViewModel {
    // MARK: - INJECTED PROPERTIES
    var colors: ColorContext
    
    // MARK: - ASSIGNED PROPERTIES
    private(set) var searchBarTrailingPadding: CGFloat = 0
    private(set) var cancelButtonOffsetX: CGFloat = 53
    private(set) var cancelButtonOpacity: CGFloat = 0
    
    private(set) var searchBarAnimation: Bool? {
        didSet {
            searchBarAnimation$ = searchBarAnimation
        }
    }
    @ObservationIgnored @Published private var searchBarAnimation$: Bool?
    
    private var cancelable: Set<AnyCancellable> = []
    private(set) var isSearching: Bool = false
    private(set) var searchText: String = ""
    
    // MARK: - INITIALIZER
    init(context: ContextTypes) {
        switch context {
        case .sheet:
            self.colors = ColorContextTypes.sheet
            
        case .navigation:
            self.colors = ColorContextTypes.navigation
            
        case .custom(let colors):
            self.colors = colors
        }
        
        searchBarAnimationSubscriber()
    }
    
    // MARK: - SETTERS
    func setSearchText(_ text: String) {
        searchText = text
    }
    
    func setColors(context: ContextTypes) {
        switch context {
        case .sheet:
            self.colors = ColorContextTypes.sheet
            
        case .navigation:
            self.colors = ColorContextTypes.navigation
            
        case .custom(let colors):
            self.colors = colors
        }
    }
    
    func setIsSearching(_ value: Bool) {
        isSearching = value
    }
    
    func searchTextBinding() -> Binding<String> {
        return Binding { [weak self] in
            self?.searchText ?? ""
        } set: { [weak self] in
            self?.setSearchText($0)
        }
    }
    
    func setCancelButtonOpacity(_ opacity: CGFloat) {
        cancelButtonOpacity = opacity
    }
    
    func setSearchBarAnimation(_ boolean: Bool) {
        searchBarAnimation = boolean
    }
    
    // MARK: - PUBLIC FUNCTIONS
    func showXButton() -> Bool {
        let condition1: Bool = searchText.isEmpty
        let condition2: Bool = isSearching
        
        return !condition1 && !condition2
    }
    
    // MARK: - PRIVATE FUNCTIONS
    
    /// Animates the appearance and disappearance of the cancel button
    /// based on the provided text and state parameters.
    private func searchBarAnimation(_ boolean: Bool) {
        if boolean || !searchText.isEmpty {
            // Animate to show the cancel button
            withAnimation(.smooth(duration: 0.3)) {
                searchBarTrailingPadding = 65
                cancelButtonOffsetX = 48
                cancelButtonOpacity = 1
            }
        } else {
            // Animate to hide the cancel button
            withAnimation(.smooth(duration: 0.3)) {
                searchBarTrailingPadding = 0
                cancelButtonOffsetX = 53
                cancelButtonOpacity = 0
            }
        }
    }
    
    /// Subscribes to changes in the searchBarAnimation$ property,
    /// removes duplicate values, and throttles updates to prevent rapid, repeated changes.
    private func searchBarAnimationSubscriber() {
        $searchBarAnimation$
            .removeDuplicates()
            .throttle(for: .seconds(0.5), scheduler: RunLoop.main, latest: true)
            .sink { [weak self] newValue in
                guard let self,
                      let newValue else { return }
                
                searchBarAnimation(newValue)
            }
            .store(in: &cancelable)
    }
}
