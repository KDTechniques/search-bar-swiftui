//
//  SearchBar_Tests.swift
//  search-bar-swiftui
//
//  Created by Mr. Kavinda Dilshan on 2024-08-02.
//

import XCTest
import Combine
@testable import SearchBarSwiftUI

@MainActor
final class SearchBar_Tests: XCTestCase {
    
    @Published private var searchBar: SearchBarViewModel = .init(colors: ColorContextTypes.sheet)
    private var cancelable: Set<AnyCancellable> = []
    
    override func setUpWithError() throws {
        // Initialize setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Clean up resources here. This method is called after the invocation of each test method in the class.
        
        cancelable.removeAll()
    }
    
    // MARK: - test_iSearchBar_searchBarAnimation_ShouldSetPropertiesToFocusState
    /// Verifies that when the `searchBarAnimation` property is updated to the focus state,
    /// the `searchBarTrailingPadding`, `cancelButtonOffsetX`, and `cancelButtonOpacity` properties of the search bar are correctly set to their expected values.
    /// Runs the test a specified number of times to ensure consistency.
    func test_iSearchBar_searchBarAnimation_ShouldSetPropertiesToFocusState() {
        // Given
        /// Define the expected properties for the search bar when it is in the focus state.
        let state: Bool = .random()
        var text: String { state ? getRandomText(isEmpty: true) : getRandomText(isEmpty: false) }
        
        // When
        /// Call the test helper method with parameters specific to the focus state.
        test_iSearchBar_searchBarAnimation(
            searchBarTrailingPadding: 65,
            cancelButtonOffsetX: 48,
            cancelButtonOpacity: 1,
            state: state,
            text: text,
            isForFocusState: true
        )
    }
    
    // MARK: - test_iSearchBar_searchBarAnimation_ShouldSetPropertiesToUnfocusState
    /// Verifies that when the `searchBarAnimation` property is updated to the unfocus state,
    /// the `searchBarTrailingPadding`, `cancelButtonOffsetX`, and `cancelButtonOpacity` properties of the search bar are correctly set to their expected values.
    /// Runs the test a specified number of times to ensure consistency.
    func test_iSearchBar_searchBarAnimation_ShouldSetPropertiesToUnfocusState() {
        // When
        /// Call the test helper method with parameters specific to the unfocus state.
        test_iSearchBar_searchBarAnimation(
            searchBarTrailingPadding: 0,
            cancelButtonOffsetX: 53,
            cancelButtonOpacity: 0,
            state: false,
            text: "",
            isForFocusState: false
        )
    }
    
    // MARK: - test_iSearchBar_searchBarAnimation_ShouldNotFail
    /// Ensures that the search bar animation methods do not fail by running the focus and unfocus state tests multiple times in random order.
    /// This test verifies that both state tests pass without causing any errors.
    func test_iSearchBar_searchBarAnimation_ShouldNotFail() {
        // Given
        /// Define the maximum number of test attempts.
        let maxAttempts: Int = 20
        var attemptCount: Int = 0
        
        // When
        /// Randomly execute the focus and unfocus state tests to verify the robustness of the animation handling.
        for _ in 0..<maxAttempts {
            if Bool.random() {
                // Randomly call either state test to ensure both pass without failure.
                test_iSearchBar_searchBarAnimation_ShouldSetPropertiesToUnfocusState()
                test_iSearchBar_searchBarAnimation_ShouldSetPropertiesToFocusState()
            } else {
                // Randomly call either state test to ensure both pass without failure.
                test_iSearchBar_searchBarAnimation_ShouldSetPropertiesToFocusState()
                test_iSearchBar_searchBarAnimation_ShouldSetPropertiesToUnfocusState()
            }
            
            attemptCount += 1
        }
        
        //Then
        /// Check that the number of attempts matches the expected maximum number of attempts.
        XCTAssertEqual(maxAttempts, attemptCount)
    }
}

extension SearchBar_Tests {
    // MARK: - getRandomState
    private func getRandomState() -> Bool { .random() }
    
    // MARK: - getRandomText
    /// Generate a random string of text if not empty.
    private func getRandomText(isEmpty: Bool) -> String {
        guard !isEmpty else { return "" }
        
        var text: String = ""
        let range: ClosedRange<Int> = 1...(.random(in: 2...5))
        
        for _ in range {
            text.append(UUID().uuidString)
        }
        
        return text
    }
    
    // MARK: - test_iSearchBar_searchBarAnimation
    private func test_iSearchBar_searchBarAnimation(
        searchBarTrailingPadding: CGFloat,
        cancelButtonOffsetX: CGFloat,
        cancelButtonOpacity: CGFloat,
        state: Bool,
        text: String,
        isForFocusState: Bool
    ) {
        // Given
        /// Define the number of attempts for this specific test.
        let maxAttempts: Int = 2
        var attemptsCount: Int = 0
        
        for _ in 0..<maxAttempts {
            // When
            /// Create an expectation to ensure that the properties are set to the correct state after a delay.
            let expectation: XCTestExpectation = .init(description: "Should set properties to \(isForFocusState ? "Focus" : "Unfocus") state after 0.5s")
            
            searchBar.$searchBarAnimation$
                .dropFirst()
                .removeDuplicates { $0?.text == $1?.text && $0?.state == $1?.state }
                .sink { _ in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        attemptsCount += 1
                        print("Set to \(isForFocusState ? "Focus State. ✍🏻" : "Unfocus State. ✋🏻")")
                        expectation.fulfill()
                    }
                }
                .store(in: &cancelable)
            
            searchBar.searchBarAnimation = (text: text, state: state)
            
            // Then
            /// Wait for the expectation to be fulfilled and check the properties.
            wait(for: [expectation], timeout: 1)
            cancelable.removeAll()
            XCTAssertEqual(searchBar.searchBarTrailingPadding, searchBarTrailingPadding)
            XCTAssertEqual(searchBar.cancelButtonOffsetX, cancelButtonOffsetX)
            XCTAssertEqual(searchBar.cancelButtonOpacity, cancelButtonOpacity)
        }
        
        /// Verify that the expected number of attempts was made.
        XCTAssertEqual(attemptsCount, maxAttempts)
    }
}
