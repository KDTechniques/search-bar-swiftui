//
//  SearchBarViewModel.swift
//  search-bar-swiftui
//
//  Created by Mr. Kavinda Dilshan on 2024-07-30.
//

import SwiftUI
import Combine

@MainActor
@Observable final class SearchBarViewModel {
    // MARK: - PROPERTIES
    let colors: ColorContext
    
    // MARK: - PRIVATE PROPERTIES
    var searchBarTrailingPadding: CGFloat = 0
    var cancelButtonOffsetX: CGFloat = 53
    var cancelButtonOpacity: CGFloat = 0
    
    var searchBarAnimation: (text: String, state: Bool)? { didSet { searchBarAnimation$ = searchBarAnimation } }
    @ObservationIgnored
    @Published private(set) var searchBarAnimation$: (text: String, state: Bool)?
    
    private var cancelable: Set<AnyCancellable> = []
    
    // MARK: - INITIALIZER
    init(colors: ColorContext) {
        self.colors = colors
        searchBarAnimationSubscriber()
    }
    
    // MARK: - FUNCTIONS
    
    // MARK: - searchBarAnimation
    /// Animates the appearance and disappearance of the cancel button
    /// based on the provided text and state parameters.
    private func searchBarAnimation(text: String, state: Bool) {
        if state || !text.isEmpty {
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
    
    // MARK: - searchBarAnimationSubscriber
    /// Subscribes to changes in the searchBarAnimation$ property,
    /// removes duplicate values, and throttles updates to prevent rapid, repeated changes.
    func searchBarAnimationSubscriber() {
        $searchBarAnimation$
            .removeDuplicates { $0?.text == $1?.text && $0?.state == $1?.state }
            .throttle(for: .seconds(0.5), scheduler: RunLoop.main, latest: true)
            .sink { [weak self] newValue in
                guard let self,
                      let newValue else { return }
                
                searchBarAnimation(text: newValue.text, state: newValue.state)
            }
            .store(in: &cancelable)
    }
}
